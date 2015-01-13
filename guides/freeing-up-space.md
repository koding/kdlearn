---
title: How to free up space on a VM
author: Team Koding
date: 2015-01-13
categories: [koding]
template: page.toffee
---

# How to free up space on a VM

This tutorial will cover some basic steps that will help you clear some space on your VM.

You can use the bellow command to delete downloaded packages (.deb) already installed and that you no longer need:

`sudo apt-get clean`

To remove all stored archives in your cache for packages that can not be downloaded anymore, thus packages that are no longer in the repository or that have a newer version in the repository, use this command:

`sudo apt-get autoclean`

To remove unnecessary packages, after uninstalling an app there could be packages you don't need anymore this command will do just that.

`sudo apt-get autoremove`

Another thing that you can do to improve the space on your VM is to backup old projects and remove them completely.

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).