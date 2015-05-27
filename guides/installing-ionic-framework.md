---
title: Installing Ionic Framework
author: Sergiu Butnarasu
categories: [frameworks platforms, apache, nodejs, javascript]
template: page.toffee
---

# Installing Ionic Framework

This guild will explain how to install [Ionic Framework ](http://ionicframework.com/) and how to run the application in your browser.

To install Ionic Framework you must update your packages and have nodejs and npm installed on your Koding VM:

* Update packages

```
sudo apt-get update
```

* Install nodejs

```
sudo apt-get install nodejs
```

* Install npm

```
sudo apt-get install npm
```

## Step 1 - Install Ionic Framework

After installing npm you will be able to install Ionic Framwork on your Koding VM. Write the following command in your terminal:

```
sudo npm install -g cordova ionic
```

## Step 2 - Navigate to Applications directory

Navigate to your application directory where you will create the ionic app. To do this write in terminal:

```
cd Applications
```

## Step 3 - Create your Ionic application

Now you can create you application using the following command:

```
sudo ionic start myApp
```

## Step 4 - Navigate to myApp directory

To be able to run you application, first you need to navigate to your application directory:

```
cd myApp
```

## Step 5 - Set address

On this step you can specify what address your browser will connect to:

```
ionic address
```

## Step 6 - Start a local development server

Now you can start a local development server to test your Ionic application. To do this, write in your console:

```
ionic serve --all
```

## Step 7 - Access your **running dev server** url:

Finally you can access your dev server url:

```
http://[**username**].koding.io:8100
```

That's it! I hope it helps you.