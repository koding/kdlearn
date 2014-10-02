---
author: Nik LePage
username: NikLP
date: 2014-10-02
categories: [drupal]
---

# Getting started with Drupal 8 (Prerelease)

A quick rundown of how to setup a development environment for checking out the new Drupal 8 releases. Get hacking, testing, or just trying it out!

## A preamble for Drupal developers

It occurred to me that not everyone, myself included, always has the necessary resources to set up a separate server instance just because Drupal 8 requires PHP 5.4, or you don’t have enough RAM for a VM, or blah blah blah. Having a local VM is all very well, but I personally don’t like them and prefer to just SSH into a server and “do stuff” via the terminal interface (using a combo of Screen, Vim, IRSSI and others - hat-tip to @Litwol). So when I came across this (PaaS site Koding.com) I jumped onto the task of getting D8 working on that platform. 

NB Your VM is not “always up”. Koding spin down the VM instances when they’re idle, so you can’t expect people to be able to view your projects when you’re sleeping, for example. Your files are persistent, however, so no worries there. Git is pre-installed (currently 1.8+) and there are ways to pull in your repos from GitHub et al.


## Setting up the development environment

Go ahead and open up the Koding Terminal panel. Click the link like `vm0.username.kd.io` to fire up your terminal. (We’re assuming you’re in `~/Web` for the site install bits).

We must first install Composer as we need Drush master (7) to easily install Drupal 8. You wanted Drush anyway though, right? :)

Issue the following commands to perform the install and tidy up. 

    sudo curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer`

>The last step is not required AFAIK, but makes Composer global for the machine. The instructions that I read said “Make sure Composer's global bin directory is on the system PATH (recommended)”. That’s great, although I don’t fully understand the implications. 

Issue the following commands in your shell to sort the path out.

    sed -i '1i export PATH="$HOME/.composer/vendor/bin:$PATH"' $HOME/.bashrc
    source $HOME/.bashrc`

Now we can go ahead and use Composer to install drush 7. More long winded than "the old days", but get used to it. Everything is Composer in D8. "So Compose; much baton (sic)."

    composer global require drush/drush:dev-master

Test the install with a random “drush” command in the shell... e.g.

    drush --version

As it turns out, we also need to enable `mod_rewrite`, which also requires a restart of Apache. In order to do so, you can type the following commands in the terminal (which don’t seem to require `sudo` as I retest them right now, but maybe…)

    a2enmod rewrite
    service apache2 restart

One more gotcha - D8 requires (or prefers) curl?! Well, okay.

    sudo apt-get install php5-curl

## Setting up the Drupal environment

Now we’re ready to rock! The rest of this is a pretty standard Drupal setup mission, but here's the outline anyway. Go setup yourself up a new database by entering MySql CLI (Koding mysql automatically assumes root) and issue the following commands.

    mysql (into the CLI, then...)

    CREATE DATABASE drupal8;
    GRANT ALL PRIVILEGES ON drupal8db.* TO myusername@localhost IDENTIFIED BY 'mypassword';
    FLUSH privileges;

You probably don’t want to use your root password in case you’re going to be using the included shared environments that Koding provides.

Now `cd ~/Web` and install Drupal 8. NB, You can obviously create an optional subdirectory here, but of course you will need to update the `.htaccess` to reflect this. You will need to change the relevant line to mimic: `RewriteBase /mysubdir`

Choose a version: `drush dl drupal-8` (this may give you a choice of versions)
*OR* Definitely :) get Drupal 8 Beta 1: `wget http://ftp.drupal.org/files/projects/drupal-8.0.0-beta1.tar.gz` (see: https://www.drupal.org/node/2348025 )

Unpack the tarball with `tar zxf drupal-8-whatever.tgz`

Alter the dir name if it bothers you or you need a reminder of which version you’re using.

    mv drupal-8-whatever mydrupaldir
    
(I'm assuming the latter from hereon)

Save yourself a few seconds by doing the usual copying of settings.php and set permissions malarky. 

    cd mydrupaldir
    cd sites/default
    cp default.settings.php settings.php
    chmod 0666 settings.php
    mkdir files
    chown user:www-data files (NB this is server/user specific!)
    chmod 0775 files

(Change these permissions back to something more sane afterwards… 0644 and 0775 seem to be ok, but I’m open to abuse on the matter.)

And you’re off! Get yourself a new browser tab and punch in `<username>.kd.io[/mydrupaldir]` and follow the usual Drupal installer instructions!
