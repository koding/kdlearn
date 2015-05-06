---
title: Setting up a Django webserver
author: Team Koding
categories: [frameworks platforms, django,python]
template: page.toffee
---

# Setting up a Django webserver

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Django using just one command:

```
kpm install django
```

***

## Getting started

Before you can start the Django install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Then make sure you have `pip` installed on your VM. You can install it using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) like so:

```
kpm install pip
```

## Installing

You can install Django using the bellow command:

```
sudo pip install django
```

## Usage

After Django has finished installing you can start a new project like so:

```
django-admin.py startproject goodbyelocalhost
```

After that you can run the webserver without binding it to localhost using the bellow commands:

```
cd goodbyelocalhost/
python manage.py runserver 0.0.0.0:8000
```

You will now be able to access the Django webserver by following a similar URL:

```
http://KODING_USERNAME.koding.io:8000
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

If you can't reach your project via the browser you have to make sure it listens to 0.0.0.0:8000. You can check this, using the `netstat` command in another terminal window and the bellow command:

```
sudo netstat -tnlp
```

And that's it!

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
