---
title: Setting up a Rails webserver
author: Team Koding
categories: [frameworks platforms, rails,ruby]
template: page.toffee
---

# Setting up a Rails webserver

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Rails using just one command:

```
kpm install rails
```

***

## Getting started

Before you can start the Rails install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Then make sure you have Ruby installed on your VM. You can install it by following [this guide](http://learn.koding.com/guides/getting-started-ruby/).

## Installing

You can install Rails using the bellow command:

```
sudo gem install rails
```

## Usage

Creating a Rails project is really easy. It just takes one command and you're good to go:

```
rails new goodbyetolocalhost
cd goodbyetolocalhost
```

You can run the Rails webserver like so:

```
rails server -b 0.0.0.0
```

You will now be able to access the Rails webserver by following a similar URL:

```
http://KODING_USERNAME.koding.io:3000
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

Rails should listen to 0.0.0.0:3000 by default. If you can't reach your project via the browser you have to make sure it listens to 0.0.0.0:3000. You can check this, using the `netstat` command in another terminal window and the bellow command:

```
sudo netstat -tnlp
```

And that's it!

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
