---
title: Installing mySQL
author: Team Koding
date: 2014-07-30
categories: [koding, php]

template: page.toffee
---

In this guide we will cover the basics on how you can install mySQL and the latest version of PHP on you Koding VM. If you don't want to install mySQL, checkout this [guide][mysql], because Koding VMs come preinstalled with mySQL.

First you you'll need to install the mySQL server and client using the following command:

``` 
sudo apt-get install mysql-server mysql-common mysql-client
```

When asked for the password, enter the root password. Keep in mind that the root password is your Koding password.

We then need to reload the configuration for mySQL to work properly.

```
sudo initctl reload-configuration
```

In order to start the mySQL server you need to input the following command. This will start mySQL as a service on your VM.

```
sudo service mysql start
```

After you finished with mySQL you need to install the mySQL extension for PHP. You can do this using the following command:

```
sudo apt-get install php5-mysql
```

The last step is to restart the Apache server. This will ensure all your configuration are now live and thus you can put them to good use.

```
sudo /etc/init.d/apache2 restart
```

That's it!

[mysql]: http://learn.koding.com/guides/mysql-on-koding/