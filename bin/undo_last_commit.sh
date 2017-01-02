#!/bin/bash

base_dir=$(dirname "$0")

current_branch_name=$(git rev-parse --abbrev-ref HEAD)

sh $base_dir"/make_zombie.sh"

git branch "$current_branch_name"

git reset --soft HEAD~1

echo "Done."
