# jenkins
Jenkins is an open source automation server. It helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery. It is a server-based system that runs in servlet containers such as Apache Tomcat.

## installation
### java Setup
- jdk below 24 version such as jdk 21 or 17
- setup environment variable by create file by  JAVA_HOME and paste path of jdk bin

### Jenkins setup
1. download jenkins from https://www.jenkins.io/download/
2. click on `run service as local or domain user` 
means: use windows user name as account and system password as a password
3. set a privilege by open `local secuity policy` in local machine
4. go to `local policies` -> `User rights assignment` -> scroll for `log on as a service` and add windows user name 
5. select port=8080 and jdk version
6. open localhost:8080 and enter adminstrater password, given in mentioned path above the password field and install plugins.
7. enter username, password, and email address

## create first job
1. new item name -> freestyle project
2. build steps -> Add Build -> execute windows batch command 
3. enter 
```bash
echo hello world
```
4. save 
5. click on build , if build is succes it will shows green tick and we can see logs on console 

## Jenkins with GitHub
1.  install Git plugin in jenkins , - go to manage Jenkins -> available plugins
2. create a new repo in github
3. create a new job of freestyle.
4. select git -> `add github repo url`(add credentials if private) -> `triggers` -> check `github hook trigger` -> `build steps` -> `windows batch command` -> save
5. since jenkins in localhost. github cant access our jenkins , so we need to public this jenkin using ngrok

**we need a public url instead of localhost for jenkins so we use ngrok**

### steps for ngrok setup
1. install ngrok from offical ngrok website
2. extract it in any new folder - `C:\Users\HP\AppData\Local\Microsoft\WindowsApps\ngrok.exe`
3. to use this ngrok we need a token so signup in ngrok and get a token which is found in `your auth token` page
4. run following command
```bash
ngrok config add-authtoken <authtoken>
ngrok http <jenkins_port>
```
- it generate a public url for jenkins 
5. go to gitHub -> settings -> `add webhooks` -> add `public url` and add `\github-webhook\` (EG: https://abc.ngrok-free.app/github-webhook) in payload url
6. checkboxcheck to just the push event(desire)

### credential setup for private github repos
1. go to github -> `settings` -> `developer settings` -> `personal access tokens` -> `tokens(classic)` -> `generate new token` -> give name and select scopes like `repo`, `workflow` etc -> `generate token`
2. go to jenkins `dashboard` -> `manage jenkins` -> `credientials` -> `global` -> `add credientials`.
3. select kind: username with password -> scope: default ->username: `<github_username>` -> password: `<github_token>` -> save.

## script automation
- script to deleting log files 

1. create a file in local system with .log extension
2. create a job -> `free style` -> `build step` -> `execute window batch`
```batch command
echo cleaning up build folder ....
del /q <path_of_file>\*.log          // any command
echo cleaning up completed
```
### trigger job (scheduling)
1. go to `configure` -> `triggers` -> `build periodically` -> `cron expression` -> `save`
eg for cron expression of one min : * * * * *


---
# Pipline
## declarative 
1. create a job with `pipline` -> `configure` -> `pipline` -> write pipelin script
```script
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'building application ..'
            }
        }
        stage('test){
            steps{
                echo 'runnig test ...'
            }
        }
    }
}
```
2. click `Build now` to run the pipeline
## scripted
1. create a job with `pipline` -> `configure` -> `pipline` -> write pipeline script
- steps are optional in scripted pipeline
- we can use looping , control flow, any statements
- bcoz its a `groovy` script
``` script
node {
    stage('build'){
        echo 'building....'
    }
    stage('test'){
        echo 'building....'
    }
    stage('deploy'){
        echo 'building....'
    }
}

```

# ci/cd pipeline for vercel
### Note to remember: 
jenkins does not block deployement to vercel. both works independently and may be simultaneous.

to block it we need to use vercel token and vercel cli configuring in jenkins using webhooks 

## steps in jenkins
1. create a repo in github
2. create a nextjs project and connect to github repo
3. create a job with `pipeline` -> `github hook trigger` -> `pipeline scrpit for SCM` -> in scm section select `git` ->paste gitrepo `url`
4. select branch and in script path `Jenkinsfile` and save
5. create a `Jenkinsfile` in ur nextjs project and paste the following code
``` script
pipeline {
    agent any
    environment {
        VERCEL_TOKEN = credentials('VERCEL_TOKEN')  // vercel token set in jenkins credentials
    }
    stages{
        stage('Install') {
            steps{
                bat 'npm install'
            }
        }
        stage('test') {
            steps{
                echo 'testing...' // use bat test
            }
        }
        stage('build') {
            steps{
                bat 'npm run build'
            }
        }
        stage('Deploy') {
            steps{
                bat 'npx vercel --prod --yes --token=%VERCEL_TOKEN%'
            }
        }
    }
} 
```
5. push the jenkinsfile in github repo

### vercel setup
```bash
npm i -g vercel
```
- vercel login and in settings get the token -> https://vercel.com/account/settings/tokens
```bash
vercel login
vercel --token <vercel token>
```
- follow up given steps in terminal

## jenkins credentials setup
go to jenkins `dashboard` -> `manage jenkins` -> `credientials` -> `global` -> `add credientials`.
6. select kind: secret text -> scope: default -> id: `VERCEL_TOKEN` -> description: vercel token -> secret: `<vercel_token>` -> save.

7. use ngrok for jenkins public url
8. setup webhooks settings in github

# CI/CD  pipeline with aws
## jenkins installation in ec2
1. create ec2 instance
2. connect using ssh
3. install java and jenkins
```bash
sudo apt install openjdk-21-jdk -y

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins
```
---
- there is a problem with memory in free tier so use swapfile for jenkins requirements 
```bash
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

free -h
```
---
3. enable service
```bash
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
```
4. setup security groups for 8080,3000
5. sudo cat /path/to/password
6. follow same steps as local machine
7. setup credentials of jenkins
```bash
sudo visudo
```
- below the root all add `jenkins ALL=(ALL) NOPASSWD: ALL`
8. install nodejs, npm , to install bun first install unzip curl
```bash
sudo apt install nodejs
sudo apt install npm

sudo apt install curl unzip
curl -fsSL https://bun.sh/install | bash
source /home/ubuntu/.bashrc
```

## step up in local machine
1. create a nextjs project and link with github
2. create Jenkinsfile 
```Jenkinsfile
node {
    def appDir = '/var/www/nextjs-app'

    stage('Clean Workspace'){
        echo "Cleaning Jenkins workspace"
        deleteDir()
    }

    stage('Clone repo'){
        echo "cloning the repo"
        git(
            branch: 'main',
             credentialsId: 'github-pat',
            url: 
        ) 
    }

    stage('Deploy to EC2'){
        echo "Deploying to EC2"
        sh """
            sudo mkdir -p ${appDir}
            sudo chown -R
            jenkins:jenkins ${appDir}

            rsync -av --delete --exclude=".git" --exclude="node_modules" ./ ${appDir}

            cd ${appDir}
            sudo bun install
            sudo bun run build
            sudo fuser -k 3000/tcp || true
            sudo bun run start
        """
    }
}
```
3. url of jenkins in ec2 to webhook of github

## step in Jenkins
- create jenkins job , same as vercel pipline


# pipeline of cicd lives inside:
```
.github/workflows/deploy.yml
```

No Jenkins server required.
