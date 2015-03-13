---
author: Nik LePage
username: NikLP
date: 2014-10-02
categories: [drupal]
---

# Getting started with Drupal 8 (Prerelease)

A quick rundown of how to setup a development environment for checking out the new Drupal 8 releases.

## Setting up the development environment

Go ahead and open up the Koding dev UI. The terminal is available in the bottom right panel. (I'm assuming you’re in `~/Web` for the actual site install bits).

We must first install Composer as we need Drush master (7) to easily install Drupal 8. You wanted Drush anyway though, right? :)

Issue the following commands to perform the install and tidy up. 

    sudo curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer

The last step is not required AFAIK, but makes Composer global for the machine. The instructions that I read said “Make sure Composer's global bin directory is on the system PATH (recommended)”. That’s great, although I don’t fully understand the implications. 

Issue the following commands in your shell to sort the path out.

    sed -i '1i export PATH="$HOME/.composer/vendor/bin:$PATH"' $HOME/.bashrc
    source $HOME/.bashrc

Now we can go ahead and use Composer to install drush 7. More long winded than "the old days", but get used to it. Everything is Composer in D8. "So Compose; much baton (sic)."

    composer global require drush/drush:dev-master

Test the install with a random “drush” command in the shell... e.g.

    drush --version

As it turns out, we also need to enable `mod_rewrite`, although this appears to be set up by default in the new Koding. In order to do so, you can type the following command.

    sudo a2enmod rewrite

MySQL is not installed by default in the new Koding setup. We need to add MariaDB, and the necessary PHP extensions.

    # Follow the instructions at https://downloads.mariadb.org/mariadb/repositories/#mirror=coreix
    # Select "Ubuntu", "14.04", "5.5" and then a mirror, and the instructions are below
    sudo apt-get install php5-mysql php5-gd
    
One more gotcha - D8 requires (or prefers) curl?! Well, okay.

    sudo apt-get install php5-curl

Restart the web server to enable all the new goodness!

    sudo service apache2 restart

## Setting up the Drupal environment

Now we’re ready to rock! The rest of this is a pretty standard Drupal setup mission, but here's the outline anyway. Go setup yourself up a new database by entering MySql CLI (Koding mysql automatically assumes root) and issue the following commands.

    mysql -u root -p  # to get into the CLI, then...

    CREATE DATABASE drupal8db;
    GRANT ALL PRIVILEGES ON drupal8db.* TO myusername@localhost IDENTIFIED BY 'mypassword';
    FLUSH privileges;

You probably (almost certainly) don’t want to use your root password again in case you’re going to be using the included shared environments that Koding provides.

Now `cd ~/Web` and install Drupal 8. 
Choose a version: `drush dl drupal-8` (this may give you a choice of versions)
*OR* Definitely :) get Drupal 8 Beta 1: `wget http://ftp.drupal.org/files/projects/drupal-8.0.0-beta1.tar.gz` (see: https://www.drupal.org/node/2348025 )

Unpack the tarball with `tar zxf drupal-8-whatever.tgz`

Alter the dir name if it bothers you or you need a reminder of which version you’re using.

    mv drupal-8-whatever mydrupaldir
    
I'm assuming a subdirectory from here on - which means you should set the RewriteBase in .htaccess

    RewriteBase /mydrupaldir  # in .htaccess in ~/Web/mydrupaldir

Save yourself a few seconds by doing the usual copying of settings.php and set permissions malarky. 

    cd mydrupaldir
    cd sites/default
    # for developers only (sets up some dev mode settings, do this before install!)
    cp ../example.settings.local.php ./settings.local.php
    # for everyone
    cp default.settings.php settings.php
    cp default.services.yml services.yml
    chmod 0666 settings.php services.yml
    mkdir files
    sudo chown myuser:www-data files # NB this is server/user specific!
    chmod 0775 files

> type:warning
> You need to change these permissions back to something more sane afterwards… 0644 and 0775 seem to be ok, but I’m open to abuse on the matter.)

And you’re off! To open your VM in a browser, click the ellipsis next to your VM name (probably koding-vm-0) and then the VM name to open the site in a new tab, and follow the usual Drupal installer instructions! NB If you're a developer, you might want to check out Webchick's setup video from Drupalcon AMS: http://www.youtube.com/watch?v=wKdU2Q1NIZQ
