#!/bin/bash

current_branch_name=$(git rev-parse --abbrev-ref HEAD)

# Make sure we don't make a zombie branch repeatedly
if [[ $current_branch_name == zombie* ]]; then
	>&2 echo "Branch '"$current_branch_name"' is already a zombie"
	exit 1
fi

zombie_name="zombie/$(date +%Y-%b-%d/%H-%M-%S)/$current_branch_name"

echo "Rename branch from '$current_branch_name' to '$zombie_name'"
git branch -m "$current_branch_name" "$zombie_name"

echo "Stop tracking branch"
git branch --unset-upstream

echo "Make Zombie Done. "
