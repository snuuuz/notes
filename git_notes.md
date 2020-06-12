# Git Notes

## Sync local branch with remote without checking out local branch first
```
git fetch origin dev:dev            # Sync local dev     to remote dev
git fetch origin staging:staging    # Sync local staging to remote staging
```
[Reference](https://stackoverflow.com/a/12276041)    


## Fast forward a branch without checking it out
```
git fetch . dev:Docs  # Fast forward branch Docs to dev.
```
Based on [Work for fast-forward merges only](https://stackoverflow.com/a/17722977/2868437).


## Merge without fast-forwarding:

    git merge  --no-ff --no-commit dev


## Branches and Status
```
git branch -r --no-merged origin/dev  # Lists remote branches not merged into remote dev yet
git branch    --no-merged        dev  # List local branches not merged into dev yet
```
[Reference](https://stackoverflow.com/a/12276041)    


## Stash a single file

If you do not want to specify a message with your stashed changes, pass the filename after a double-dash.

    $ git stash -- filename.ext

However, if you do want to specify a message, use push.

    git stash push -m "describe changes to filename.ext" filename.ext

If it's an untracked/new file, you will have to stage it first.

[Reference](https://stackoverflow.com/a/55073847)    


## Rename local and remote branch
See <https://www.w3docs.com/snippets/git/how-to-rename-git-local-and-remote-branches.html>.
Example to rename branch from `bug10` to `bug/10` to take advantage of grouping:
```
$ git status
On branch bug10
Your branch is up-to-date with 'origin/bug10'.
nothing to commit, working tree clean

$ git branch -m bug/10
$ git status
On branch bug/10
Your branch is up-to-date with 'origin/bug10'.
nothing to commit, working tree clean

$ git push origin :bug10 bug/10
Total 0 (delta 0), reused 0 (delta 0)
To https://git.autodesk.com/ResearchTransfer/Aware-app
 - [deleted]         bug10
 * [new branch]      bug/10 -> bug/10

$ git status
On branch bug/10
Your branch is based on 'origin/bug10', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)
nothing to commit, working tree clean

$ git push origin -u bug/10
Branch bug/10 set up to track remote branch bug/10 from origin.
Everything up-to-date

$ git status
On branch bug/10
Your branch is up-to-date with 'origin/bug/10'.
nothing to commit, working tree clean
```
