---
title: How to install GruntJS
author: Team Koding
date: 2015-01-20
categories: [gruntjs]
template: page.toffee
---

# How to install GruntJS

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install GruntJS using just one command:

```
kpm install grunt
```

***

## Getting started

Before you can start the GruntJS install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

By default every Koding VM comes preinstalled with NodeJS and npm but if it is missing, from your VM, have a look at [this guide](http://learn.koding.com/guides/getting-started-nodejs/) to learn how to install it.

## Installing

To install GruntJS you'll need to run the following command:

```
sudo npm install -g grunt-cli
```

This will install GruntJS globally on your VM.

You can verify if GruntJS has installed correctly using the following command:

```
grunt --version 
```

## Usage

You can use GruntJS in your project by inputting some basic commands.

Move into your project:
```
cd ~/your_project
```

Generate an empty package file:

``` 
echo "{}" > package.json 
```

Finally, install GruntJS into that project using the following command:

```
npm install grunt --save-dev
```

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).