---
title: Installing mySQL
author: Team Koding
date: 2014-07-30
categories: [koding, mysql]
---

In this guide we will cover the basics on how you can install MySQL and the latest version of PHP-MySQL modules on your Koding VM. Please note, MySQL is installed by default on your Koding VM so install MySQL only if you have either uninstalled it or if your MySQL install is not working. This [guide][mysql] describes how to configure/operate your existing default install of MySQL.

To proceed with the installation of MySQL, follow these stpes:

First you you'll need to install/ the MySQL server and client using the following command:

``` 
sudo apt-get install mysql-server mysql-common mysql-client
```

When asked for the password, enter the root password. Keep in mind that the root password is your Koding password.

We then need to reload the configuration for MySQL to work properly.

```
sudo initctl reload-configuration
```

In order to start the MySQL server you need to input the following command. This will start MySQL as a service on your VM.

```
sudo service mysql start
```

After you are finished with MySQL you need to install the MySQL extension(s) for PHP. You can do this using the following command:

```
sudo apt-get install php5-mysql
```

The last step is to restart the Apache server. This will ensure all your configuration are now live and thus you can put them to good use.

```
sudo /etc/init.d/apache2 restart
```

That's it!

[mysql]: http://learn.koding.com/guides/mysql-on-koding/
