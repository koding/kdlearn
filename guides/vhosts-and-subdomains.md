---
title: Koding Subdomains and VHosts
author: Koding Community
date: 2013-11-30
categories: [koding, apache]

template: page.toffee
---

# Koding Subdomains and VHosts

In this frequently asked question we'll go over setting up a Koding subdomain to point to a directory of your choice. 

## Creating Subdomains

Subdomains can be created from Your Environments, by clicking on the Domains Plus button. For further help see the [Domain Management Guide](/docs/guides/domain-management/). 

## Creating a VHost

  1. First, run the command `sudo touch /etc/apache2/sites-available/mysubdomain` where `mysubdomain` is the name of your subdomain.
  2. Next, open the above file with `nano`, `vim`, or whatever command line editor you prefer. We're using a command line editor, because files located in `/etc/apache2/sites-available` are owned by `root`, and require sudo. As an example, the command you might be running is: `sudo nano /etc/apache2/sites-available/mysubdomain`
  3. Now that you have the file open with your preferred editor, paste in the following code: 
    
        <Virtualhost *:80>
    ServerName mysubdomain.username.kd.io
    DocumentRoot /var/www/myDirectory
    </Virtualhost>
    

There are a two things you're going to have to change here, so lets go over them.
  * **ServerName**: The value of `ServerName` should be your full subdomain url, without the http. For example: `ServerName hello.leeolayvar.kd.io`
  * **DocumentRoot**: This is the folder location that you want the subdomain to direct to. Remember that `/var/www` equals `~/Web`, so in the given example, `/var/www/myDirectory` equals `~/Web/myDirectory`. _Note:_ The DocumentRoot has to be an absolute path. Relative directories such as `/var/www/../foo` and `~/MyDirectory` will not work. If you would like to supply an directory _outside_ of `~/Web`, use your full home path, eg: `/home/leeolayvar/myNotWebDirectory`
  1. Lastly, we need to add our "site" and reload apache. Run the following two commands: 
    1. `sudo a2ensite mysubdomain`
    2. `sudo service apache2 reload`
Where `mysubdomain` is the name of the file you created before.

## Confirming

To confirm you did all the steps completely, connect to `http://mysubdomain.username.kd.io` and you should see whatever you have in your directory of choice. 

## Troubleshooting

### Koding 404

If you load your subdomain and you encounter a Koding page that says **"404 - mysubdomain.username.kd.io does not exist."** then your domain is not linked properly to your VM. See [Domain Management](/docs/guides/domain-management/) for help with that. 

### Apache 404

If you see a plain white page saying **"Not Found"** with mentions of Apache and Ubuntu, then Apache is correctly loading a directory, but the directory is empty. Confirm that your `DocumentRoot` is a correct, and **absolute** directory.
