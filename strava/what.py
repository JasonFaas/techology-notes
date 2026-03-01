import argparse
import csv
import json
import time
import urllib.parse
import webbrowser
from datetime import datetime, timezone
from http.server import BaseHTTPRequestHandler, HTTPServer
import requests
from pathlib import Path

CONFIG_PATH = Path("/Users/jasonoclaf/.strava/credentials")
API_BASE = "https://www.strava.com/api/v3"
REDIRECT_PORT = 8282
REDIRECT_URI = f"http://localhost:{REDIRECT_PORT}/auth"

# Target distances in meters
TARGET_DISTANCES = [
    ("400m", 400.0),
    ("800m", 800.0),
    ("1km", 1000.0),
    ("1mi", 1609.34),
    ("2mi", 3218.69),
    ("5km", 5000.0),
    ("10km", 10000.0),
    ("10mi", 16093.4),
    ("20km", 20000.0),
    ("half-marathon", 21097.5),
]

def load_config():
    with CONFIG_PATH.open() as f:
        return json.load(f)

def save_config(cfg):
    with CONFIG_PATH.open("w") as f:
        json.dump(cfg, f, indent=2)

def refresh_access_token(cfg):
    """Refresh short-lived access token using stored refresh token."""
    resp = requests.post(
        "https://www.strava.com/oauth/token",
        data={
            "client_id": cfg["client_id"],
            "client_secret": cfg["client_secret"],
            "grant_type": "refresh_token",
            "refresh_token": cfg["refresh_token"],
        },
    )
    resp.raise_for_status()
    data = resp.json()
    cfg["access_token"] = data["access_token"]
    cfg["refresh_token"] = data["refresh_token"]
    cfg["expires_at"] = data["expires_at"]
    save_config(cfg)
    return cfg

def get_authenticated_session():
    cfg = load_config()
    # Refresh if missing or expired
    if "access_token" not in cfg or time.time() > cfg.get("expires_at", 0):
        cfg = refresh_access_token(cfg)
    sess = requests.Session()
    sess.headers.update({"Authorization": f"Bearer {cfg['access_token']}"})
    return sess

def _check_auth_error(r):
    if r.status_code == 401:
        errors = r.json().get("errors", [])
        if any(e.get("field") == "activity:read_permission" for e in errors):
            raise RuntimeError(
                "Token is missing activity:read scope. Run: python what.py --auth"
            )

def get_latest_activity(sess):
    r = sess.get(f"{API_BASE}/athlete/activities", params={"per_page": 1, "page": 1})
    _check_auth_error(r)
    r.raise_for_status()
    activities = r.json()
    if not activities:
        raise RuntimeError("No activities found")
    return activities[0]

def get_activities_for_year(sess, year=None):
    params = {"per_page": 100, "page": 1}
    if year:
        params["after"]  = int(datetime(year,     1, 1, tzinfo=timezone.utc).timestamp())
        params["before"] = int(datetime(year + 1, 1, 1, tzinfo=timezone.utc).timestamp())
    activities = []
    while True:
        r = sess.get(f"{API_BASE}/athlete/activities", params=params)
        _check_auth_error(r)
        r.raise_for_status()
        batch = r.json()
        if not batch:
            break
        activities.extend(batch)
        params["page"] += 1
    return [a for a in activities if a.get("type") == "Run"]

def get_streams(sess, activity_id):
    # We need time, distance, heart rate
    params = {
        "keys": "time,distance,heartrate",
        "key_by_type": "true",
    }
    r = sess.get(f"{API_BASE}/activities/{activity_id}/streams", params=params)
    r.raise_for_status()
    data = r.json()
    # Strava returns dict keyed by stream type when key_by_type=true
    return data

def compute_max_hr(streams):
    hr_stream = streams.get("heartrate")
    if not hr_stream:
        return None
    return max(hr_stream["data"])

def compute_fastest_intervals(streams):
    dist_stream = streams.get("distance")
    time_stream = streams.get("time")
    if not dist_stream or not time_stream:
        return {}

    distances = dist_stream["data"]  # meters
    times = time_stream["data"]      # seconds

    results = {}
    for label, target_m in TARGET_DISTANCES:
        best_time = None
        start_idx = 0
        # Sliding window over distances
        for end_idx in range(len(distances)):
            # Move start_idx until window distance <= target
            while start_idx < end_idx and distances[end_idx] - distances[start_idx] > target_m:
                start_idx += 1
            window_dist = distances[end_idx] - distances[start_idx]
            if window_dist >= target_m * 0.99:  # allow small tolerance
                window_time = times[end_idx] - times[start_idx]
                if best_time is None or window_time < best_time:
                    best_time = window_time
        if best_time is not None:
            results[label] = best_time
    return results

def format_time(seconds):
    seconds = int(seconds)
    h = seconds // 3600
    m = (seconds % 3600) // 60
    s = seconds % 60
    return f"{h}:{m:02d}:{s:02d}"

def activity_date(activity):
    return datetime.fromisoformat(
        activity["start_date_local"].replace("Z", "+00:00")
    ).strftime("%Y-%m-%d")

def process_activity(sess, activity):
    aid = activity["id"]
    date = activity_date(activity)
    streams = get_streams(sess, aid)
    max_hr = compute_max_hr(streams)
    fastest = compute_fastest_intervals(streams)

    hr_str = f"{max_hr:.0f}" if max_hr is not None else ""
    interval_str = ", ".join(
        f"{lbl}: {format_time(fastest[lbl])}" for lbl in fastest
    ) or "no interval data"
    print(f"  {date}  HR={hr_str or 'n/a'}  {interval_str}")

    row = {"Date": date, "Max-HR": hr_str}
    for label, _ in TARGET_DISTANCES:
        row[label] = format_time(fastest[label]) if label in fastest else ""
    return row

def write_csv(rows):
    filename = Path.home() / "Desktop" / f"best-efforts-{int(time.time())}.csv"
    headers = ["Date", "Max-HR"] + [label for label, _ in TARGET_DISTANCES]
    with open(filename, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=headers)
        writer.writeheader()
        writer.writerows(rows)
    return filename

def main(year=None):
    sess = get_authenticated_session()

    if year == "all":
        activities = get_activities_for_year(sess)
        if not activities:
            print("No runs found.")
            return
        activities.sort(key=lambda a: a["start_date_local"])
        print(f"Found {len(activities)} runs across all time. Fetching streams...")
    elif year:
        activities = get_activities_for_year(sess, year)
        if not activities:
            print(f"No runs found for {year}.")
            return
        activities.sort(key=lambda a: a["start_date_local"])
        print(f"Found {len(activities)} runs for {year}. Fetching streams...")
    else:
        activities = [get_latest_activity(sess)]
        print(f"Fetching latest run ({activity_date(activities[0])})...")

    rows = []
    for i, activity in enumerate(activities, 1):
        if year:
            print(f"[{i}/{len(activities)}]", end=" ")
        rows.append(process_activity(sess, activity))

    filename = write_csv(rows)
    print(f"\nSaved {len(rows)} row(s) to {filename}")

def authorize():
    """Run the OAuth flow to get a new token with activity:read_all scope."""
    cfg = load_config()
    auth_url = (
        "https://www.strava.com/oauth/authorize?"
        + urllib.parse.urlencode({
            "client_id": cfg["client_id"],
            "response_type": "code",
            "redirect_uri": REDIRECT_URI,
            "approval_prompt": "force",
            "scope": "activity:read_all",
        })
    )

    auth_code = None

    class Handler(BaseHTTPRequestHandler):
        def log_message(self, *args):
            pass  # silence request logs

        def do_GET(self):
            nonlocal auth_code
            parsed = urllib.parse.urlparse(self.path)
            params = urllib.parse.parse_qs(parsed.query)
            if "code" in params:
                auth_code = params["code"][0]
                self.send_response(200)
                self.end_headers()
                self.wfile.write(b"<h1>Authorized! You can close this tab.</h1>")
            else:
                self.send_response(400)
                self.end_headers()
                self.wfile.write(b"Missing code parameter.")

    server = HTTPServer(("localhost", REDIRECT_PORT), Handler)
    print(f"Opening browser for Strava authorization...")
    webbrowser.open(auth_url)
    server.handle_request()  # handle exactly one request then stop

    if not auth_code:
        raise RuntimeError("Did not receive authorization code.")

    resp = requests.post(
        "https://www.strava.com/oauth/token",
        data={
            "client_id": cfg["client_id"],
            "client_secret": cfg["client_secret"],
            "code": auth_code,
            "grant_type": "authorization_code",
        },
    )
    resp.raise_for_status()
    data = resp.json()
    cfg["access_token"] = data["access_token"]
    cfg["refresh_token"] = data["refresh_token"]
    cfg["expires_at"] = data["expires_at"]
    save_config(cfg)
    print("Authorization successful. Credentials saved.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Export Strava run best efforts to CSV.")
    parser.add_argument("--auth", action="store_true", help="Re-authorize with Strava.")
    parser.add_argument("--year", help="Fetch all runs for a given year (e.g. 2025) or 'all'.")
    args = parser.parse_args()

    if args.auth:
        authorize()
    else:
        year = args.year
        if year and year != "all":
            year = int(year)
        main(year=year)

