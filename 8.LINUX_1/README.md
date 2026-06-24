# LINUX (UBUNTU)

## Installation

1. we wsl(windows subsystem for linux) for windows
```bash
 wsl --install
```
   **Note**: if any problem go to windows features in search bar and check the checkbox for wsl and hyper-v
```bash
wsl --version
```
4. install ubuntu in microsoft store
5. open ubuntu

## commands

1. whoami
2. id
3. passwd
4. groups
5. ls
6. ls -la
7. cd `<folder_name>`
8. mkdir `<folder_name>`
9. touch `<file_name>`
10. pwd
11. cd .. or cd ../../ or cd ../../../ etc
12. rm `<file_name>`
13. rm -rf `<folder_name>`
14. cp `<source_file>` `<destination_file>`
15. cp -r `<source_folder>` `<destination_folder>`
16. mv `<source_file>` `<destination_file>`
17. mv -r `<source_folder>` `<destination_folder>`
18. cat `<file_name>`
19. cat > `<file_name>`
20. echo "Hello, World!" > hello.txt
21. find . -name "\*.`<extension>`"

## file permissions and owner ship

1. ls -l
2. chmod +x `<file_name>` // to change the permission of the file Eg. +x give permission to execute the file
3. ps aux
4. top
5. kill `<process_id>`

## networking
1. ping -c 4 google.com
2. curl `<url>`
3. uname -a
4. uptime
5. sudo systemctl status nginx

## package management
1. sudo apt-get update
2. sudo apt-get install `<software>`
3. zip archive.zip `<filename>`
4. unzip archive.zip
5. head or tail -n `<number>` `<file_name>`

## text editor
1. nano and vim are the editors
2. nano `<file_name>`
3. cat `<file_name>`
4. vim `<file_name>`
5. save quit use `wq`

# shell and bash scripting 
1. open a file in nano i.e script.sh
```bash
#!/bin/bash

echo "Hello this is bash scripting"

name="Arunkumar" #variable
echo "hi! i am $name"

read -p "ENter ur fav programming language: " lang #input lang
echo "u like $lang"

# this is comment
read -p "Enter file name: " filename #input filename
if [-f "$lang"]; then # -f checks if file exists
   echo "file '$lang' exists!"
elif [ -d "$lang" ]; then # -d checks if directory exists
   echo '"$lang" is a directory'

for i in {1..5}
do 
      echo "Number: $i"
done

count=3
while [ $count -gt 0]
do 
      echo "countdown: $count"
      ((count--))
done

greet(){
   echo "hello how r u $1"
}

greet "arunkumar"

echo "First Argument: $1"
echo "Second Argument: $2"
echo "All Arguments: $@"
echo "Totat Arguments: $#"

echo "current dir: $PWD"
echo "List of All Files: $(ls)"
echo "Today's Date: $(date)"
echo " Searching for the word 'bash': $(grep 'bash' /etc/passwd)"
```
2. chmod +x script.sh
3. ./script.sh

# for Refernce
- for linux basic commands: <a href="https://github.com/farzeen-ali/Linux-Commands-for-DevOps-Engineers"> check this repo</a>
- for bash scripting: <a href="https://github.com/farzeen-ali/Linux-Bash-Scripting-for-Beginners"> check this repo</a>

