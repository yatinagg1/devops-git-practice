SETUP and CONFIG
git init --> to initialize git folder it creates .git directory for stores history/tracking
git config --global user.name "user name" --> to configure user name globally
git config --global user.email "email id" --> to configure user email id globally
git config user.name "user name" --> to configure user name for project
git config user.email "email id" --> to configure user email is for project
git clone <URL> --> to make a clone remote repo to local
git fetch --> to fetch remote git hub data but not to clone or copy locally



BASIC WORKFLOW
git add <filename> --> add filename from untrack to staged state 
git add .  --> to add all files from untrack to staged state
git commit -m <commit>  --> to commit changes into git repo with message
git rm --cached <filename> --> to unstage a file
git checkout -b <branchname>  --> to make new branch and switch to that branch
git switch <branchname> --> change working branch
git branch -D <branchname> --> to delete a branch
git checkout <branchname> --> to change branch
git restore <filename> --> used to restore a file


VIEWING CHANGES 
git log --> view commit history in repo
git log --oneline --> view commit history in short
git diff --> view unstaged changes means those not committed yet
git status --> shows current status of working directory and staging area. it shows untracked, staged, modified files
