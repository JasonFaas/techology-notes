# 1. Remove the keyboard from the options list

# 2. Remove the Squirrel.app itself
sudo rm -rf "/Library/Input Methods/Squirrel.app"

# 3. Delete user-specific Rime configurations and dictionaries
rm -rf ~/Library/Rime/

# 4. Remove system-wide dictionaries (if any exist)
sudo rm -rf /Library/Rime/

# 5. logout and log back in
