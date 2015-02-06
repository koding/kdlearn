---
title: CouchDB installation for beginners
author: Team Koding
date: 2015-01-20
categories: [gruntjs]
template: page.toffee
---

# CouchDB installation for beginners

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install CouchDB using just one command:

```
kpm install couchdb
```

***

This guide will help install CouchDB on your Koding VM.

## Getting started

Before you can start the CouchDB install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Make sure you have curl installed on your VM before you continue. You can install it using the following command:

```
sudo apt-get install curl
```

## Installing

CouchDB can be installed by running the following command:

```
sudo apt-get install couchdb
```

By default CouchDB runs on port :5984. If you want to check CouchDB and see if it's running correctly you can issue this command:

```
curl localhost:5984
```

and it should output something like this:

```
{"couchdb":"Welcome","uuid":"dfd16361e5321d4a90d01feedee6c0b1","version":"1.5.0","vendor":{"name":"Ubuntu","version":"14.04"}}
```

## Usage

If you want to create a new database you can use the PUT command:

```
curl -X PUT localhost:5984/new_database
```

The output should look like this:

```
{"ok":true}
```

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).