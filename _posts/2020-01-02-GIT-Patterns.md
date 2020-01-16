---
layout: post
title: "GIT Patterns"
date: 2020-01-02
tags: sourcecontrol
type: "spec"
image: https://git-scm.com/images/logos/downloads/Git-Logo-2Color.png
thumb: https://git-scm.com/images/logos/downloads/Git-Logo-2Color.png
type: spec
---
GIT is a popular source control repository supporting a local + remote architecture for storing independent but linked copies of the source code.  This pattern assists offline development activity, as changes can still be committed to the local store, and then later merged into a central server store, once connectivity is available.

<style>
    table {
        width:100%;
        margin-left: 30px;
    }
    table th:first-of-type {
        width:20%;
    }

    h2,h3,h4 {
        padding-top: 20px;
    }
</style>


[Source (Cheat Sheet)](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet)

### GIT Basics

<div class="alert alert-info">The most common commands which are used in normal development situations.<br>These are worth remembering by heart</div>

| Command                                        | Description                                                                                                                                       |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| <code>git init &lt;directory&gt; </code>       | Create an empty GIT repository                                                                                                                    |
| <code>git clone &lt;repo&gt; </code>           | Create a local copy of a repository                                                                                                               |
| <code>git config user.name &lt;name&gt;</code> | Set local username (per repostory)                                                                                                                |
| <code>git add &lt;directory&gt;   </code>      | Recursively add the directory and its content to the set of staged files, but do not commit                                                       |
| <code>git commit -m &lt;message&gt;</code>     | Commit the staged files to the current repository branch                                                                                          |
| <code>git status</code>                        | Get the current status of the GIT repository, listing the staged files and list all current modified files, including tracked and untracked files |
| <code>git log                                  | Display complete history of all commits                                                                                                           |
| <code>git diff </code>                         | Show unstaged changes between indexed and working directory                                                                                       |

### GIT Branches
Commands used to create, merge and list branches

| Command                                     | Description                                                                                              |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| <code>git branch</code>                     | List all branches in repository                                                                          |
| <code>git fetch</code>                      | Fetches all branches from the repository.                                                                |
| <code>git fetch &lt;branch&gt;</code>       | Fetches specific branch &lt;branch&gt; from the repository.</code>                                       |
| <code>git checkout -b &lt;branch&gt;</code> | Create and check out a new branch named &lt;branch&gt;. Drop the -b flag to checkout an existing branch. |
| <code>git merge &lt;branch&gt;</code>       | Merge &lt;branch&gt; into the current branch.                                                            |

### GIT Changes
Commands used to see changes, and alter those changes to the working directory

| Command                             | Description                                                                                                                                       |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| <code>git status</code>             | Get the current status of the GIT repository, listing the staged files and list all current modified files, including tracked and untracked files |
| <code>git diff </code>              | Show unstaged changes between indexed and working directory                                                                                       |
| <code>git revert commit</code>      | Create new commit that undoes all of the changes made in &lt;commit&gt; , then apply it to the current branch.                                    |
| <code>git reset &lt;file&gt;</code> | Remove &lt;file&gt; from the staged changes, without undoing changes                                                                              |
| <code>git clean -n</code>           | Lists the files in the current working directory which would be removed if a clean took place                                                     |
| <code>git clean -r</code>           | Perform a clean on the current working directory                                                                                                  |

### GIT History 
Commands to see commit history, and revise it as required

| Command                              | Description                                                                                                                                             |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <code>git log</code>                 | Display complete history of all commits                                                                                                                 |
| <code>git commit --amend</code>      | Replace the last commit with the staged changes and last commit combined.  When nothing is staged, this will edit the last commit message only.         |
| <code>git rebase &lt;base&gt;</code> | Rebases the current branch onto &lt;base&gt;.  In this scenario, &lt;base&gt; can be a commit ID, a branch name, a tag, or a relative reference to HEAD |
| <code>git reflog</code>              | Show a log of changes to the local repository's HEAD.  Add --relative-date flag to show date info or --all to show all refs.                            |

### GIT Remote Repositories
Commands which assist in the maintenance, creation and removal or remote repository resources

| Command                                               | Description                                                                                                       |
| ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| <code>git remote add &lt;name&gt; &lt;url&gt;</code>  | Create a new connection to a remote repository.  Afterwards, &lt;name&gt; becomes a reusable alias to &lt;url&gt; |
| <code>git fetch &lt;remote&gt;</code>                 | Fetch a local copy all branches from &lt;remote&gt;                                                               |
| <code>git fetch &lt;remote&gt; &lt;branch&gt; </code> | Fetch a local copy of the remote &lt;branch&gt; from &lt;remote&gt;                                               |
| <code>git pull &lt;branch&gt;</code>                  | Fetch a copy of the current branch from the &lt;remote&gt; and immediately merge it locally, but do not commit it |
| <code>git push &lt;remote&gt; &lt;branch&gt;</code>   | Pushes all committed changes from the current branch &lt;branch&gt; local repository to the remote repository     |

### Further Detail

#### GIT Config
- Get and set repository or global options
- [Specification](https://git-scm.com/docs/git-config)

| Command                                                                       | Description                                                                                                                                           |
| ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| <code>git config --global user.name &lt;name&gt; </code>                      | Define the author name to be used for all commits by the current user.                                                                                |
| <code>git config --global user.email &lt;email&gt;</code>                     | Define the author email to be used for all commits by the current user.                                                                               |
| <code>git config --global alias.&lt;alias-name&gt; &lt;git-command&gt;</code> | Create shortcut for a Git command. E.g. alias.glog log --graph --oneline will set git glog equivalent to git log --graph --oneline.                   |
| <code>git config --system core.editor &lt;editor&gt;</code>                   | Set text editor used by commands for all users on the machine. &lt;editor&gt; arg should be the command that launches the desired editor (e.g., vi).  |
| <code>git config --global --edit</code>                                       | Open the global configuration file in a text editor for manual editing.                                                                               |
| <code>git config credential.helper store</code>                               | Stores the credentials to be used later, in `~/.git-credentials` in the form `https://<username>:<password>@github.com` in clear text                 |
| <code>git config credential.helper \'store --file=&lt;filepath&gt;\'</code>   | Looks up and stores the credentials to be used later, in `<filepath>` in the form `https://<username>:<password>@github.com` in clear text            |
| <code>git config credential.helper cache </code>                              | Caches the credentials to be used later, in `~/.git-credentials` for 900 seconds in the form `https://<username>:<password>@github.com` in clear text |
| <code>git config credential.helper \'cache --timeout=&lt;timeout&gt;\'</code> | Caches the credentials to be used later, for `<timeout>` seconds in the form `https://<username>:<password>@github.com` in clear text                 |

#### GIT Log 
- Show commit logs
- [Specification](https://git-scm.com/docs/git-log)

| Command                                        | Description                                                                                                                                                  |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| <code>git log -&lt;limit&gt;</code>            | List the last &lt;limit&gt; commits                                                                                                                          |
| <code>git log --oneline</code>                 | List commits in condensed one line format                                                                                                                    |
| <code>git log -p</code>                        | Display full diff with each commit                                                                                                                           |
| <code>git log --stat</code>                    | List commits, including a list of which files were modified and modified line count                                                                          |
| <code>git log --author=&lt;author&gt;</code>   | List all commits by a specified author                                                                                                                       |
| <code>git log --grep=&lt;pattern&gt;</code>    | List all commits which contain the &lt;pattern&gt; in the message                                                                                            |
| <code>git log &lt;from&gt;...&lt;to&gt;</code> | List all commits, in the range &lt;from&gt; to &lt;to&gt;, where &lt;from&gt; and &lt;to&gt; may be commit ID, branch name, HEAD, tag, or revision reference |
| <code>git log -- &lt;file&gt;</code>           | Only display commits to the specified file                                                                                                                   |
| <code>git log --graph --decorate </code>       | Draw a text-based graph, and --decorate adds branch names and tags of commits                                                                                |

#### GIT Diff
- Show changes between commits, commit and working tree, etc
- [Specification](https://git-scm.com/docs/git-diff)

| Command                        | Description                                                |
| ------------------------------ | ---------------------------------------------------------- |
| <code>git diff HEAD</code>     | Show difference between working directory and last commit. |
| <code>git diff --cached</code> | Show difference between staged changes and last commit     |

#### GIT Reset 
- Reset current HEAD to the specified state
- [Specification](https://git-scm.com/docs/git-reset)

| Command                                      | Description                                                                                                 |
| -------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| <code>git reset</code>                       | Reset staging area to most recent commit, leaving working directory unchanged                               |
| <code>git reset -hard</code>                 | Reset staging area, overwriting all changes in the working directory                                        |
| <code>git reset &lt;commit&gt;</code>        | Move the current working directory to the &lt;commit&gt;, leaving the current working directory unchanged   |
| <code>git reset --hard &lt;commit&gt;</code> | Move the current working directory to the &lt;commit&gt;, overwritting all changes in the working directory |

#### GIT Rebase

- Reapply commits on top of another base tip
- [Specification](https://git-scm.com/docs/git-rebase)

| Command                                 | Description                                                                                                                                       |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| <code>git rebase -i &lt;base&gt;</code> | Interactive rebase current branch onto branch, using a launched editor to enter commands for how each commit will be transferred to the new base. |

#### GIT Pull

- Fetch from and integrate with another repository or a local branch
- [Specification](https://git-scm.com/docs/git-pull)

| Command                                       | Description                                                                                                                               |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| <code>git pull --rebase &lt;remote&gt;</code> | Fetch the remote’s copy of current branch and rebases it into the local copy. Uses git rebase instead of merge to integrate the branches. |




| <code></code>     |  |
| <code></code>     |  |
