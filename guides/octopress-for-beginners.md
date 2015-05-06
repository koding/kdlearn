---
title: Octopress Installation for Beginners
author: Team Koding
categories: [frameworks platforms, octopress, markdown]
template: page.toffee
---

# Octopress Installation for Beginners

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Octopress using just one command:

```
kpm install octopress
```

***

In this guide we'll go over the basics of setting up Octopress.

## What is Octopress?

Octopress is a framework built on top of Jekyll, a static site generator. Think of it like easier, friendlier, more powerful Jekyll.

Static site generators get a fair amount of buzz these days, for good reason. They're simple to maintain, easy to contribute to, and store content in a user friendly manner. The compilation process can sometimes be complex, but at the end of the day your content is understandable by all, and your site has no dependencies to run. No databases to manage, no real points of failure, it's static.

## Octopress and Koding

The only downside to static site generators is publishing the content often requires a local machine of some sort. Non-static sites have the ability to take your input from the browser and save it somewhere such as your Disk or a Database. This complexity allows you to do all of this from your browser, and static sites suffer in this regard.

With [Koding](https://koding.com) this is not the issue. Koding enables the "local machine" entirely in your browser. No local tools needed, no local installs needed, no localhost hassle. Lets go over the process of installing Octopress, on Koding!

## Tutorial Steps

First, we want to get a hold of the Octopress code base. Open your [Terminal](https://koding.com/Develop/Terminal) and run the following two commands to clone Octopress, and navigate into the directory.

```
git clone git://github.com/imathis/octopress.git octopress
cd octopress
```

Next, we need to install some dependencies for Octopress. Run the following commands, which will install Bundle, then use Bundle to install the Octopress dependencies. Lastly, we use `rake` to set up some directories and initialize our project.

```
sudo gem install bundle
bundle install
rake install
```

That's it for Octopress! But how do we view it? To view it, we need to compile the html and expose that to Apache _(our web server)_. To do this, run the following commands which will generate the html, then symlink our compiled directory as our main Web directory.

```
rake generate
mv ~/Web ~/Web.bkp
ln -s ~/octopress/public ~/Web
```

You will now be able to access the Octopress by following a similar URL:

```
http://KODING_USERNAME.koding.io
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

And that's it!

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
