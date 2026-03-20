#!/usr/bin/env python3
"""Output battery info for the laptop and connected Bluetooth devices."""

import json
import re
import subprocess


def get_laptop_battery():
    result = subprocess.run(["pmset", "-g", "batt"], capture_output=True, text=True)
    m = re.search(r"(\d+)%;?\s*([\w ]+);", result.stdout)
    if m:
        return {"name": "MacBook", "minor_type": "Laptop", "battery": f"{m.group(1)}%"}
    return {"name": "MacBook", "minor_type": "Laptop", "battery": "N/A"}


def get_bluetooth_devices():
    result = subprocess.run(
        ["system_profiler", "SPBluetoothDataType", "-json"],
        capture_output=True, text=True
    )
    bt = json.loads(result.stdout)["SPBluetoothDataType"][0]
    devices = {}
    for entry in bt.get("device_connected", []):
        for name, info in entry.items():
            devices[name] = {
                "name": name,
                "minor_type": info.get("device_minorType", ""),
                "battery": None,
            }
    return devices


def get_bt_battery_levels():
    result = subprocess.run(
        ["ioreg", "-r", "-l", "-n", "AppleDeviceManagementHIDEventService"],
        capture_output=True, text=True
    )
    batteries = {}
    current_product = None
    for line in result.stdout.splitlines():
        m = re.search(r'"Product"\s*=\s*"(.+?)"', line)
        if m:
            current_product = m.group(1)
        m = re.search(r'"BatteryPercent"\s*=\s*(\d+)', line)
        if m and current_product:
            batteries[current_product] = int(m.group(1))
    return batteries


def main():
    devices = get_bluetooth_devices()
    batteries = get_bt_battery_levels()

    for name, info in devices.items():
        if name in batteries:
            info["battery"] = batteries[name]

    bt_output = [
        {
            "name": d["name"],
            "minor_type": d["minor_type"],
            "battery": f"{d['battery']}%" if d["battery"] is not None else "N/A",
        }
        for d in sorted(devices.values(), key=lambda x: x["name"])
    ]

    output = [get_laptop_battery()] + bt_output
    print(json.dumps(output, indent=2))


if __name__ == "__main__":
    main()
