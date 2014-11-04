---
title: Installing Apache Cordova
author: Team Koding
date: 2014-11-04
categories: [koding]
template: page.toffee
---

# Installing Apache Cordova

This guide will cover the basics on how to get Apache Cordova installed on your Koding VM.

Before we begin please check that you have the following things installed on your Koding VM. For each requirement run each command to make sure that you have that requirement installed on your VM.

_Note: By default all Koding VMs come preinstalled with the below requirements._

* [NodeJS](/getting-started-nodejs/)

```
nodejs -v
```

* NPM (Node Packaged Modules)

```
npm -v
```

* Git

```
git --version
```

## Step 1 - Install

In order to install Apache Cordova we will need to use NPM. Input the following command to install Apache Cordova.

```
sudo npm install -g cordova
```

## Step 2 - Finish up

After the process has finished installing, the module, we need to make sure it has installed correctly. You can simply check the version using the following command:

```
cordova -v
```

The output of the above command should be something similar to this:

```
3.5.0-0.2.6
```

## Step 3 - Setting up a first project

To create your first Apache Cordova app project you can use the following command:

```
cordova create FOLDER ID NAME
```

**FOLDER** represents the folder where the source or the project will be stored (the folder should not be created beforehand). 
**ID** is the reverse domain-style identifier
**NAME** is the application's title.

If you installed NodeJS and not used the default one that came with your Koding VM you may encounter the following error:

```
/usr/bin/env: node: No such file or directory
```

In order to fix this issue you can run the following:

```
ln -s /usr/bin/nodejs /usr/bin/node
```

You now need to switch to the app folder, the one that we mentioned above, where the source is stored, in order to add platforms:

```
cd FOLDER
```

You can add platforms like so:

```
cordova platform add PLATFORM_NAME
```

Where **PLATFORM_NAME** is the platform you want to add. Some of the platforms are enumerated here: ios, amazon-fireos, android, blackberry10, firefoxos, wp8, and windows8. Please do not try to add a Windows platform as this will result in an error.

If you have set everything correctly, until this point, you can go ahead an build your project using the following command (Note: Please make sure you're in the project folder before inputing the below command):

```
cordova build
```

If you want to build a project for a particular platform, you can use the following command:

```
cordova build PLATFORM_NAME
```

And that's it!

If you encounter any issues or have any questions regarding Apache Cordova on Koding you can email us at [support@koding.com](mailto:support@koding.com) and we'll gladly help.
