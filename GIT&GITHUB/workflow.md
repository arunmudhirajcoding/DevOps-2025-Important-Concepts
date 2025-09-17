# collabration workflow of git with github
1. invite collabrators
2. enter name in people 
3. click on invite
4. accept invite when they notified invitation
5. all changes done by the team lead can be access by the collabrators
6. collabrators can clone the repo and work on it
7. collabrators can create a branch and work on it
8. team lead can create a pull to merge their branch with main branch and check changes made by the  collabrators

# contributer workflow
0. fork the repo
1. clone the repo
2. create a branch
3. work on the branch
4. commit the changes
5. push the branch
6. create a pull request to the owner of repo
7. owner of repo can merge the pull request
8. owner have options for comment and review the changes without approve
9. owner can close the pull request if not required 
10. owner can request changes if any
11. owner can approve the pull request if all changes are done
12. owner can merge the pull request

## create repo for profile in github
1. create a new repo in github
2. name the repo as your username
3. add readme file
4. readme.md can be written using markdown language or else html for better presentation
tip:
use website: readme.so

point to remember:
1. name the repo as your username
2. repo should be public 


## github action workflow by schedule job
1. create a new file in .github/workflows folder
2. name the file as schedule.yml
3. add the code in schedule.yml
4. commit the changes
5. wait for the workflow to complete
6. access the site

schedule.yml
```
name: schedule

on:
  schedule:
    - cron: '0 0 * * *' (min hr day month year - every day at midnight)
  jobs:
    run-script:
      runs-on: ubuntu-latest
      steps:
        - name: Checkout code
          uses: actions/checkout@v3
        - name: Set up Node.js
          uses: actions/setup-node@v3
          with:
            node-version: 18
        - name: Install dependencies
          run: npm install
        - name: Run script
          run: node script.js
```

### diable action workflow
1. go to actions tab
2. click on workflow name
3. click on disable workflow on left side

### job concurrency in github action
1. go to actions tab
2. click on workflow name
3. click on job name
4. click on concurrency on left side
5. add concurrency name
6. add concurrency strategy
7. add concurrency cancel in-progress
8. add concurrency cancel existing
```
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }} -> ( any string )
  cancel-in-progress: true
  cancel-existing: true
```
