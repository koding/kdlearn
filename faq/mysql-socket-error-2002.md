---
title: MySQL Socket Error 2002
importance: 10
---

If you try to use MySQL and receive an error that looks similar to the
following:

```
ERROR 2002 (HY000): Can't connect to local MySQL server through socket
'/var/run/mysqld/mysqld.sock'
```

First, make sure MySQL is installed and running on your VM. To install
MySQL, follow this [installation guide](http://learn.koding.com/guides/installing-mysql/).

Once you have confirmed that MySQL is installed, start it by running the following command:

```
sudo service mysql start
```

This should get rid of the `Socket Error 2002` error.

If not, send us an email at support@koding.com and we can troubleshoot for you.
