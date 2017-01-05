#!/bin/bash

echo ""
echo "Remove Merged Branches Begin... "

remote_name=$1

current_branch_name=$(git rev-parse --abbrev-ref HEAD)

all_branches="$current_branch_name master develop dev"

# Remove duplicates
all_branches=$(echo $all_branches | xargs -n1 | sort -u | xargs)

# http://stackoverflow.com/a/17841619/1035008
function join_by { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }
echo "Branches to check: "$(join_by ', ' $all_branches)

for branch_name in $all_branches; do
  exists=$(git show-ref refs/heads/$branch_name)
  if [ -n "$exists" ]; then
    echo "Delete branches that is merged to '$branch_name'..."
    git checkout --quiet $branch_name
    git branch --merged | egrep -v "(^\*|master|dev|develop)" | xargs git branch -d --verbose

    # http://stackoverflow.com/a/6592241/1035008
    if [[ ! -z $remote_name ]]; then
      # Update local ref 
      git -c fetch --prune $remote_name

      echo "Delete branches that is merged to '$branch_name' in remote '$remote_name'..."
      git branch --remote --merged | egrep -v "(^\*|master|dev|develop)" | grep "^  $remote_name/" | sed "s/$remote_name\///" | xargs git push --delete $remote_name
    fi

  else
    echo "Skipping branch '$branch_name'..."
  fi
done

git checkout --quiet $current_branch_name

echo "Remove Merged Branches Done. "
