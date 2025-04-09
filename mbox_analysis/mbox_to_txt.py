import mailbox
import os
import re
from bs4 import BeautifulSoup  # Make sure to install: pip install beautifulsoup4

def sanitize_filename(s):
    return re.sub(r'[\\/*?:"<>|]', "", s)

def extract_body(msg):
    if msg.is_multipart():
        plain_body = None
        html_body = None

        for part in msg.walk():
            content_type = part.get_content_type()
            content_disposition = str(part.get("Content-Disposition"))

            if "attachment" in content_disposition:
                continue

            payload = part.get_payload(decode=True)
            if payload is None:
                continue

            decoded = payload.decode(errors="replace")

            if content_type == "text/plain" and not plain_body:
                plain_body = decoded
            elif content_type == "text/html" and not html_body:
                html_body = decoded

        if plain_body:
            return plain_body
        elif html_body:
            # Strip HTML tags
            return BeautifulSoup(html_body, "html.parser").get_text()
        else:
            return ""
    else:
        payload = msg.get_payload(decode=True)
        if payload:
            return payload.decode(errors="replace")
        else:
            return ""

def mbox_to_txt(mbox_file, output_dir="emails_txt"):
    os.makedirs(output_dir, exist_ok=True)
    mbox = mailbox.mbox(mbox_file)

    for i, msg in enumerate(mbox):
        subject = msg["subject"] or "No Subject"
        subject = sanitize_filename(subject)
        from_ = msg["from"]
        to = msg["to"]
        date = msg["date"]

        body = extract_body(msg)

        filename = f"{i+1:05d}_{subject[:50]}.txt"
        filepath = os.path.join(output_dir, filename)

        with open(filepath, "w", encoding="utf-8") as f:
            f.write(f"Subject: {subject}\n")
            f.write(f"From: {from_}\n")
            f.write(f"To: {to}\n")
            f.write(f"Date: {date}\n\n")
            f.write(body)

        print(f"Saved: {filename}")

if __name__ == "__main__":
    # Replace with your actual mbox filename
    mbox_path = "/Users/jasonoclaf/Downloads/Takeout/Mail/Maayot.mbox"
    my_output_dir = "/Users/jasonoclaf/Downloads/New_Mail/"
    mbox_to_txt(mbox_path, my_output_dir)
