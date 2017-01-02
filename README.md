# Source Tree Custom Actions

Open Preferences by `⌘``,` and then click on the "Custom Actions" tab:

![](images/custom_actions.png)

From here you can "Add", "Edit" or "Remove" custom actions for source tree.

![](images/custom_actions_add.png)

This repo constains a list of useful shell scripts that can be used as custom actions in source tree. 

## Delete Merged Branches

Delete all branches that are merged to **current** branch, **master** branch, **dev** branch or **develop** branch. By default, this script only delete removed branches locally. If we want to also remove the merged branch in the remote, we can pass in the remote name as parameter.

* script: `delete_removed_branches.sh`
* suggested shortcut: `fn``-`
* parameter: remote name (optional)

## Make Zombie Branch

Rename the current branch to `zombie/YYYY-MMM-DD/HH-MM-SS/{Current Branch Name}`. The idea is to archive a branch instead of deleting it. It is nicer to put the branches in folder start with letter "z" instead of "a" (archive) because Source Tree will order the branches by lexical order. 

* Script: `make_zombie.sh`
* suggested shortcut: `fn``A`

## Kill Zombies

Zombie branches that are older than 2 months will be  deleted. 

* Script: `kill_zombies.sh`
* suggested shortcut: `fn``K`

## Force Push Current Branch To Remote

You can enable force push from source tree directly. 

![](images/force_push.png)

On one hand, force push is consider a dangerous operation since it will overwrite the history in the remote; on the other hand, force push is a good tool to keep your commit history clean. This feature is useful when being used along with `git amend`. 

![](images/amend.png)

By default, this script will push to orign remote. But you can specify your remote name in the parameter. 

* script: `force_push_current_branch.sh`
* parameter: remote name (optional)
* suggested shortcut: `fn``P`

## Undo Last Commit

Sometime we need to switch to a different branch to check some code, with a colleague for example. Howeve, you cannot do that if you have some uncommited changes. With this script, you can make a dummy commit just to save the WIP changes. And when you come back to this branch, you can simply undo the last commit. 

Just in case we call this script by mistake, the script will make a archive (or zombie) before undoing the last commit so that we won't lost any commit message by accident.

You can call this script multiple time to undo multiple commits.

* script: `undo_last_commit.sh`
* suggested shortcut: `fn``Z`
