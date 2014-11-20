---
title: How to change your command shell
author: Team Koding
date: 2014-11-19
categories: [koding, shell]
---

# Changing your default command/login shell

Koding VMs, by default, come with [bash](http://www.gnu.org/software/bash/) as the default command shell. There are several alternatives
to bash [out there](http://en.wikipedia.org/wiki/Comparison_of_command_shells) (zsh, fish, csh, tcsh, etc.) and so you may wish to change 
your command shell to something other than bash. To change your default command shell, follow these easy steps:

### Set a password for your koding VM user account
Since the user account on your Koding VM's does not have a default password, you need to set one first. Do the following:
```shell
sudo passwd <your koding username>
```
Input a password at the prompt and make sure you pick something secure. Going forward, this will be the password for the user account
on your Koding VM. Note: This does not change your Koding.com password. That remain the same.

Now type in:
```shell
chsh -s <path to the shell you wish to use as your default shell e.g. /bin/fish/>
```

That's it. Next time you open a new Terminal, it should be running the new command shell.

