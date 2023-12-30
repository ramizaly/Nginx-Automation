# Nginx Automation Scripts
This repository houses a collection of automation scripts designed to streamline the deployment and management of Nginx-based services. Beyond web servers, these scripts cover a range of functionalities, including web server setup, reverse proxy configurations, and load balancer deployments.

## Features

- **Web Server Automation**: Quickly deploy websites on Nginx servers with automatic installation, directory management, virtual host configuration, and more.
- **Reverse Proxy Configuration (Future Addition)**: Simplify the setup of reverse proxy servers for efficient handling of client requests to backend servers.
- **Load Balancer Deployment (Future Addition)**: Automate the deployment of load balancers to distribute incoming traffic across multiple servers, ensuring optimal performance and reliability.


## Prerequisites 
- Ensure root or sudo privileges for execution
- Make sure you have your website files and folders in a directory as well as the certificate and key files

## Usage

### Web Servers
- Clone the Repository 

```shell
git clone https://github.com/ramizaly/Nginx-Automation.git
cd Nginx-Automation/Your-Operating-System
```

#### For HTTP
```shell
chmod +x static-site-HTTP.sh
./static-site-HTTP.sh "<Website-Dir> <Domain-Name>"
```

#### For HTTPS
```shell
chmod +x static-site-HTTPS.sh
./static-site-HTTPS.sh "<Website-Dir> <Domain-Name> <Certificate-File> <Private-Key-File>"
```

## Notes
- Customize the scripts according to your specific requirements.
- Additional scripts for different server configurations can be added in the future.
- Feel free to contribute, report issues, or suggest improvements.
