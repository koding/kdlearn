---
title: Install phpMyAdmin
author: Team Koding
categories: [developer tools, phpmyadmin, mysql]
template: page.toffee
---

# How to install phpMyAdmin

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install phpMyAdmin using just one command:

```
kpm install phpmyadmin
```

***

This guide will walk you through the steps you need to take in order to get **phpMyAdmin** installed on your Koding VM and also it will answer any questions you might have regarding it operating properly.

Just follow the steps and you should get phpMyAdmin installed in no time.

## Step 1

The first thing that you need to do is to update your package list. You can do that using the following command.

```
sudo apt-get update
```

After that you can go ahead and install phpMyAdmin using the following command:

```
sudo apt-get install phpMyAdmin
```

## Step 2

During the installation process you will be prompted to answer some questions in order to configure the installation properly.

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

Save the file by pressing `ctrl+o`.

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

## Can't login to phpMyAdmin?

You might encounter this issue at some point. When this happens, there are multiple causes: either the mySQL server is not working properly, you forgot your credentials or something happened to phpMyAdmin.

In order to fix the first case you can follow [this guide](http://learn.koding.com/faq/mysql-socket-error-2002/).

If you forgot your credentials you can follow these steps:

You can change the mySQL root password by killing the process:

```
kill `cat /var/run/mysqld/mysqld.pid`
```

Create a text file containing the following statement on a single line. Replace the password with the password that you want to use.

```
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('MyNewPass');
```

Save the file. This example names the file `/home/me/mysql-init`. The file contains the password, so do not save it where it can be read by other users. If you are not logged in as mysql (the user the server runs as), make sure that the file has permissions that permit mysql to read it.

Start the MySQL server with the special --init-file option:

```
mysqld_safe --init-file=/home/me/mysql-init &
```

The server executes the contents of the file named by the --init-file option at startup, changing the 'root'@'localhost' account password.

After the server has started successfully, delete `/home/me/mysql-init`.

phpMyAdmin should use the password you set above.

Make sure you set the new password into phpMyAdmin's `config.inc.php` too, by updating this line:

```
$cfg['Servers'][$i]['password'] = 'yourpassword';
```

> type:tip
> You can find the phpMyAdmin config file here `/etc/phpmyadmin/config.inc.php`.

And that's it.

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).

