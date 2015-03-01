---
title: Setting up a Laravel webserver with Artisan
author: Team Koding
date: 2015-02-26
categories: [laravel, artisan,php]
template: page.toffee
---

# Setting up a Laravel webserver with Artisan

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Laravel using just one command:

```
kpm install laravel
```

***

## Getting started

Before you can start the Laravel install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Then make sure you have `curl` installed on your VM. You can install it using the bellow command:

```
sudo apt-get install curl
```

## Installing

You can install Laravel using the bellow command:

```
sudo curl -o /usr/local/bin/laravel 'http://laravel.com/laravel.phar'
```

After that process is over you need to set execute permission on the Laravel executable.

```
sudo chmod +x /usr/local/bin/laravel
```

## Usage

You can now create a new Laravel project.

```
laravel new goodbyelocalhost
```

After that you should navigate into the newly created directory:

```
cd goodbyelocalhost
```

and you should have the ability to start the webserver using the bellow command:

```
php artisan serve --host=0.0.0.0 --port=8080
```

You will now be able to access the Laravel webserver by following a similar URL:

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
