---
title: Using mySQL
author: Alvin Wan
date: 2015-01-08
template: page.toffee
---

# Using mySQL

mySQL offers a popular implementation of the SQL language. This guide will get you started on using mySQL at Koding.

Are you using PostgreSQL? Seeing [Using PostgreSQL](http://learn.koding.com/guides/postgresql-on-koding)

## Starting mySQL

Let’s start the mySQL server using the following:

```
sudo service mysql start
```

If you see an error similar to the following, please see [Installing mySQL]()

```
mysql: could not connect to server: No such file or directory
```

## Getting Started

First, you’ll need to login. Your instinctive response: what login? Don’t worry. Your root Super User was configured during the mySQL installation. Open your [Terminal](https://koding.com/Terminal) and type in the following:

```
mysql -u root p
```

Enter your password, and hit enter. You’re now logged in.

## Creating a User

We’ll now create a new account for our code, with username “bob” and password “pass”.

```
create user ‘bob’@‘localhost’ identified by ‘pass’;
```

If you see an arrow

```
->
```

that means you forgot the end semicolon “;”. Enter that and hit enter.

You can exit from server by using ctrl+D and then login again as Bob:

```
mysql -u bob -p;
```

After entering the password, you’ll be readmitted into the mySQL server. To continue with this guide, you’ll need to be logged in as root.

## Creating a Database

Each mySQL server includes a variety of databases. The initial installation comes with several; you can view them by typing:

```
show databases;
```

You should see a short list of databases:

```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)
```

Let’s create our first database:

```
create database test;
```

## Linking Users and Databases

You’ll need to grant privileges to the user, so that “Bob” can access the database “test” and modify it accordingly.

To grant Bob all privileges on all tables in database ‘test’:

```
grant all on test.* to ‘bob’@‘localhost’;
```

## Using the Database

Exit out of root by using ctrl+D, and login as bob. To connect to a database, prefix the database name with “use”.

```
use test;
```

Once here, you’ll be able to execute mySQL commands. Tutorial finished.