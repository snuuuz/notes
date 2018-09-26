# Git Notes

## Merge branches without checkout
[Work for fast-forward merges only](https://stackoverflow.com/a/17722977/2868437).
```
# Merge local branch foo into local branch master,
# without having to checkout master first.
# Here `.` means to use the local repository as the "remote":
git fetch . foo:master

# Merge remote branch origin/foo into local branch foo,
# without having to checkout foo first:
git fetch origin foo:foo
```


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
