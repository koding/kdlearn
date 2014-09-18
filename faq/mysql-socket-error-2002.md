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

That means MySQL is installed but not running.

To start it, simply run the following command to start it.

```
sudo service mysql start
```
