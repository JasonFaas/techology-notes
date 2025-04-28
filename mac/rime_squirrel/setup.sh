# first, verify that Rime directory exists
# note that it has to be installed, ideally from https://rime.im/, though brew is available. `brew install --cask squirrel`
# and also has to be run at least once (add the keyboard layout and switch to it and run a basic test)

# verify folder exists at ~/Library/Rime
if [ ! -d ~/Library/Rime ]; then
  echo "Rime directory does not exist. Please install Rime and run it at least once."
  exit 1
fi

# move the file default.custom.yaml to the Rime directory
mv $HOME/Code/1/techology-notes/mac/rime_squirrel/default.custom.yaml ~/Library/Rime/

# Deploy the updated configuration through the keyboard menu
# Untested: may be able to run with `rime_deployer --deploy` or `/Library/Input\ Methods/Squirrel.app/Contents/MacOS/Squirrel --reload`
# Verify that multiple yaml files exist in the Rime/build directory that were not there before


