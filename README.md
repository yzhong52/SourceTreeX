# Source Tree Custom Actions

This [GitHub repo](https://github.com/yzhong52/SourceTreeX) contains a list of useful source tree custom actions. Building with existing git command, it extends the source tree functionalities. For example, you can keep the git repo clean with **delete merged branches**; and you can **undo last commit** if you made a mistake. 

To use the custom actions here, simply checkout the repo on your machine. In SourceTree, open Preferences by <kbd>⌘</kbd> + <kbd>,</kbd> and then click on the "Custom Actions" tab:

![](images/custom_actions.png)

From there you can "Add", "Edit" or "Remove" custom actions for source tree.

![](images/custom_actions_add.png)

Type in whatever you want in the Menu Caption. It is recommended to select both the check boxes of "Open in Separate Window" and "Show Full Output" so that it is easier to capture errors if there is any. 

Ane here are the available actions in this repo:

## Remove Merged Branches

Delete all branches that are merged to **current** branch, **master** branch, **dev** branch or **develop** branch. By default, this script only delete removed branches locally. If we want to also remove the merged branch in the remote, we can pass in the remote name as parameter.

* Script: `remove_merged_branches.sh`
* Recommended shortcut: <kbd>fn</kbd> + <kbd>-</kbd>
* Parameter: remote name (optional)

## Make Zombie Branch

Rename the current branch to `zombie/YYYY-MMM-DD/HH-MM-SS/{Current Branch Name}`. The idea is to archive a branch instead of deleting it. It is nicer to put the branches in folder start with letter "z" (zombie) instead of "a" (archive) because Source Tree will order the branches by lexical order. 

* Script: `make_zombie.sh`
* Recommended shortcut: <kbd>fn</kbd> + <kbd>A</kbd>

![](images/branches.png)

## Clean Up Zombie Branches

Zombie branches that are older than 2 months will be deleted. 

* Script: `kill_zombies.sh`

## Force Push Current Branch To Remote

By default, this script will push the `orign` remote. But you can specify your remote name in the parameter. 

* Script: `push_current_branch.sh`
* Parameter: remote name (optional)
* Recommended shortcut: <kbd>fn</kbd> + <kbd>P</kbd>

## Force Push Current Branch To Remote

You can enable force push from source tree directly. 

![](images/force_push.png)

On one hand, force push is consider a dangerous operation since it will overwrite the history in the remote; on the other hand, force push is a handy to keep the commit history clean. This feature is useful when being used along with `git amend`. 

![](images/amend.png)

By default, this script will push to `orign` remote. But you can specify your remote name in the parameter. 

* Script: `force_push_current_branch.sh`
* Parameter: remote name (optional)
* Recommended shortcut: <kbd>fn</kbd> + <kbd>F</kbd>

## Undo Last Commit

Sometime we need to switch to a different branch ad-hocly. However, we cannot do that with uncommited changes. Using this script, we can make a dummy commit to save the work-in-progess changes. And later on, after we finish the bussiness with the other branch, we can switch back to this branch, and simply undo the last commit. 

Just in case we call this script by mistake, the script will make a archive (or zombie) before undoing the last commit.

Also, you can call this script multiple time to undo multiple commits.

* Script: `undo_last_commit.sh`
* Recommended shortcut: <kbd>fn</kbd> + <kbd>Z</kbd>

## Update Master

This allows you to update **master** branch from a different branch. It is very userful in combination of `git rebase master`. Normally, before submiting a pull request, we will update master (with this script) and rebase on the updated master branch. 

* Script: `update_master.sh`
* Recommended shortcut: <kbd>fn</kbd> + <kbd>M</kbd>
