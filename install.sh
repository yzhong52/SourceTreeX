#!/bin/bash

BASE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
INSTALL_DIR="/usr/local/bin"
PREFIX="source_tree_"

echo "Base directory is: "$BASE_PATH

# Change permission for all the shell scripts in the bin folder
chmod -R -v a+rwx $BASE_PATH/bin/*.sh

for filepath in $BASE_PATH/bin/*.sh; do
    filename=$(basename $filepath .sh)
    ln -n $filepath $INSTALL_DIR/source_tree_$filename 
done

echo "Created symbolic links:"
ls $INSTALL_DIR/source_tree_*

cp actions.plist ~/Library/Application\ Support/SourceTree/actions.plist
