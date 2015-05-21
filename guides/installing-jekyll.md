---
title: Installing Jekyll on Koding
author: dehli
categories: [frameworks platforms, jekyll]
template: page.toffee
---

# Installing & Setting Up Jekyll

Before you continue reading this guide why not try a more easy way using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Jekyll using just one command:

```
kpm install jekyll
```

***

This tutorial will guide you through the installation of Jekyll on a Koding VM.

## Install RVM
Use the two commands below to install rvm on your virtual machine (for more information visit [here](https://rvm.io/rvm/install)):
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Then run the rvm script:
```
source .rvm/scripts/rvm
```

## Install Jekyll

Use this command to install Jekyll:
```
gem install jekyll
```

## Create a Jekyll site
> type:tip
>  The next step can be skipped if you've already created a Jekyll site.

Execute the following command, where `JekyllSite` is the destination folder of your website:
```
jekyll new JekyllSite
```
## Run the server

Set the current directory to the website's directory (for this tutorial it's JekyllSite):
```
cd JekyllSite
```

Execute the following command:
```
jekyll serve --host 0.0.0.0
```
> type:tip
> For more details on your hostname, read [this](http://learn.koding.com/guides/what-happened-to-127-0-0-1/).*

## View the website

Navigate to [http://username.koding.io:4000](http://username.koding.io:4000)
> type:tip
> Make sure to replace `username` above with your Koding username.
