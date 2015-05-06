---
title: Installing Jekyll on Koding
author: dehli
categories: [frameworks platforms, jekyll]
template: page.toffee
---

# Installing & Setting Up Jekyll
This tutorial will guide you through the installation of Jekyll on a Koding VM.

## Install Ruby2
Use the command below to install Ruby2 on your virtual machine:
```
kpm install ruby2
```

## Install Jekyll

Use this command to install Jekyll:
```
sudo gem install jekyll
```

## Create a Jekyll site
> type:tip
>  The next step can be skipped if you've already created a Jekyll site.

Execute the following command, where `~/JekyllSite` is the destination folder of your website:
```
jekyll new ~/JekyllSite
```
## Run the server

Set the current directory to the website's directory (for this tutorial it's ~/JekyllSite):
```
cd ~/JekyllSite
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
