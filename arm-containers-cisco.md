# Build ARM based containers for IOx for the IR1101 hardware and other ARM based Cisco compute devices

>Note: This guide mainly focuses on the Docker for ARM build process and not the entire IOx application lifecycle. Please see the following learning lab to learn to deploy and manage the lifecycle of Docker applications to IOx.

https://developer.cisco.com/learning/lab/iox-app-docker-engine/step/1

If you have the proper tools installed on your Windows or Mac computer this can actually be pretty straight forward to build ARM containers for the IR1101 and other Cisco IOx devices that also utilize ARM CPUs.

## Prerequisites

### General needs

* Git installed
* A code Editor like Visual Studio Code, Atom, Notepad++, or etc installed on your machine
* ioxclient for IOx applications

### Docker for Windows and Mac Dev Machines

* Install docker for Desktop on your dev machine

https://www.docker.com/products/docker-desktop

* You need to activate the Edge build of Docker which will give you buildx for building multi-arch (including ARM, x86) containers.  See the below link...

https://www.docker.com/blog/multi-arch-images/

### Docker for Linux Dev Machines

* If you are on Linux, the below link will help you install Docker and buildx binaries to be able to build multi-arch (including ARM, x86) containers.

https://www.docker.com/blog/getting-started-with-docker-for-arm-on-linux/

## Getting started

* clone this github repository to your computer from the command line

```
git clone https://github.com/CiscoDevNet/iox-docker-python-web
```

* Change directories into our code repo... `cd iox-docker-python-web`

* Next we are going to build the application with Docker and buildx... In the same working directory in your CLI use the commands below.

```
docker buildx build -f arm/Dockerfile -t idpw:0.0.0 --platform linux/arm64 .

docker run -it -p 8000:8000 idpw:0.0.0
```

* Once your Docker container is running open a browser to http://127.0.0.1:8000/time to test that your application is running.

Your output should look similar to below.

```
 {"system": 1, "datetime": "2020-04-19 18:15:14.723473", "username": "DevNet User", "company": "Cisco", "org": "IoT", "motto": "Be Awesome"}
```

You are now ready to use ioxclient to deploy your container to an IR1101!

