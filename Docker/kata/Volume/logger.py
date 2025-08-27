import time
import os

log_dir = "/app/logs"
os.makedirs(log_dir, exist_ok=True)

log_file = os.path.join(log_dir, "output.log")

while True:
    with open(log_file, "a") as f:
        f.write(f"Log entry at {time.ctime()}\n")
    print(f"Wrote log at {time.ctime()}")
    time.sleep(5)

