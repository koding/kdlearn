---
title: How to install Memcache
author: Team Koding
categories: [databases, memcache, php, apache]
template: page.toffee
---

# How to install Memcache

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Memcache using just one command:

```
kpm install memcached
```

***

## Getting started

Before you can start the Memcache install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Make sure you have [mySQL](http://learn.koding.com/guides/installing-mysql) and [PHP](http://learn.koding.com/guides/installing-php) installed on your VM before you continue.

## Step 1

To install Memcache you'll need to run the following command:

```
sudo apt-get install php5-memcached memcached
```

This will install the required package for PHP and also the Memcached package.

## Step 2

You can now check if the packages have been installed correctly. Run the following commands from your Terminal:

```
cd Web
sudo nano info.php
```

Copy the following lines into the file:

```
<?php
phpinfo();
?>
```

You'll now be able to check if Memcache has installed correctly by accessing a url similar to this one:

```
http://KODING_USERNAME.koding.io/info.php
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

If you scroll down or search for the "memcached" section header, you should find something that looks like this:

![memcache](php_info.png)

You can check whether the Memcache service is running by typing:

```
ps aux | grep memcached
```

And it should output something similar to this:

```
memcache  6584  0.0  0.0 327448  3004 ?        Sl   14:07   0:00 /usr/bin/memcached -m 64 -p 11211 -u memcache -l 127.0.0.1
demouser  6636  0.0  0.0  11744   904 pts/0    S+   14:29   0:00 grep --color=auto memcached
```

You can query Memcache for stats by typing:

```
echo "stats settings" | nc localhost 11211
```

And that's it!

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
