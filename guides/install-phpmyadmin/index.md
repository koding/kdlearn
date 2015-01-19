---
title: Install phpMyAdmin
author: Team Koding
date: 2014-10-11
categories: [phpmyadmin, mysql]
template: page.toffee
---

# How to install phpMyAdmin

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install phpMyAdmin using just one command:

```
kpm install phpmyadmin
```

***

This guide will walk you through the steps you need to take in order to get **phpMyAdmin** installed on your Koding VM.

Just follow the steps and you should get phpMyAdmin installed in no time.

## Step 1

The first thing that you need to do is to update our package list. You can do that using the following command.

```
sudo apt-get update
```

After that you can go ahead and install phpmyadmin using the following command:

```
sudo apt-get install phpmyadmin
```

## Step 2

During the installation process you will be prompted to ansyour some questions in order to configure the installation properly.

When asked to choose the server, you need to select **apache2**.

![pma1](pma1.png)

For the next question select **Ok**.

![pma2](pma2.png)

You need to select **Yes** for the next step in order to set up the database using `dbconfig-common`.

![pma3](pma3.png)

Choose a password for your root user.

![pma4](pma4.png)

And then a password for the phpmyadmin installation.

![pma5](pma5.png)

Last step is to confirm that password.

## Step 3

After the installation process has finished you have to make sure that the Apache server is serving phpmyadmin properly. In order to do that you need to edit the Apache configuration file. You can use the following command.

```
sudo nano /etc/apache2/apache2.conf
```

And at the very bottom of the file you need to include the following line.

```
Include /etc/phpmyadmin/apache.conf
```

Save the file.

One more thing that you need to do before you can see everything working is to enable the **mcrypt** extension. You can do that using the following command.

```
sudo php5enmod mcrypt
```

## Step 4

Restart the Apache server using the following command and you should see everything working.

```
sudo service apache2 restart
```

You will now be able to access phpmyadmin by following a similar URL:

```
http://KODING_USERNAME.koding.io/phpmyadmin
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

And that's it.

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).

