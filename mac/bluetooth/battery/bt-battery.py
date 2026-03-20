#!/usr/bin/env python3
"""List all Bluetooth devices with name, connection status, minor type, and battery level."""

import json
import re
import subprocess


def get_device_info():
    """Get device list from system_profiler."""
    result = subprocess.run(
        ["system_profiler", "SPBluetoothDataType", "-json"],
        capture_output=True, text=True
    )
    data = json.loads(result.stdout)
    bt = data["SPBluetoothDataType"][0]

    devices = {}
    for status_key, connected in [("device_connected", True), ("device_not_connected", False)]:
        for entry in bt.get(status_key, []):
            for name, info in entry.items():
                devices[name] = {
                    "name": name,
                    "connected": connected,
                    "minor_type": info.get("device_minorType", ""),
                    "address": info.get("device_address", ""),
                    "battery": None,
                }
    return devices


def get_battery_levels():
    """Get battery levels from ioreg (AppleDeviceManagementHIDEventService)."""
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
    devices = get_device_info()
    batteries = get_battery_levels()

    for name, info in devices.items():
        if name in batteries:
            info["battery"] = batteries[name]

    output = [
        {
            "name": d["name"],
            "minor_type": d["minor_type"],
            "battery": f"{d['battery']}%" if d["battery"] is not None else "N/A",
        }
        for d in sorted(devices.values(), key=lambda x: x["name"])
        if d["connected"]
    ]

    print(json.dumps(output, indent=2))


if __name__ == "__main__":
    main()
