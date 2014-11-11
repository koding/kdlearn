---
title: Installing PHP
author: Team Koding
date: 2014-08-06
categories: [koding, php]

template: page.toffee
---

# Installing PHP

To install the latest version of PHP, use these commands in the Terminal:

```
sudo apt-get install php5
```

After that we need a library that will interact with the Apache server. You can install that using the following command.

```
sudo apt-get install libapache2-mod-php5
```

Now, you need to restart the Apache server to see the changes.

```
sudo /etc/init.d/apache2 restart
```
That is all!
