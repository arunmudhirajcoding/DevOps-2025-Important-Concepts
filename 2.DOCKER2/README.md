## importance of docker
- It works on my machine but not on yours
- It works on my machine and on yours
- It works on any machine
- Runs on any system without worrying about dependencies,OS versions, or conflicts

- username : arunkumardurgollu3542

## Docker images and containers
- Docker image is template and they are immutable.
- running instance of docker image is docker container (like java obj instance)
- isolated: independent that any packeges need are isnt neccessory to be present in host system
- base(parent) image is like (node for backend)

## installation of docker-desktop for windows
- go to docker offical website to download the desktop 
- https://www.docker.com/products/docker-desktop/
- open the docker desktop and signup using github or oauth.
### requirements 
- install wsl 
- enable wsl and hyper v in windows features in ur local machine


## commands
- docker run -it (provide terminal) `<image_name>` /bin/bash(to use linux command)
- docker build -t(tag flag)  `<name of image>` .
- docker run -p(provide port) 3000:3000 `<image name>`
- docker system prune -a (to remove all unused images, containers, and networks at a time)

## dockerfile in a project
eg: 
```yml
FROM node:latest  --> base image (what we need to run this project)

COPY . .          --> where to copy and paste the image

RUN npm install   --> install dependencies

EXPOSE 3000       --> which port to run the image or project 

CMD ["nodemon","index.js"] --> what to run when container is started to run this project
```
steps-
1. build the image --> `docker build -t(tag flag) my-app(`<name of image>`)` .
2. run the image --> `docker run -p(provide port) 3000:3000 my-app`

3. or else,run the image via docker-desktop by click on run button and set the port to 3000 then click on run 

## to ignore files for build image
- create a file named .dockerignore
- add files to ignore in this file
- example:
    - node_modules
    - .env


## create new version
- means build image with same name but new tag as versions (v1,v2,v3)
- docker build -t `<name_of_image>:<version>` .
```bash
docker build -t my-app:v2 .
```

# volume
- volume is used to persist data in container and changes made in local project will be reflected in container and vice versa
- volume might not work if the project is present in cloud drive like google drive, one drive

steps:
- add a line workdir /app in dockerfile to store the project in container using volume

- run : docker run --name `<name of the container>` -p(provide port) 4000:4000 --rm(--rm flag to remove container after it is stopped) -v(flag indicates volume) `<relative_path_of_the_project>/<WORKDIR_name>`  `<name of image>`
```bash
docker run --name my-container -p 4000:4000 --rm -v "Note/2.DOCKER2/implementation/node-app:/app"
```

- after running it. it automatically runs the container or image.
- any changes made in run time . those changes reflect on container, without restart the container and image

## compose.yaml (yet another markup language)
- to run multiple containers at a time
- run all commands automatically
```compose.yml
services:
  img:
    build: .
    container_name: my_container
    ports:
      - 4000:4000
```

- run: 
```bash
docker compose up
```

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
- docker push `<name_of_image>:<version>`
```bash
docker push my-app:v2
```

## play wtih docker
- without local setup , we can run on mock servr. to test our image

- docker buildx build --platform `<Name_OF_SERVER_ON_PLAYGROUND>` -t `<IMAGE_NAME>` .
```bash
docker buildx build --platform linux/amd64 -t my-app:v1
```
- docker push my-app:v1

### to test the docker online
- play with docker --> https://labs.play-with-docker.com/
- after logging in click on add new instance
- click on terminal
- run the command --> docker pull my-app:v1
- run the command --> docker run -p 4000:4000 my-app:v1
- now we can access the app on http://localhost:4000

## gitLab in Docker
- pull the gitlab/gitlab-ce image from docker hub
- run the command
```bash
docker pull gitlab/gitlab-ce
docker run -p 8000:80 gitlab/gitlab-ce
```
- now we can access the gitlab on http://localhost:8000
after some time 10 to 15 minutes it will be ready to use then go to http://localhost:4000/users/sign_in
- default username is root
- run the command to get the password
```bash
docker exec -it `<container_id_OF_GITLABIMAGE>` cat /etc/gitlab/initial_root_password
```
- then copy the password and paste it in gitlab login page
- now gitlab is ready to use in localhost

### gitlab-server docker compose 
- create a file anywhere in local machine for automate gitlab server with name docker-compose.yaml
- add the following code in docker-compose.yaml
```yml
version: '28.4.0'
   services:
      gitlab-server:
         image: 'gitlab/gitlab-ce:latest'
         restart: always
         container_name: 'my-gitlab-server'
         hostname: my-gitlab-server
         environment:
            GITLAB_OMNIBUS_CONFIG: | # '|' -> for multi line config
            gitlab_rails['inital_root_password'] = '@Ak354200'
            puma['worker_processes'] = 0 # puma webserver disable with default settings
            external_url 'http://my-gitlab-server' # this is bcoz gitlab runner will run on this url but gitab server on local host.
         ports:
            - '8000:80'
            - '2222:22'
         volumes:
            - './gitlab/config:/etc/gitlab'
            - './gitlab/logs:/var/log/gitlab'
            - './gitlab/data:/var/opt/gitlab'

      gitlab-runner:
         image: "gitlab/gitlab-runner:latest"
         container_name: my-gitlab-runner
         restart: always
         depends_on:
            - gitlab-server
         volumes:
            - ./gitlab-runner/config:/etc/gitlab-runner
            - /var/run/docker.sock:/var/run/docker.sock # to run runner in docker
         privileged: true

```
- run the command --> `docker compose up`
- now we can access the gitlab on http://localhost:8000

---

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
