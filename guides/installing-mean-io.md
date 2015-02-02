---
title: Installing the MEAN.io stack on Koding
author: P1xt
username: P1xt
date: 2015-01-06
categories: [node, angular, express, mongodb]
---

# Installing & Setting Up a MEAN.io stack

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install MEAN or MEAN.io stack using just one command:

If you want to install MEAN:

```
kpm install mean
```

and if you want to install MEAN.io stack you can use:

```
kpm install mean-io-stack
```

***

This article will cover the process of installing and setting up a [MEAN.io](http://mean.io) stack in your [Koding](https://koding.com) environment.

What is MEAN.io
---------------

[MEAN.io](http://mean.io/) is an opinionated fullstack javascript framework which simplifies and accelerates web application development.
It contains Mongodb, Angular.js, Express.js, and Node.js.

The folowing instructions pertain the the MEAN stack as found on http://mean.io. There is a competing MEAN stack found at http://mean.js but a full discussion regarding the merits of the competing stacks is beyond the scope of this document.
Step 1 - Install the Prerequisites
----------------------------------

Before we can install MEAN, we need to install the following dependencies:

 - build-essentials
 - make
 - GCC compiler

Open your [Koding Terminal](https://koding.com/Terminal) and type the following:


    sudo apt-get install gcc make build-essential


After typing this and hitting enter, you might be prompted for a password. Type in the password of your Koding account and hit enter.

This command might take a few minutes to execute and will fetch and install all the required prerequisites.

Step 2 - Install Required Supporting Applications
-------------------------------------------------

Follow the directions [HERE](http://learn.koding.com/guides/install-mongodb/) to install mongodb.

Still in your [Koding Terminal](https://koding.com/Terminal), type the following to install grunt:

    npm install -g grunt-cli

Step 3 - Install MEAN
------------------------------

Still in your [Koding Terminal](https://koding.com/Terminal), type the following:

    npm install -g mean-cli

Step 4 - Creating your first MEAN Application
---------------------------------------------

    $ mean init <myApp>
    $ cd <myApp> && npm install

The npm install will install all the dependencies for your MEAN Application and will take several minutes. 

Once the install is complete, you may start the server for your application using either grunt or node with the following commands (respectively):

    $ grunt
    $ node server

Then, open a browser and go to:
  http://YOURID.koding.io:3000
  
Where YOURID is replaced with your actual koding id.
