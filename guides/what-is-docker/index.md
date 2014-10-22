---
title: A guide to Docker
author: Team Koding
date: 2014-10-17
categories: [docker]
template: page.toffee
---

# What is Docker

[Docker][docker] is a platform that helps developers build apps in whatever language they feel comfortable using and using any toolchain they want. Using Docker developers can build, ship and run distributed applications because it enables them to quickly put together an app by eliminating the stress between development, QA and production environments.

A developer that uses Docker can run his / hers app anywhere without the fear of it not performing as it should.

Apps that are built using Docker are completely portable and can run anywhere.

## Docker apps

Anyone can get started with Docker by checking out one of the 13,000+ apps that are available in the [Docker Hub][hub]. You can get started working on WordPress or a new nodejs project in just a few seconds without the hassle of having to install any other dependencies (other then Docker of course) on your Koding VM.

## Benefits

The difference between a virtualized application and the Docker Engine container is that the first one includes not only the app and the necessary binaries and libraries but it contains the guest OS as well. The later runs as an separate process on the OS and thus it has the resources separation and allocation of a VM but is much more portable.

## Installing Docker on Koding

The version of Ubuntu that is installed on each Koding VM comes with a `docker.io` package and it should install Docker 0.9.1. 
We can install Docker on our Koding VM using the following commands:

* We update the package list

```
sudo apt-get update
```

* Install Docker

```
sudo apt-get install docker.io
```

* We create a link 

```
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
```

* We need to edit the docker file in order to continue

```
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
```

* And we now execute that file

```
source /etc/bash_completion.d/docker.io
```

* After that we need to add the Docker repo key to the local keychain

```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
```

* The last step is to add the Docker repo to the apt sources list, update and install the lxc-docker package. You can do that using the following commands

```
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker
```

_Note: You can use the bellow command, that uses curl, for an easier installation process:_

```
curl -sSL https://get.docker.com/ubuntu/ | sudo sh
```

If you made it to this point you can run this command to check if Docker is indeed installed and works properly:

```
sudo docker run -i -t ubuntu /bin/bash
```

If you have any question or issues please email us at support@koding.com and we'll gladly help.



[docker]: https://www.docker.com/
[hub]: https://registry.hub.docker.com/