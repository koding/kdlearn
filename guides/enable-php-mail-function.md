---
title: Enable PHP mail() function
author: Team Koding
date: 2014-07-12
categories: [php]

template: page.toffee
---

# Enable PHP mail() function

This short guide will cover how to enable the `mail()` function in PHP.

The first thing you need to do is to run the following command in your Koding Terminal:

```
sudo apt-get install sendmail
```

After the previous command finishes the install process, of the sendmail package, we need to configure it. You can do that by running the following command. This will configure the mail server.

```
sudo sendmailconfig
```

You need to choose Yes to every question or configure it as you see fit.

That's it! You can now use the `mail()` function in your PHP app. 

