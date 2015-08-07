---
author: Federico Ponzi
categories: [databases, postgresql, sql]
---

# Using PostgreSQL


PostgreSQL is an open source relational database management system that 
provides an implementation of the SQL query language. In this guide, 
we'll go over using PostgreSQL on your Koding VM. Lets get started!

## Starting PostgreSQL

Before we gets started, start your PostgreSQL server with the following 
command.

```
sudo service postgresql start
```

If you see an error like the following message, you may need to go 
through the [Installing PostgreSQL](/guides/installing-postgresql).

```
psql: could not connect to server: No such file or directory
Is the server running locally and accepting
connections on Unix domain socket "/var/run/postgresql/.s.PGSQL.5432"?
```

## Getting Started

To getting started with postgreSQL, open your [Terminal](https://koding.com/Terminal), and type:

    username$ sudo su - postgres

Now you are logged into your vm with the postgres user. Then connect to template1 database using the postgresql's psql client:

    postgres ~$  psql template1
    postgres ~$  template1=#
    
Note the # symbol, declaring that you are logged to the database as a *Super User*. Now for enchaned security change your default postgres's password:

    template1=# \password
    Enter new password:
    Enter it again:
    
Nice, we are near the end: now create a new user with createdb permission with same username of your vm. So if your username is koding02, your prompt should be like:

    koding02 ~$
    
**Create a new user** using the CREATE USER command like this:

    template1=# CREATE USER username
    template1-# WITH PASSWORD 'password' createdb;
    CREATE ROLE
    template1=#

You are done configurating **PostgreSQL**! Now disconnect from the database using `\q`, and quit from postgres user using `ctrl+d`.

Now you can **create** a new database using the command:

    createdb myFreshNewDb

And **delete** it using the deletedb tool:
    
    deletedb myFreshNewDb
    
Once you have created a database, you can **connect** to it using the psql client like we did before:

    psql myFreshNewDb
    myFresNewDb=>

#Using Psql client
Let's see some useful commands of the psql tool. 
First of all: you can get some **help** just typing `\?` in your psql command line.
To exit from the appearing screen, just press the `q` button.

To **load and execute SQL statements from file**, you can use this syntax:

    \i my/file/path.sql

Writing long lines of SQL code in the command line can be really hard to debug. Use the \i to run from file or use:

    \e

To edit the input buffer with an editor. If you usually don't use editor from command line use nano - it's the simplest.
To check what relations your database contains, use

    \d
If you want more information about a particular **relation**, use

    \d myfancytable

Have fun!
    
    
