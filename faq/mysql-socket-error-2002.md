---
title: MySQL Socket Error 2002
importance: 5
---

If you try to use MySQL and receive an error that looks similar to the 
following:

```
ERROR 2002 (HY000): Can't connect to local MySQL server through socket 
'/var/run/mysqld/mysqld.sock'
```

That means MySQL is not running.

To start it, simply run `sudo service mysql start` and type in your sudo 
password when prompted.

**Reminder**: Your Sudo password is your Koding password.
