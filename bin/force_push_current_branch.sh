#!/bin/bash

if [ $1 == "" ]; then
    remote_name=origin
else 
	remote_name=$1
fi

current_branch_name=$(git rev-parse --abbrev-ref HEAD)

echo "Force push branch '$current_branch_name' to remote '$remote_name'"
git push --force $remote_name $current_branch_name

echo "Force Push Done. "
