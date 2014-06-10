---
title: General .htaccess
author: Team Koding
date: 2014-02-02
categories: [apache]

template: page.toffee
---

# General .htaccess

Htaccess is a pretty well understood and standard feature among web hosts. Koding's .htaccess is no different than any other, so the plethora of tutorials and information out there will work perfectly fine on Koding.

With that said, there are a couple Apache mods that people often expect to be enabled, but aren't by default on Koding. This guide will cover those, and any other Koding-specific htaccess issues.

## Video

The following is an instructional video which approximately mirrors the steps below.

## General .htaccess Instructions

### RewriteEngine & mod_rewrite

For the sake of discussion, lets say I have two Koding domains `http://username.kd.io` and `http://my.name.is.username.kd.io`. How would I forward the first to the second?

Htaccess makes this pretty simple. Create a .htaccess file in your Web directory, if you don't already have one, `touch ~/Web/.htaccess && chmod 644 ~/Web/.htaccess` and add the following RewriteRule:

`RewriteEngine On RewriteCond %{HTTP_HOST} ^username.kd.io [NC] RewriteRule ^(.*) http://my.name.is.username.kd.io/$1 [R=301]`

But wait, if we go to `http://username.kd.io` now we are presented with the following error:

``\` Internal Server Error

The server encountered an internal error or misconfiguration and was unable to complete your request.

Please contact the server administrator, webmaster@localhost and inform them of the time the error occurred, and anything you might have done that may have caused the error.

More information about this error may be available in the server error log. ``\`

The reason for this is that mod_rewrite is not enabled by default. The fix for this is insanely easy, run the following command:

`sudo a2enmod rewrite && sudo service apache2 restart`

This uses the command `a2enmod` to enable mod_rewrite, and then restarts apache. Now if we go to `http://username.kd.io` we are redirected to `http://my.name.is.username.kd.io`. Yay!
