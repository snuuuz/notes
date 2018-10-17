# Git Notes

## Branches and Status
```
git branch -r --no-merged origin/dev  # remote branches not merged into remote dev yet
git branch    --no-merged        dev  # local branches not merged into dev yet
```    
[Reference](https://stackoverflow.com/a/12276041)    

## Fast forward a branch without checking it out
```
git fetch . dev:Docs  # Fast forward branch Docs to dev.
```
Based on [Work for fast-forward merges only](https://stackoverflow.com/a/17722977/2868437).



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
