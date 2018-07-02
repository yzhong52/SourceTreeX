#!/bin/bash 

function update() {
    # 
    # Output will be the following if the remote branch doesn't exit
    # 
    #    fatal: bad sha1 reference remotes/origin/stable
    # 
    if git show-branch remotes/origin/$1 &> /dev/null; then
        echo "✅ Update branch '"$1"'."
        git fetch origin $1:$1
    else
        echo "❌ Skip branch '"$1"' since it doesn't exist."
    fi
}

update master
update stable
