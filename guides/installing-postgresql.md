---
author: Team Koding
date: 2014-10-22
categories: [databases, postgresql, sql]
---

# Installing PostgreSQL

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install PostgreSQL using just one command:

```
kpm install postgresql
```

***

PostgreSQL is an open source relational database management system that 
provides an implementation of the SQL query language. In this guide, 
we'll go over installing PostgreSQL on your Koding VM. Lets get started!

## Updating, and Installing

We can install Postgres by using apt-get. To do this, open your 
[Terminal][terminal] and paste in the following two commands.

```
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
```

Once these two commands finish Postgres should be installed and running.

## Confirming Your Installing

To confirm your Installation and that Postgres is running, run the 
following command in your [Terminal][terminal].

```
service postgresql status
```

It should respond with approximately the following.

```
9.3/main (port 5432): online
```

## Connecting and Using PostgreSQL

For instructions on using Postgres, see the [Using PostgreSQL][using] 
guide.



[terminal]: https://koding.com/IDE
[using]: /guides/postgresql-on-koding
