# Git 

For more info check out [Free Code Camp](https://www.freecodecamp.org/news/git-cheat-sheet/) and [Github](https://education.github.com/git-cheat-sheet-education.pdf)

**SETUP**
_Configuring user information used across all local repositories_

``git config --global user.name “[firstname lastname]”`` | set a name that is identifiable for credit when review version history
``git config --global user.email “[valid-email]”``       | set an email address that will be associated with each history marker
``git config --global color.ui auto``                    | set automatic command line coloring for Git for easy reviewing
___

**SETUP & INIT**
_Configuring user information, initializing and cloning repositories_

``git init``        | initialize an existing directory as a Git repository
``git clone [url]`` | retrieve an entire repository from a hosted location via URL
___

**STAGE & SNAPSHOT**                             
_Working with snapshots and the Git staging area_

``git status``                                 | show modified files in working directory, staged for your next commit
``git add [file]``                             | add a file as it looks now to your next commit (stage)
``git reset [file]``                           | unstage a file while retaining the changes in working directory
``git diff``                                   | diff of what is changed but not staged
``git diff --staged``                          | diff of what is staged but not yet committed
``git commit -m “[descriptive message]”``      | commit your staged content as a new commit snapshot
``git commit -a -m"your commit message here"`` | commit your content as a new commit snapshot (skip stage)
___

**BRANCH & MERGE**              
_Isolating work in branches, changing context, and integrating changes_

``git branch``                | list your branches. a * will appear next to the currently active branch
``git branch [branch-name]``  | create a new branch at the current commit
``git checkout``              | switch to another branch and check it out into your working directory
``git merge [branch]``        | merge the specified branch’s history into the current one
``git log``                   | show all commits in the current branch’s history
``git branch -d branch_name`` | delete a branch
___

**INSPECT & COMPARE**            
_Examining logs, diffs and object information_

``git log -p``                 | shows the commit's history including all files and their changes
``git log branchB..branchA``   | show the commits on branchA that are not on branch
``git log --follow [file]``    | show the commits that changed file, even across renames
``git diff branchB...branchA`` | show the diff of what is in branchA that is not in branch
``git show [SHA]``             | show any object in Git in human-readable format
``git show commit-id``         | Replace commit-id with the id of the commit that you find in the commit log after the word commit
``git log --graph --oneline``  | get the commit log to show as a graph and a single line. add ``--all`` for all branches
___

**TRACKING PATH CHANGES**               
_Versioning file removes and path changes_

``git rm [file]``                     | delete the file from project and stage the removal for commit
``git mv [existing-path] [new-path]`` | change an existing file path and stage the move
``git log --stat -M``                 | show all commit logs with indication of any paths that moved
___

**SHARE & UPDATE**                              
_Retrieving updates from another repository and updating local repo_

``git remote add [alias] [url]``              | add a git URL as an alias
``git fetch [alias]``                         | fetch down all the branches from that Git remote
``git merge [alias]/[branch]``                | merge a remote branch into your current branch to bring it up to date
``git push [alias] [branch]``                 | Transmit local branch commits to the remote repository branch
``git pull``                                  | fetch and merge any commits from the tracking remote branch
``git remote update``                         | update the remote without merging any content into the local branches
``git push --delete origin branch_name_here`` | delete orgin branch
___

**REWRITE HISTORY**             
_Rewriting branches, updating commits and clearing history_

``git rebase [branch]``       | apply any commits of current branch ahead of specified one

For Rebasing, rebase on the branch you want, and then run ``git push -f`` 
___
_Warning!!!! You MUST..._
- be on the _RIGHT BRANCH_
- be the _ONLY_ one working on that branch

_before force pushing!!!_

``git reset --hard [commit]`` | clear staging area, rewrite working tree from specified commit
``git commit --amend``        | modify and add changes to the most recent commit.*
``git revert HEAD``           | create a new commit that is the opposite of everything in the given commit. (ex. using the head alias).
``git revert comit_id_here``  | revert an old commit using its commit id
``git merge --abort``         | throw a merge away and start over
``git rebase -i master``      | run rebase interactively**

> *fixing up a local commit with amend is great and you can push it to a shared repository after you've fixed it. But you should avoid amending commits that have already been made public.
> **documentation on rebasing: https://git-scm.com/book/it/v2/Git-Branching-Rebasing
___

**TEMPORARY COMMITS** 
_Temporarily store modified, tracked files in order to change branches_

``git stash``       | Save modified and staged changes
``git stash list``  | list stack-order of stashed file changes
``git stash pop``   | write working from top of stash stack
``git stash drop``  | discard the changes from top of stash stack
___

## How to maek a new SSH key

1. Paste the text below, substituting in your account email address. Note: This uses the provided email as a label.
```
$ ssh-keygen -t ed25519 -C "your_email@example.com" -f {ssh-key-name}
> Generating public/private ALGORITHM key pair.
```
2. When you're prompted to "Enter a file in which to save the key", you can press Enter to accept the default file location. Please note that if you created SSH keys previously, ssh-keygen may ask you to rewrite another key, in which case we recommend creating a custom-named SSH key. To do so, type the default file location and replace id_ssh_keyname with your custom key name.
```
> Enter a file in which to save the key (/Users/YOU/.ssh/{ssh-key-name}: [Press enter]
```
3. At the prompt, type a secure passphrase.
```
> Enter passphrase (empty for no passphrase): [Type a passphrase]
> Enter same passphrase again: [Type passphrase again]
Adding your SSH key to the ssh-agent
```
4. Before adding a new SSH key to the ssh-agent to manage your keys, you should have checked for existing SSH keys and generated a new SSH key. When adding your SSH key to the agent, use the default macOS ssh-add command, and not an application installed by macports, homebrew, or some other external source.

5. Start the ssh-agent in the background. Depending on your environment, you may need to use a different command. For example, you may need to use root access by running sudo -s -H before starting the ssh-agent, or you may need to use exec ssh-agent bash or exec ssh-agent zsh to run the ssh-agent.
```
$ eval "$(ssh-agent -s)"
> Agent pid 59566
```
6. If you're using macOS Sierra 10.12.2 or later, you will need to modify your ``~/.ssh/config`` file to automatically load keys into the ssh-agent and store passphrases in your keychain. First, check to see if your ``~/.ssh/config`` file exists in the default location.
```
$ open ~/.ssh/config
> The file /Users/YOU/.ssh/config does not exist.
```
7. If the file doesn't exist, create the file.
```
$ touch ~/.ssh/config
```
8. Open your ~/.ssh/config file, then modify the file to contain the following lines. If your SSH key file has a different name or path than the example code, modify the filename or path to match your current setup.
```
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/{ssh-key-name}

Host bitbucket.org
  AddKeysToAgent yes
  IdentityFile ~/.ssh/{ssh-key-name}

```
>Notes:

>If you chose not to add a passphrase to your key, you should omit the UseKeychain line.
>If you see a Bad configuration option: usekeychain error, add an additional line to the configuration's' Host *.github.com section.

>Host github.com
>  IgnoreUnknown UseKeychain

9. Add your SSH private key to the ssh-agent and store your passphrase in the keychain. If you created your key with a different name, or if you are adding an existing key that has a different name, replace {ssh-key-name} in the command with the name of your private key file.
```
$ ssh-add --apple-use-keychain ~/.ssh/{ssh-key-name}
```
> Note: The --apple-use-keychain option stores the passphrase in your keychain for you when you add an SSH key to the ssh-agent. If you chose not to add a passphrase to your key, run the command without the --apple-use-keychain option.

>The --apple-use-keychain option is in Apple's standard version of ssh-add. In MacOS versions prior to Monterey (12.0), the --apple-use-keychain and --apple-load-keychain flags used the syntax -K and -A, respectively.

-[Add the SSH key to your account on GitHub.](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account )
-[Add the SSH key to your account on Bitbucket.](https://support.atlassian.com/bitbucket-cloud/docs/set-up-personal-ssh-keys-on-macos/#Provide-Bitbucket-Cloud-with-your-public-key)

keywords: git cli