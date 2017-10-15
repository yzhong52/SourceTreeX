#!/bin/bash

echo ""
echo ""
echo "Safe force push begin... "

if [ -z "$1" ]; then
    echo "No argument supplied. Use 'origin' as default remote. "
    remote_name=origin
else
    remote_name=$1
fi
echo "Remote name '$remote_name'. "

branch_name=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch name '$branch_name'. "

echo "Pushing branch '$branch_name' to remote '$remote_name'... "
git push $remote_name $branch_name 
if [ $? -eq 0 ]; then
    echo "Pushed branch '$branch_name' to remote '$remote_name' done. "
    exit 0
else
    echo "Failed to push. Trying force push ..."
fi

set -e

git fetch $remote_name

remote_branch=$remote_name"/"$branch_name
echo "Remote branch is '$remote_branch'"

echo "+--------+--------------------------------------------+"
echo "| Hash   | Value                                      |"
echo "+--------+--------------------------------------------+"
local_hash=$(git rev-parse @)
echo "| Local  | '$local_hash' |"

remote_hash=$(git rev-parse "$remote_branch")
echo "| Remote | '$remote_hash' |"

base_hash=$(git merge-base @ "$remote_branch")
echo "| Base   | '$base_hash' |"
echo "+--------+--------------------------------------------+"

if [ $local_hash = $remote_hash ]; then
    echo "Up to date. "
elif [ $local_hash = $base_hash ]; then
    echo "Local branch is behind remote. Need to pull. "
    exit 1
elif [ $remote_hash = $base_hash ]; then
    echo "Need to push. "
    git push $remote_name $branch_name
else
    echo "Branch diverged. Need to force push. "

    zombie_name="zombie/$(date +%Y-%b-%d/%H-%M-%S)/$branch_name"
    echo "Rename remote branch '$remote_name/$branch_name' to '$remote_name/$zombie_name'. "
    git push $remote_name $remote_name/$branch_name:refs/heads/$zombie_name

    echo "Force push branch '$branch_name' to remote '$remote_name'. "
    git push --force-with-lease $remote_name $branch_name
fi

echo "Safe force push done. "
