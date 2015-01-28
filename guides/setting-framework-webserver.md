---
title: Setting up a framework webserver
author: Levent Yalcin
username: leventyalcin
date: 2014-06-25
categories: [python, php]
---

# Setting up a framework webserver

Koding is the easiest way to _say goodbye to your localhost_. 

Using your personal machine for projects means you have to bind your daemons to public IP address, which can be a bit frustrating for a beginner. Developers usually tend to use certain frameworks that have built-in web servers. These web servers give you the ability to develop your projects and then test them. But there is a downside to that approach. Those web servers are not designated for production usage and besides that they only run locally which makes your daemon/project not accessible to the rest of the world. This means you can't reach them from your Koding public domain. If you want to achieve this and make you daemons available for public access you have to bind your daemons to 0.0.0.0 which listens to all IPv4 addresses. 

Here are a couple of examples on how to make your project available publicly by using Koding as your development playground.

# Django

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Django using just one command:

```
kpm install django
```

***

First we install Django and then create a project.
```
sudo pip install django 
```
After Django has finished installing we start a new project like so:
```
django-admin.py startproject goodbyelocalhost
```
After that we run our built-in web server without binding it to localhost
```
cd goodbyelocalhost/
python manage.py runserver 0.0.0.0:8000
```
Voilà! You should see a working Django server.

# Laravel 4 and Artisan

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Laravel using just one command:

```
kpm install laravel
```

***

Installing Laravel 4
```
sudo curl -o /usr/local/bin/laravel 'http://laravel.com/laravel.phar'
```
Set execute permission on the Laravel executeable.
```
sudo chmod +x /usr/local/bin/laravel
```
We create a new new Laravel project.
```
laravel new goodbyelocalhost
```
Navigate into the directory:
```
cd goodbyelocalhost
```
And then we start the webserver:
```
php artisan serve --host=0.0.0.0 --port=8080
```    
Voilà! A working Laravel and Artisan webserver.

# MeteorJS

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install MeteorJS using just one command:

```
kpm install meteor
```

***

Install MeteorJS
```
curl https://install.meteor.com/ | sh
```
Creating a Meteor project is as simple as 1, 2, 3
```
meteor create goodbyelocalhost
```
Running the project 
```
meteor
```
Meteor should listen to 0.0.0.0:3000 by default. If you can't reach your project via the browser you have to make sure it listens to 0.0.0.0:3000. You can check this using the `netstat` command in another terminal window. 
```
sudo netstat -tnlp
```

# Rails

Rails listens to 0.0.0.0:3000 by default. 

Install Rails via the following command
```
sudo gem install rails
```    
Create a new project
```
rails new goodbyetolocalhost
cd goodbyetolocalhost
```
Start the webserver
``` 
rails server
```
Voilà! You have a Rails working webserver

# Tornado

Create a new Python script using your favorite editor.
```
vim goodbyetolocalhost.py
```
Create a `Hello, World!` like so, to test if the webserver is running correctly.

```python
import tornado.ioloop
import tornado.web
 
class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")
 
application = tornado.web.Application([
    (r"/", MainHandler),
])
 
if __name__ == "__main__":
    application.listen(8888, '0.0.0.0') 
    tornado.ioloop.IOLoop.instance().start()
```
Then just run the script
```
python goodbyetolocalhost.py
```

# Symfony2

**Installing Symfony2**

First we need to install composer. Run the following commands to download, move and give right permissions to composer.
```
curl -sS https://getcomposer.org/installer | php #!/usr/bin/env php
sudo mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
```
Create a new project to test you webserver.
```
composer create-project symfony/framework-standard-edition goodbyetolocalhost 
cd goodbyetolocalhost
```
Start the server like so.
```
php app/console server:run 0.0.0.0:8080 
```
Enjoy a fully working Symfony2 webserver!
