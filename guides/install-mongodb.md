---
author: Team Koding
date: 2014-10-17
categories: [mongodb]
---

# Installing MongoDB

In this short guide we'll explain how to install MongoDB, and modify
it's configuration to run in a small storage environment. Lets get 
started!

## Installation

Installation is easy, and can be done with `apt-get`, as seen in the 
following command.

```
sudo apt-get install mongodb
```

That's it! You can start Mongo with the following command:

```
sudo service mongodb start
```

NOTE: If you're running Mongo on a Free Koding VM, read below..

## Configuring for Limited Storage

If you're running Mongo on a Free VM, you'll need to configure it to use 
small files. To do that, open up the `/etc/mongodb.conf` file with the
following command:

```
sudo nano /etc/mongodb.conf
```

With that file open, navigate to the bottom and add the following line:

```
smallfiles=true
```

Now use `ctrl-x` to save the file. After you've saved the file, simply 
restart Mongodb with the following command:

```
sudo service mongodb restart
```
