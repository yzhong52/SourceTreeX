#!/bin/bash 

echo "Kill all zombies that are older than 30 days. "

# Delete all branches that are more than X days/weeks old
# http://stackoverflow.com/a/5396755/1035008
for zombie_branch in $(git branch | grep zombie*); do
  if [[ -z $(git log -1 --since='30 days ago' -s $zombie_branch) ]]; then
    git branch -D $zombie_branch
    echo "[Slayed]   "$zombie_branch
  else 
  	echo "[Survived] "$zombie_branch
  fi
done

echo "Kill Zombies Done. "
