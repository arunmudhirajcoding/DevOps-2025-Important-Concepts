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

steps:
- add a line workdir /app in dockerfile to store the project in container using volume

- run : docker run --name my-container(<name of the container>) -p(provide port) 4000:4000 --rm(--rm flag to remove container after it is stopped) -v "NOTES/_DOCKER/implementation/node-app:/app"(relative path of the project) my-app(<name of image>)

- after running it. it automatically runs the container or image

## compose.yaml (yet another markup language)
- to run multiple containers at a time
- run all commands automatically
- code:
    services:
  img:
    build: .
    container_name: my_container
    ports:
      - 4000:4000

- run: docker compose up

# docker hub
- to store docker images
- we can pull images from docker hub
- we can push images to docker hub
steps:
- login to docker hub --> docker login
- go to repositories in docker hub
- click on create repository
- give name to repository
- click on create
- now we can push our image to this repository
- docker push my-app:v1(<name of image>:<version>)

## play wtih docker
- docker buildx build --platform linux/amd64 -t my-app:v1 .
- docker push my-app:v1
### to test the docker online
- play with docker --> https://labs.play-with-docker.com/
- after logging in click on add new instance
- click on terminal
- run the command --> docker pull my-app:v1
- run the command --> docker run -p 4000:4000 my-app:v1
- now we can access the app on http://localhost:4000

# Docker Development Workflow

## 1. Initial Setup
1. Create a new project directory
2. Create Dockerfile
3. Create .dockerignore file
4. Initialize your application code

## 2. Development Process
### Building Images
1. Write Dockerfile with required configuration:
   - Set base image (FROM)
   - Set working directory (WORKDIR)
   - Copy application files (COPY)
   - Install dependencies (RUN)
   - Expose ports (EXPOSE)
   - Set startup command (CMD)

2. Build the image:
   ```bash
   docker build -t app-name:version .
   ```

3. Run the container:
   ```bash
   docker run -p host-port:container-port app-name:version
   ```

### Development with Volumes
1. Set up volume mapping for live development:
   ```bash
   docker run --name container-name -p port:port --rm -v "local-path:/app" image-name
   ```

## 3. Multi-Container Setup
1. Create docker-compose.yaml
2. Define services and configurations
3. Run with:
   ```bash
   docker compose up
   ```

## 4. Deployment Process
1. Login to Docker Hub:
   ```bash
   docker login
   ```

2. Build for specific platform:
   ```bash
   docker buildx build --platform linux/amd64 -t app-name:version .
   ```

3. Push to Docker Hub:
   ```bash
   docker push app-name:version
   ```

## 5. Maintenance
- Remove unused resources:
  ```bash
  docker system prune -a
  ```
- Create new versions with tags
- Monitor container logs and performance

## Best Practices
1. Use specific version tags for base images
2. Optimize Dockerfile for layer caching
3. Implement proper .dockerignore
4. Use multi-stage builds for production
5. Implement proper security measures
6. Regular updates and maintenance


