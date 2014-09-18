---
title: Drupal Setup and Installation for Beginners
author: Thien
date: 2014-07-15
categories: [drupal, php]
---

# Drupal Setup and Installation for Beginners

This article will cover the basic steps on how to setup a blog using Drupal. Also you can install Drupal via Koding App [here](http://learn.koding.com/guides/drupal-kdapp/).

## What's Drupal?

Drupal is a content management system (also refered to as CMS), meaning Drupal is used to manage content on informational sites, social media sites, member sites, intranets and web applications.

But how do you set up Drupal on [Koding](https://koding.com)? Well it's simple, you just follow the simple tutorial below step by step. After you've finished with the tutorial you'll have a brand new website that runs Drupal.

## Step-by-step Drupal

### Step 1.

Open up your [Koding](https://koding.com) Terminal and type in the following command to get started.

	cd Web

### Step 2.

Next up, you must download Drupal version that you're planing on using, in this case we are going to use [Drupal 8](https://www.drupal.org/node/572834)

	wget http://ftp.drupal.org/files/projects/drupal-8.x-dev.tar.gz

### Step 3.

Extracting Drupal, type the following command (replacing "x.x" with your downloaded version's number):

	tar zxvf drupal-8.x-dev.tar.gz  && rm -rf drupal-8.x-dev.tar.gz

### Step 4.

Moving Drupal to its intended location

### Step 5

In order to Drupal working on Nginx, open up the default virtual host(block) file.

	sudo vi /etc/nginx/sites-available/default

The configuration should include the changes below (the details of the changes are under the config information):

```
	server {
	 
	    listen   80;
	    server_name duythien.kd.io;
	 
	    index index.php index.html index.htm;
	    set $root_path '/home/duythien/Web/drupal-8.x-dev';
	    root $root_path;
	 
	    gzip_static on;

	    location = /favicon.ico {
	            log_not_found off;
	            access_log off;
	    }

	    location = /robots.txt {
	            allow all;
	            log_not_found off;
	            access_log off;
	    }

	    # Very rarely should these ever be accessed outside of your lan
	    location ~* \.(txt|log)$ {
	            allow 192.168.0.0/16;
	            deny all;
	    }
	    location ~ \..*/.*\.php$ {
	            return 403;
	    }

	    # No no for private
	    location ~ ^/sites/.*/private/ {
	            return 403;
	    }

	    # Block access to "hidden" files and directories whose names begin with a
	    # period. This includes directories used by version control systems such
	    # as Subversion or Git to store control files.
	    location ~ (^|/)\. {
	            return 403;
	    }

	    location / {
	            # This is cool because no php is touched for static content
	            try_files $uri @rewrite;
	    }
	    location @rewrite {
	        # You have 2 options here
	        # For D7 and above:
	        # Clean URLs are handled in drupal_environment_initialize().
	        rewrite ^ /index.php;
	        # For Drupal 6 and bwlow:
	        # Some modules enforce no slash (/) at the end of the URL
	        # Else this rewrite block wouldn't be needed (GlobalRedirect)
	        #rewrite ^/(.*)$ /index.php?q=$1;
	    }
	    location ~ \.php$ {
	        try_files $uri =404;
	        fastcgi_split_path_info ^(.+\.php)(/.+)$;
	        fastcgi_pass unix:/var/run/php5-fpm.sock;
	        fastcgi_index index.php;
	        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
	        include fastcgi_params;
	    }
	}
```

Save and Exit. If you want to run Drupal on Apache, you need to edit the Apache configuration file configuration Apache

```
sudo vi /etc/apache2/sites-available/default

```
Then you'll need to create the database for Drupal, by running the following code.

```
	echo 'CREATE DATABASE drupal8' | mysql -u root
```

If you haven't installed MySQL, head on over to [this tutorial 
here](/guides/installing-mysql). If everything goes fine, you should see 
the following screen in your browser:

![](https://dl.dropboxusercontent.com/u/109046499/wellcome.png)

If you see this error  ```Writable (public download method)```, you need to run following code in the command line.

``
 cd $ROOT/site        #/var/www/drupal-8.x-dev/sites
 sudo chmod a+w -R default 

```


That's it! You're now running Drupal on Koding! Have fun!

This has been a beginner guide from [Koding](https://koding.com/). As always, more Quick Tips and beginner friendly guides coming soon, so stay tuned!
