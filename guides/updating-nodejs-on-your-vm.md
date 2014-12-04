---
title: Updating Node.js on your VM
author: Darryl Dias
username: darryldias
date: 2014-06-27
categories: [nodejs, ppa]

template: page.toffee
---

# Installing Node.js

Your Koding VM is powered by Ubuntu 14.04; by default your Koding VM comes pre-installed with Node 0.10.26, the current stable version of Node.js available in the official Ubuntu repository. We can update to the latest stable version of Node.js available for Ubuntu 14.04 by adding the official Node.js PPA to our local sources list and running a dist-upgrade to switch to the latest stable version.

The Official PPA is updated regularly and is maintained by [Chris Lea](https://chrislea.com/)

## Instructions

Adding the official Node.js PPA

```bash
sudo add-apt-repository ppa:chris-lea/node.js
```

Updating the local package database and sources list.

```bash
sudo apt-get update
```

Updating to the latest stable build of Node.js available for Ubuntu 14.04. This will update all the packages that need to update and will also update your Node.js package.

```bash
sudo apt-get dist-upgrade
```

If you had deleted Node.js from your VM, you can install it by entering the command below. The PPA installs NPM as a part of nodejs and does not require you to install NPM seperately.

```bash
sudo apt-get install nodejs
```

Check the version of Node.js after installing. 

```bash
node --version
```

The example output should look like.

```bash
v0.10.33
```

Now you have the latest stable version of Node.js installed on your VM.
