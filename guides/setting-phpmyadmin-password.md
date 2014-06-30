---
title: Setting phpMyAdmin password
author: Joenel de Asis
username: skyrets
date: 2014-06-30
categories: [phpmyadmin, mysql]
---

# Setting phpMyAdmin Password

This guide will help the first time users about setting the `root` password of phpMyAdmin on your Koding Virtual Machine.


## What is phpMyAdmin

[phpMyAdmin](www.phpmyadmin.net) is a free and open source tool written in PHP 
intended to handle the administration of MySQL with the use of a web browser. 
It can perform various tasks such as creating, modifying or deleting databases, 
tables, fields or rows; executing SQL statements; or managing users and 
permissions.

## Instructions

By default phpMyAdmin is already installed in your Koding VM.

First we need to set a password to our `root` user in mysql. Open your [Koding 
Terminal](https://koding.com/Terminal) and type the following then hit enter.

```
sudo mysqladmin -u root password YOURPASSWORD
```

You might be prompted for a password. Use your Koding account password and hit enter. This will set your mysql `root` password with your desired password and will be used to login in phpmyadmin.

You can now login using `root` with the password you've set a while ago, you can access phpMyAdmin by visiting

```
http://USERNAME.kd.io/phpmyadmin/
```

Remember change the `USERNAME` with you Koding account username. That's all 
folks!
