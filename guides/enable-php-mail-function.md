---
title: Enable PHP mail() function
author: Team Koding
date: 2014-07-12
categories: [understanding vm, php]

template: page.toffee
---

# Enable PHP mail() function

This short guide will cover how to enable the `mail()` function in PHP.

The first thing you need to do is install the sendmail package. Do this by running the following command in your Koding Terminal:

```
sudo apt-get install sendmail
```

After the previous command finishes installing the sendmail package, you need to configure it. You can do that by running the following command, which will configure the mail server:

```
sudo sendmailconfig
```

You need to choose Yes to every question or otherwise configure it as you see fit.

That's it! You can now use the `mail()` function in your PHP app. 
