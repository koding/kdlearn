---
title: How to install Composer
author: Team Koding
categories: [frameworks platforms, composer, php]
template: page.toffee
---

# Installing Composer

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Composer using just one command:

```
kpm install composer
```

***

## Getting started

Before you can start the Composer install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Make sure you have [PHP](http://learn.koding.com/guides/installing-php) and the `php5-curl` package installed on your VM before you continue. You can install the later using the following command:

```
sudo apt-get install php5-curl
```

## Installing

To get Composer working for a new project you'll need to run the following commands:

```
cd Web
mkdir your_project
cd your_project
```

Now download Composer into this folder with the following command:

```
curl -sS https://getcomposer.org/installer | php
```

This will install Composer and you should see something like this.

```
All settings correct for using Composer
Downloading...

Composer successfully installed to: /Web/your_project/composer.phar
Use it: php composer.phar
```

Alternatively you can specify the --install-dir option and it will download it wherever you specify:

```
curl -sS https://getcomposer.org/installer | php -- --install-dir=/var/www/another_folder
```

If you want to check if Composer is working properly, you can use the following command that will bring up a list of available commands:

```
php composer.phar
```

And that's it!

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
