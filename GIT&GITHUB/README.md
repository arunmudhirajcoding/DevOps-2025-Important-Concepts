## Git & GitHub commands
steps for git configuration 
1. git config --global user.name "Your Name"
2. git config --global user.email "your@email.com"
3. git config --global --unset user.name
4. git config --global --unset user.email
5. git config --global --list


steps for git initialization
1. git init
2. git add .
3. git commit -m "Initial commit"
branch rename
1. git branch -m main
2. git branch -M main
next step for initialzation
1. git remote add origin https://github.com/yourusername/yourrepository.git
2. git push -u origin main
 then authentication 

git ignore process
1. create .gitignore file
2. add file name to ignore
3. git add .
4. git commit -m "Ignore file"
5. git push origin main
types of ignore  like for folders , files etc 
1. *.log -- for all files with extension .log
2. node_modules/ for all files inside node_models or any folder 
3. .env for specific file .env (file name)

### restore command
1. git restore --staged .
2. git restore .
ctrl z and ctrl y wont work when close the tab for ide 

### revert command for committed changes
1. git revert <commit-hash>
2. git push origin main

### git log commands
1. git log 
2. git log --oneline

### reset command (bad practice instead this use revert)
1. git reset --hard <commit-hash>
2. git reset --soft <commit-hash>
3. git reset --mixed <commit-hash>
4. git reset --soft HEAD~1

### git alias commands
format is git config alias.<alias-name> <command>
1. git config --global alias.co checkout
2. git config --global alias.br branch
3. git config --global alias.ci commit
4. git config --global alias.st status
        using nano in gitbash then open nano .gitconfig
            [alias]
                co = checkout
                br = branch
                ci = commit
                st = status

### branches commands
1. git branch --list
2. git branch <branch-name>
3. git branch -d <branch-name>
4. git branch -D <branch-name>
5. git branch --rename <old-branch-name> <new-branch-name>
6. git branch --move <old-branch-name> <new-branch-name>

### checkout and switch commands
1. git checkout <branch-name>
3. git checkout <commit-hash>
2. git checkout -b <branch-name>
5. git switch <branch-name>
6. git switch -c <branch-name>
4. git checkout -- <file-name>
7. git switch --detach <branch-name>

### merge commands
1. git merge <branch-name>
2. git merge --abort

### amend command
/*
The git amend command is used to modify the most recent commit. It's helpful when you:
- Forgot to add a file in the last commit
- Need to update the commit message
- Want to make small changes without creating a new commit
- Want to maintain a cleaner git history

Example usage:
git commit --amend -m "New commit message"
git commit --amend --no-edit (keeps same commit message)

Note: Don't amend commits that have been pushed to remote repositories unless working alone,
as it rewrites commit history and can cause conflicts for other developers.
*/

### clone command
1. git clone <remote-repository-url>
2. git clone <remote-repository-url> <local-directory-name>
3. git clone --branch <branch-name> <remote-repository-url> (clone specific branch)

### pull and fetch command
1. git pull
2. git fetch -> to know about changes in remote repository without merge into local repo
then use merge after check changes 

3. git pull origin <branch-name> (pull specific branch)
4. git fetch origin <branch-name> (fetch specific branch)

### github pages for static-site and react app

### diff command
1. git diff
2. git diff --staged
3. git diff <commit-hash>
4. git diff <branch-name>
5. git diff <commit-hash> <commit-hash>
6. git diff <branch-name> <branch-name>
7. git diff --name-only
8. git diff --name-status
9. git diff --cached
10. git diff --color-words





