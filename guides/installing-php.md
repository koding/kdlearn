---
title: Installing PHP
author: Team Koding
date: 2014-08-06
categories: [koding, php]

template: page.toffee
---

# Installing PHP

To install the latest version of PHP on you Koding VM you just have to input these commands in your Koding Terminal and you're all good to go.

To install the latest version of PHP, use this:

```
sudo apt-get install php5
```

After that we need a library that will interact with the Apache server. You can install that using the following command.

```
sudo apt-get install libapache2-mod-php5
```

And last but not least, you need to restart the Apache server to see the changes.

```
sudo /etc/init.d/apache2 restart
```
That is all!

## Note

Keep in mind that all commands require `sudo` access. In case you don't know what's your root password, read [this](http://learn.koding.com/faq/what-is-my-sudo-password/).