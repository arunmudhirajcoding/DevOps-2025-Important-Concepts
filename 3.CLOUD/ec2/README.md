
## EC2 (Elastic Compute Cloud)
- search and click on EC2 in aws console services
- click on launch instance
- enter instance name
- select AMI(Amazon Machine Image) - amazon linux 2023
- select instance type - t3.micro
- create keypair
- In your Security Group → Edit inbound rules → Add:
<!-- table -->

| Type | Protocol | Port | Source |
|------|----------|------|--------|
| HTTP | TCP | 80 | 0.0.0.0/0 |

- better to stop the instance if not required

- click on next until you reach the security group page
- click on create security group
- give name to security group
- add inbound rule - allow ssh from anywhere
- click on launch instance
- click on view instance
- copy the public ip address

### Connnecting EC2 with local machine
- connect to instance using ssh
- `ssh -i "key-pair.pem" ec2-user@public-ip-address`
- above command give permission denied error,before run the above command. we should give permissions to that keypair file
- **In Windows**
    - icacls "key-pair.pem" /remove:g `<LIST_GROUPS_or_USERNAME>` 
```powershell
icacls "key-pair.pem" /inheritance:r
icacls "key-pair.pem" /remove:g "Administrators" "SYSTEM" "Farzeen" 
icacls "key-pair.pem" /grant:r "$($env:USERNAME):R"
``` 
- to verify permission 
```powershell
icacls "key-pair.pem"
```
- **In linux systems(bash)**
```bash
chmod 400 "key-pair.pem"
```

### working on EC2 instance using Apache
- to serve static website we need a web server such as Apache, nginx etc
- to install any package in linux we use apt or yum
- for amazon linux 2023 we use yum
- `sudo yum update -y`
- `sudo yum install httpd -y`
- `sudo systemctl start httpd`
- `sudo systemctl enable httpd`
- `sudo systemctl status httpd`
- `sudo systemctl stop httpd`
- `sudo systemctl disable httpd`
- to check if the web server is running, open the public ip address in browser
---
- sample html
- `sudo nano /var/www/html/index.html: nano is text editor in linux
```nano 
<h2>Arun kumar</h2>
```
- to send project files to the ec2 from local machine terminal using scp (secure copy)
```bash
scp -i "key-pair.pem" -r /path/to/local/files ec2-user@public-ip-address:/path/to/remote/directory
```
- then copy those files to apache folder
```bash
sudo cp -r /path/to/remote/directory/* /var/www/html/
```


### working on EC2 instance using Nginx
- to serve static website we need a web server such as Apache, nginx etc
- ensure that any other web server shouldn't be running
- to install nodejs 
```bash
sudo dnf install nodejs npm
```
- to send project files to the ec2 from local machine terminal using scp (secure copy)
```bash
scp -i "key-pair.pem" -r /path/to/local/files ec2-user@public-ip-address:/home/ec2-user
```
- run projecj commands
```bash
npm i
npm i -g pm2
pm2 start index.js for static file
```

- for amazon linux 2023 we use yum
- `sudo yum update -y`
- `sudo dnf install nginx -y`
- `sudo systemctl start nginx`
- `sudo systemctl enable nginx` for autorestart the website after the reboot or crash
- `sudo systemctl status nginx`
- to check if the web server is running, open the public ip address in browser


- **pm2 setup** if pure nodejs/nextjs project (server event driven). skip for react/nextjs(static project)
- start the dist folder using pm2
```bash
pm2 start dist/server.js
```
- or if backend is in separate folder
```bash
pm2 start backend/index.js
```
- or if using serve package
```bash
pm2 start "serve dist" --name `<APP_NAME>`
```

- to autostart when server restart
```bash
pm2 save
pm2 startup
```
---
- **configuring the nginx**
```bash
sudo nano /etc/nginx/nginx.conf
```
- add the following configuration
```nano
server {
    listen 80;
    server_name _;
    root /usr/share/nginx/html;
    location /{
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade' ;
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
        }
    }
```
- restart nginx
```bash
sudo systemctl restart nginx
```

### running react project using pm2 and ngnix
- pm2 need serve package to serve react nodejs projects but it is not recommended for industry
- use nginx in industry usecase
```bash
npm i -g serve
```
- build the project from the project directory
```bash
npm run build
pm2 start serve --name react-app -- -s dist -l 3000
pm2 list
```
- setup security group to allow traffic on port 3000
- access the application using public ip address and port 3000: http://public_ip_address:3000
