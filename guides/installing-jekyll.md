---
title: Installing Jekyll on Koding
author: dehli
categories: [frameworks platforms, jekyll]
template: page.toffee
---

# Installing & Setting Up Jekyll

This tutorial will guide you through the installation of Jekyll.

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

*This step can be skipped if you've already created a Jekyll site.*

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
*For more details on the host argument, visit [here](http://learn.koding.com/guides/what-happened-to-127-0-0-1/).*

## View the website

Navigate to [http://username.koding.io:4000](http://username.koding.io:4000).

*Make sure to replace username.*