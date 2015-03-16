---
title: Getting started with the Koding Package Manager
author: Team Koding
date: 2014-11-17
categories: [koding]
template: page.toffee
---

# What is Koding Package Manager?

Koding Package Manager (kpm) is a command line tool that we have set up to make it easy for you to install (and soon remove) your favorite packages like WordPress, Mongodb, Laravel, etc. KPM takes care of measuring disk space requirements, analyzing dependencies and installing all required packages to bring you a running system. It's the easiest way to get up and running with your favorite technology or package. KPM also replaces the older generation KDApps (most of which were installers).

# Getting started with the Koding Package Manager

This guide will cover the basics of the KPM and how to get started with it.

## Usage

KPM runs in the Terminal of your Koding account. In order to use KPM you first need to install it. KPM comes pre-installed on Koding VMs and you can easily verify that it is installed by typing in `kpm` in Terminal. If installed, you should see:
```
Usage:
    kpm install <name>
    kpm list
    kpm search <name>
    kpm uninstall <name>
    kpm -h | --help
    kpm --version
```
If you get an error, you can easily install KPM by using the following command in Terminal:
```text
curl -sSL learn.koding.com/kpm.sh | sh
```

After the process is complete you should have access to the `kpm` command in your Terminal.

The basic syntax for `kpm` is as follows. You have access to the following commands:

```
kpm install <name>
kpm list
kpm search <name>
kpm uninstall <name>
kpm update
kpm -h | --help
kpm --version
```

1. The first command `kpm install` will install a program or a framework from the list of available programs or frameworks.
2. The second command `kpm list` will list all available installers that you can currently install on your VM. We keep adding to the list and if you wish, you can contribute as well!
3. The third command `kpm -h` or  `kpm  --help` will show the help for this command. The help command will showcase the syntax and a short version of this guide.
4. The last command `kpm --version` will showcase the current version of your local Koding Package Manager.

You also have available an argument for the `kpm install` command. 

In order to install a framework or program you need to provide the above command with an argument that represents the name of the program / framework that you want to install. For eg.

```
kpm install <name>
```

## Available packages

Bellow is a list of the current available packages that can be installed using the `kpm` command.

1. [Codeigniter](http://learn.koding.com/guides/codeigniter-for-beginners/)
2. [Composer](http://learn.koding.com/guides/installing-composer)
3. [Django](http://learn.koding.com/guides/setting-framework-webserver/#django)
4. [Dropbox](http://learn.koding.com/guides/dropbox-for-file-sync/)
5. [FTP](http://learn.koding.com/guides/setting-up-ftp-on-koding)
6. [GruntJS](http://learn.koding.com/guides/installing-gruntjs)
7. [Laravel](http://learn.koding.com/guides/setting-framework-webserver/#laravel-4-and-artisan)
8. [MEAN](#)
9. [MEAN.io stack](http://learn.koding.com/guides/installing-mean-io/)
10. [Memcached](http://learn.koding.com/guides/install-memcache/)
11. [MeteorJS](http://learn.koding.com/guides/setting-framework-webserver/#meteorjs)
12. [MongoDB](http://learn.koding.com/guides/install-mongodb/)
13. [mySQL](http://learn.koding.com/guides/installing-mysql)
14. [nginx](http://learn.koding.com/guides/nginx)
15. [noVNC](#)
16. [phpMyAdmin](http://learn.koding.com/guides/install-phpmyadmin)
17. [PIP](http://learn.koding.com/guides/getting-started-python/)
18. [Rails](http://learn.koding.com/guides/setting-framework-webserver/#rails)
19. [Redis](http://learn.koding.com/guides/install-redis/)
20. [Apache Tomcat](http://learn.koding.com/guides/apache-tomcat-on-koding)
21. [Ungit](http://learn.koding.com/guides/using-github)
22. [VNC](#)
23. [WordPress](http://learn.koding.com/guides/installing-wordpress)

The above list will be updated periodically to include more packages, that you can use on your VM.

KPM is fully extensible so if you want to contribute, you can fork the project on Github and add your own installers for the Koding community!

If we are missing any packages and frameworks that you would like KPM to be able to handle, please let us know via email at support@koding.com.
