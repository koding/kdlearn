---
author: Team Koding
categories: [developer tools, apache, monitoring, linux, web dashboard]
---

# Installing Linux Dash

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Linux Dash using just one command:

```
kpm install linux-dash
```

***

Linux Dash is a low-overhead monitoring web dashboard for a GNU/Linux
machine. With a dead-simple installation and easy to view information, it
can make viewing an overview of your Linux system a beginner friendly
endevour. In this guide we'll go over this two step install process on
Koding. Lets get started!

## Installation

To install Linux Dash we simply need to download the source and then
place it into the Web folder. To do this, run the following
commands. Note, you can simply copy the entire group of commands and
paste it into your Terminal. They will execute sequentially.

```
wget https://github.com/afaqurk/linux-dash/archive/master.zip
unzip master.zip
rm master.zip
mv linux-dash-master ~/Web/dash
```

That's it! Linux Dash uses PHP, which means there is no traditional
installation process. We only need a few things, all of which Koding
comes with by default!

Linux Dash also supports NodeJS and Go in the same copy of the source. You can find instructions for those alternative server languages [here](https://github.com/afaqurk/linux-dash).

## Dashboard

To access your dashboard, visit your Koding Domain, which will look like
the following address.

```
http://hostname.username.koding.io/dash
```

Where `username` is your Koding Username. You will see a Dashboard,
similar to the following image.

![Linux Dash](https://raw.githubusercontent.com/afaqurk/screenshots/master/linux-dash/system-status-full.png)

That's all there is to it! Enjoy!

[dash]: linuxdash.com
