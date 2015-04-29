---
title: Setting up a MeteorJS webserver
author: Team Koding
categories: [frameworks platforms, meteorjs]
template: page.toffee
---

# Setting up a MeteorJS webserver

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install MeteorJS using just one command:

```
kpm install meteor
```

***

## Getting started

Before you can start the MeteorJS install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Then make sure you have `curl` installed on your VM. You can install it using the bellow command:

```
sudo apt-get install curl
```

## Installing

You can install MeteorJS using the bellow command:

```
curl https://install.meteor.com/ | sh
```

## Usage

Creating a new MeteorJS project is really easy. It just takes one command and you're good to go:

```
meteor create goodbyelocalhost
```

You can run that project like so:

```
cd goodbyelocalhost
meteor
```

You will now be able to access the MeteorJS webserver by following a similar URL:

```
http://KODING_USERNAME.koding.io:3000
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

MeteorJS should listen to 0.0.0.0:3000 by default. If you can't reach your project via the browser you have to make sure it listens to 0.0.0.0:3000. You can check this, using the `netstat` command in another terminal window and the bellow command:

```
sudo netstat -tnlp
```

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
