---
title: How to install Redis
author: Team Koding
categories: [databases, redis]
template: page.toffee
---

# How to install Redis

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Redis using just one command:

```
kpm install redis
```

***

## Getting started

Before you start the Redis install process, you'll need to install a few things.

But first update all of the apt-get packages:

```
sudo apt-get update
```

You'll need to download a compiler with build essential which will help you install Redis from the source:

```
sudo apt-get install build-essential
```

Last but not least download and install tcl:

```
sudo apt-get install tcl8.5
```

## Step 1

Download the source from the official website.

```
wget http://download.redis.io/releases/redis-2.8.19.tar.gz
```

Untar it and switch into the newly created directory:

```
tar xzf redis-2.8.19.tar.gz

cd redis-2.8.19
```

Continue with the `make` command:

```
make
```

After that you should run the recommended command:

```
make test
```

Lastly run `make install`, which installs the program system-wide.

```
sudo make install
```

## Step 2

Once Redis has finished installing, you'll be able to run it as a background daemon because it comes with a built in script that allows you to do that.

To access the script switch into the utils directory:

```
cd utils
```

From there, run the Ubuntu install script using the following command:

```
sudo ./install_server.sh
```

While the script is running, you can choose the default options by pressing enter. Once the script is done, the redis-server will be running in the background.

You now have access to these commands that can start and stop Redis (the number depends on the port you set during the installation. 6379 is the default port setting):

```
sudo service redis_6379 start
sudo service redis_6379 stop
```

## Step 3

You can now access the Redis database by typing the following command:

```
redis-cli
```

You now have Redis installed and running. The prompt will look like this:

```
redis 127.0.0.1:6379>
```

If you want to set Redis to automatically start when you boot up your VM, run the next command:

```
sudo update-rc.d redis_6379 defaults
```

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
