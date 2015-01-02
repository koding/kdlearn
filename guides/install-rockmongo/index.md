---
title: Install Rockmongo
author: Thien
date: 2015-01-2
categories: [rockmongo, mongo]
---

# How to install Rockmongo

## What is Rockmongo

Rockmongo is a MongoDB administration tool using which you can manage your server, databases, collections, documents, indexes and a lot more. It provides a very user-friendly way for reading, writing and creating documents. It is similar to PHPMyAdmin tool for PHP and MySQL. 

### Step 1.

Open up your [Koding](https://koding.com) Terminal and type in the following command to get started.
	
```
cd Web
```

### Step 2.
Next up, You must download Rockmongo verison that you're planing on using. In this case, we are going to use latest version

```
git clone --depth=1 https://github.com/iwind/rockmongo.git
```

### Step 3

Open the config.php with your convenient editor, change host, port, admins and so on to yours, note that  which is set "admin" and "admin" as default.

### Step 4

So Mongodb need PHP driver you should install it, run this command from in terminal

```
sudo pecl install mongo

```

After creating the file is */etc/php5/apache2/conf.d/20-mono.ini*, add this line of content:

```
extension=mongo.so
```

### Step 5

Restart the Apache server using the following command and you should see everything working.

```
sudo service apache2 restart
```

You will now be able to access rockmongo by following a similar URL:

```
http://KODING_USERNAME.koding.io/rockmongo
```
If everything goes fine, you should see the following screen in your browser:

![](rockmongo.png)

That's it! You're now running Rockmongo on Koding! Have fun!

This has been a beginner guide from [Koding](https://koding.com/). As always, more Quick Tips and beginner friendly guides coming soon, so stay tuned!