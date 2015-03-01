---
title: Setting up a Symfony2 webserver
author: Team Koding
date: 2015-02-26
categories: [symfony2,composer,php]
template: page.toffee
---

# Setting up a Symfony2 webserver

## Getting started

Before you can start the Symfony2 install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Then make sure you have `curl` installed on your VM. You can install it using the bellow command:

```
sudo apt-get install curl
```

Also you'll have to have Composer installed on your VM. You can install it either manually or using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/).

Run the following commands to download, move and give right permissions to Composer:

```
curl -sS https://getcomposer.org/installer | php #!/usr/bin/env php
sudo mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
```

or you can just run

```
kpm install composer
```

## Usage

Create a new project to test your webserver and move into that project:

```
composer create-project symfony/framework-standard-edition goodbyetolocalhost
cd goodbyetolocalhost
```

You can now start the Symfony2 webserver like so:

```
php app/console server:run 0.0.0.0:8080
```

You will now be able to access the Symfony2 webserver by following a similar URL:

```
http://KODING_USERNAME.koding.io:8080
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

If you can't reach your project via the browser you have to make sure it listens to 0.0.0.0:8080. You can check this, using the `netstat` command in another terminal window and the bellow command:

```
sudo netstat -tnlp
```

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
