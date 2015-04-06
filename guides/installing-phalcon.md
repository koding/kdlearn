---
title: Installing Phalcon on Koding
author: Jay
username: aaaqqq
date: 2014-06-27
categories: [frameworks platforms, php]
---

# Installing & Setting Up Phalcon

This article will cover the process of installing and setting up Phalcon in your [Koding](https://koding.com) environment.

What is Phalcon
---------------

[Phalcon](http://phalconphp.com/) is an open source framework for PHP 5. It differs from other frameworks like Codeigniter, Laravel, etc. in that it is implemented as a C extension. This minimizes memory usage and offers significant performance advantages in comparison to other frameworks.

Step 1 - Install the Prerequisites
----------------------------------

Before we can install Phalcon, we need to install the following dependencies:

 - PHP 5.x development resources
 - GCC compiler

Open your [Koding Terminal](https://koding.com/Terminal) and type the following:


    sudo apt-get install php5-dev php5-mysql gcc libpcre3-dev


After typing this and hitting enter, you might be prompted for a password. Type in the password of your Koding account and hit enter.

This command might take a few minutes to execute and will fetch and install all the required prerequisites.

Step 2 - Fetch the Source Code
------------------------------

In your [Koding Terminal](https://koding.com/Terminal) and type the following:


    git clone --depth=1 git://github.com/phalcon/cphalcon.git


Executing this command will create a directory named **cphalcon** and save the latest stable source code in it. We will use this source code to install Phalcon in the next step.
  
Step 3 - Install Phalcon
------------------------

Once you have fetched the source code in **step 2**, type the following two commands in your [Koding Terminal](https://koding.com/Terminal):


    cd cphalcon/build
    sudo ./install


Executing these commands will install the Phalcon extension for PHP in your Koding environment.


Step 4 - Modify php.ini
-----------------------

We now have to modify the **php.ini** file to include the newly installed Phalcon extension. We can do this by creating a new configuration file for this extension (located at **/etc/php5/apache2/conf.d/30-phalcon.ini**) and adding the following line to it:


    extension=phalcon.so

If you are familiar with vim or nano, you can use either to do this. Alternatively, you can type the following command to append the above line in php.ini:

    sudo sh -c "echo 'extension=phalcon.so' > /etc/php5/apache2/conf.d/30-phalcon.ini"


This will create the new configuration file and add the required line.


Step 5 - Restart Apache
-----------------------

After completing all the above steps, all that is left to do is restart Apache so that it can load the Phalcon module for PHP. Type in the following command in your [Koding Terminal](https://koding.com/Terminal):

    sudo service apache2 restart


Step 6 - Verify the Installation
--------------------------------

Create a new php file in your public web directory **/home/USERNAME/Web** (*replace USERNAME with your Koding username*). You can name it anything but for this example, we'll name it **phpinfo.php**. Put the following content in this file:

    <?php
    phpinfo();


Once this is done, you can open this file in your browser by visiting


    http://hostname.username.koding.io/phpinfo.php 



This page should show you the PHP configuration on your machine. 


One of the section contains information about Phalcon (search on the page for **phalcon** by pressing **Ctrl + F**). 

If you can see this section, it means that Phalcon has been installed on your machine and you can start using it right away!
