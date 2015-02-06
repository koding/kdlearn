---
title: Using mySQL
author: Alvin Wan
date: 2015-01-08
categories: [koding, mysql]
template: page.toffee
---

# Using mySQL

mySQL offers a popular implementation of the SQL language. This guide will get you started on using mySQL on Koding.

First make sure you have mySQL installed. Have a look at [this guide](http://learn.koding.com/guides/installing-mysql) to learn how to install it.

Are you using PostgreSQL? Have a look at [this guide](http://learn.koding.com/guides/postgresql-on-koding).

## Starting mySQL

Let's start the mySQL server using the following command:

```
sudo service mysql start
```

## Getting Started

First, you'll need to login using th root user that was configured during the mySQL installation. Open your [Terminal](https://koding.com/Terminal) and type in the following:

```
mysql -u root p
```

Enter your password, and hit enter. You're now logged in.

## Creating a User

You'll now create a new account for our code, with the username "bob" and password "pass".

```
create user 'bob'@'localhost' identified by 'pass';
```

If you see an arrow

```
->
```

that means you forgot the end semicolon ";". Enter that and hit enter.

You can exit the server by using Ctrl+D and then login again as Bob:

```
mysql -u bob -p;
```

After entering the password, you'll be readmitted into the mySQL server. To continue with this guide, you'll need to be logged in as root.

## Creating a Database

Each mySQL server includes a variety of databases. The initial installation comes with several. You can view them by typing:

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

Let's create your first database:

```
create database test;
```

## Linking Users and Databases

You'll need to grant privileges to the user, so that "Bob" can access the database "test" and modify it accordingly.

To grant "Bob" all privileges on all tables in database "test":

```
grant all on test.* to 'bob'@'localhost';
```

## Using the Database

Exit out of root by using Ctrl+D, and login as "Bob". To connect to a database, prefix the database name with "use".

```
use test;
```

Once here, you’ll be able to execute mySQL commands. 

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).