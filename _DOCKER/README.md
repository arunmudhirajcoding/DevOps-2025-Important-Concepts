## importance of docker
- It works on my machine but not on yours
- It works on my machine and on yours
- It works on any machine
- Runs on any system withoutworrying about dependencies,OS versions, or conflicts

- username : arunkumardurgollu3542

## Docker images and containers
- Docker image is template and they are immutable.
- running instance of docker image is docker container (like java obj instance)
- isolated: independent that any packeges need are isnt neccessory to be present in host system
- base(parent) image is like (node for backend)

## commands
- docker run -it (provide terminal) node (<name of image>) /bin/bash(to use linux command)
- docker build -t(tag flag) my-app(<name of image>) .
- docker run -p(provide port) 3000:3000 my-app
- docker system prune -a (to remove all unused images, containers, and networks at a time)

## dockerfile in a project
eg: 
FROM node:latest  --> base image (what we need to run this project)
COPY . .          --> where to copy and paste the image
RUN npm install   --> install dependencies
EXPOSE 3000       --> which port to run the image or project 
CMD ["nodemon","index.js"] --> what to run when container is started to run this project

steps-
1. build the image --> docker build -t(tag flag) my-app(<name of image>) .
2. run the image --> docker run -p(provide port) 3000:3000 my-app
        or
3. run the image via docker-desktop by click on run button and set the port to 3000 then click on run 

## to ignore files for build image
- create a file named .dockerignore
- add files to ignore in this file
- example:
    - node_modules
    - .env


## create new version
- means build image with same name but new tag as versions (v1,v2,v3)
- docker build -t(tag flag) my-app:v1(<name of image>:<version>) .

# volume
- volume is used to persist data in container and changes made in local project will be reflected in container and vice versa
- volume might not work if the project is present in cloud drive like google drive, one drive
- 