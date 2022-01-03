#!/bin/bash

# Abort script on the first error
set -e

BASE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
INSTALL_DIR="/usr/local/bin"
PREFIX="source_tree_"
# TODO: actions are now moved to
# /Users/<username>/Library/Application Support/SourceTree/actions.plist
SOURCETREE_DIR=/Applications/Sourcetree.app/Contents
NOW=$(date '+%Y-%m-%d_%H.%M.%S')


echo "Base directory is: "$BASE_PATH

# Change permission for all the shell scripts in the bin folder
chmod -R -v a+rwx $BASE_PATH/bin/*.sh

for filepath in $BASE_PATH/bin/*.sh; do
    filename=$(basename $filepath .sh)
    # TODO: On macOS 12 and above, this require sudo
    ln -fs $filepath $INSTALL_DIR/source_tree_$filename
done

echo "Created symbolic links:"
# ls $INSTALL_DIR/source_tree_*

# Make a backup
echo "Making backup for file $SOURCETREE_DIR/actions.plist"
if [ -f "$SOURCETREE_DIR/actions.plist" ]; then
    mkdir -p actions_backups
    cp "$SOURCETREE_DIR/actions.plist" "actions_backups/$NOW.plist"
fi

# Update custom actions
cp actions.plist "$SOURCETREE_DIR/actions.plist"

echo "Done."
