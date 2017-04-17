#!/bin/bash 

echo "Kill zombies that are older than 30 days. "

# http://stackoverflow.com/a/10325758/1035008
for zombie_branch in $(git branch | grep zombie*); do
  
  # http://stackoverflow.com/a/5396755/1035008
  if [[ -z $(git log -1 --since='30 days ago' -s $zombie_branch) ]]; then
    git branch -D $zombie_branch
  else 
  	echo $zombie_branch" will live on"
  fi
done

echo "Kill Zombies Done. "
