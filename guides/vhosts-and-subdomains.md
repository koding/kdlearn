---
title: Koding Subdomains and VHosts
author: Team Koding
date: 2014-11-03
categories: [koding, apache]
---

# Koding Subdomains and VHosts

In this guide we'll go over setting up a Koding subdomain to point to a 
directory of your choice.

## Creating Subdomains

To create a subdomain, refer to the [Subdomain Section 
here](/faq/vm-hostname/)

## Creating a Virtual Host

First, run the following command, where `mysubdomain` is the name of your subdomain.

```text
sudo touch /etc/apache2/sites-available/mysubdomain.conf
```

Next, open the above file with `nano`, `vim`, or whatever command line 
editor you prefer. We're using a command line editor, because files 
located in `/etc/apache2/sites-available` are owned by `root`, and 
require sudo.

If you used nano, your command should look like this:

```text
sudo nano /etc/apache2/sites-available/mysubdomain.conf
```

Now that you have the file open with your preferred editor, paste in the 
following code:

```xml
<Virtualhost *:80>
  ServerName mysubdomain.username.koding.io
  DocumentRoot /var/www/myDirectory
</Virtualhost>
```

There are a two things you're going to have to change here, so lets go over them.

- **ServerName**: The value of `ServerName` should be your full subdomain 
  url, without the http.

- **DocumentRoot**: This is the folder location that you want the 
  subdomain to direct to. Remember that `/var/www` equals `~/Web`, so in 
the given example, `/var/www/myDirectory` equals `~/Web/myDirectory`.  

```xml
<Virtualhost *:80>
  ServerName hello.joshmurray.koding.io
  DocumentRoot /var/www/helloworld
</Virtualhost>
```

**Note:** The DocumentRoot has to be an absolute path. Relative 
directories such as `/var/www/../foo` and `~/MyDirectory` will not work.  
If you would like to supply an directory *outside* of `~/Web`, use your 
full home path, eg: `/home/joshmurray/myNotWebDirectory`

## Enable the Subdomain

Lastly, we need to add our "site" and reload apache. Run the following 
two commands, replacing `mysubdomain` with the name of your subdomain.

```text
sudo a2ensite mysubdomain
sudo service apache2 reload
```

## Confirming

To confirm you did all the steps completely, connect to 
`http://mysubdomain.username.koding.io` and you should see whatever you 
have in your directory of choice. 

## Troubleshooting

### Apache 404

If you see a plain white page saying **"Not Found"** with mentions of 
Apache and Ubuntu, then Apache is correctly loading a directory, but the 
directory is empty. Confirm that your `DocumentRoot` is a correct, and an 
**absolute** directory.
