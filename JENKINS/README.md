# jenkins
Jenkins is an open source automation server. It helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery. It is a server-based system that runs in servlet containers such as Apache Tomcat.

## installation
### requirements
- jdk below 24 version such as jdk 21 or 17
- setup environment variable by create file by  JAVA_HOME and paste path of jdk bin


1. download jenkins from https://www.jenkins.io/download/
2. click on run service as local or domain user 
means: use windows user name as account and system password as a password
3. set a privilege by open local secuity policy in local machine 
4. go to local policies -> User rights assignment -> scroll for log on as a service and add a user name 
5. select port and jdk version
6. open localhost:8080 and enter adminstrater password by given path and install plugins.
7. enter username, password, and email address

## create first job
1. new item name -> freestyle project
2. build steps -> execute windows batch command 
3. enter 
```
echo hello world
```
aand save 
4. click on build , if build is succes it will shows green tick and we can see logs on console 

##
1.  install Git plugin in jenkins
2. create a new repo in github
3. create a new job of freestyle.
4. select git -> add github repo url(add credentials if private) -> triggers -> check github hook trigger -> build steps -> windows batch command -> save

**we need a public url instead of localhost for jenkins so we use ngrok**

1. install ngrok from offical ngrok website
2. extract it in any new folder - C:\Users\HP\AppData\Local\Microsoft\WindowsApps\ngrok.exe
3. to use this ngrok we need a token so signup in ngrok and get a token which is found in your auth token page
4. run following command
```bash
ngrok config add-authtoken <authtoken >
ngrok http <jenkins port >
```
- it generate a public url for jenkins 
5. go to gitHub -> settingd -> add webhooks -> add `public url/github-webhook` in payload url
6. checkboxcheck to just the push event(desire)

## script automation
1. create a file in local system with .log extension
2. create a job -> free style -> build step -> execute window batch 
```batch command
echo cleaning up build folder ....
del /q path of file\*.log          // any command
echo cleaning up completed
```
### trigger job
1. go to configure -> triggers -> build periodically -> cron expression -> save
eg for one min : * * * * *

---
# Pipline
## declarative 
1. create a job with pipline -> configure -> pipline -> write pipelin script
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
## scripted
1. create a job with pipline -> configure -> pipline -> write pipeline script
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
2. we can use looping , control flow, any statements

# ci/cd pipeline for vercel
1. create a repo in github
2. create a vercel nextjs project and connect to github repo
3. create a job with pipeline -> github hook trigger -> pipeline scrpit for git -> url -> script path Jenkinsfile and save
4. create a Jenkinsfile in ur nextjs project and paste the following code
``` script
pipeline {
    agent any
    environment {
        VERCEL_TOKEN = credentials('VERCEL_TOKEN')  // vercel token
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
1. npm i -g vercel
2. vercel login and in settings get the token
3. vercek login
4. vercel --token <vercel token>
    - follow up given steps in terminal
5. go to jenkins dashboard -> manage jenkins -> credientials -> global -> add credientials.
6. select kind: secret text -> scope: default -> id: VERCEL_TOKEN -> description: vercel token -> secret: <vercel token> -> save.
7. use ngrok for jenkins public url
8. setup webhooks settings in github

### todo: CI/CD  pipeline with aws