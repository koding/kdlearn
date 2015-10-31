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

## Installing Composer for a Project

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

## Installing Composer Globally

If you use PHP and Composer frequently, instead of installing Composer for each project, you can install it globally to use it in any directory of your Koding machine. 

> type:tip
> If you install Composer using [kpm](http://learn.koding.com/guides/getting-started-kpm/), it is installed globally.

Composer is installed globally when the executable file is located in one of the folders where Linux looks for programs, i.e. the folders included in the PATH environment variable.
For instance, it is installed globally if you put the composer file into the `/usr/local/bin` folder.

First, you must download the Composer into a folder in your Koding machine.

```
curl -sS https://getcomposer.org/installer | php
```

And then move the Composer file into the `/usr/local/bin` folder.

```
sudo mv composer.phar /usr/local/bin/composer
```

After copying the file, you can run the Composer in any folder using the following command:

```
composer
```

## Further Information

Composer is a dependency manager for PHP projects. It allows you to find, download and configure components in your development projects. More information can be found in the [Composer website](https://getcomposer.org/) and the [Packagist component directory](https://packagist.org/).

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
