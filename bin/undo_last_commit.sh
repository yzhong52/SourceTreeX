#!/bin/bash

base_dir=$(dirname "$0")

current_branch_name=$(git rev-parse --abbrev-ref HEAD)

sh $base_dir"/make_zombie.sh"

git checkout -b "$current_branch_name"

# The make zombie script will remove the remote tracking branch from the current
# branch. We should add that tracking branch for this undo last commit command.
git branch -u origin/"$current_branch_name"

git reset --soft HEAD~1

echo "Done."
