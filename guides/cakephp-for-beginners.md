---
title: CakePHP Installation for Beginners
author: Team Koding
template: page.toffee
categories: [frameworks platforms, php, cakephp]
---

# CakePHP Installation for Beginners

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install CakePHP using just one command:

```
kpm install cakephp
```

***

If you are a beginner with CakePHP than this article will help you with the install process.

## What is CakePHP?

[CakePHP](http://cakephp.org/) is a popular PHP framework created with ease of use, small codebase, and MVC in mind. It's also being actively developed, with two point releases in the last month alone. With a solid codebase, a supportive community, and active developers, it is a strong choice for any project. 

## Installing

On the homepage of CakePHP, copy the download link for the latest version of CakePHP. In this case you're going to be using [CakePHP 2.4.2](https://github.com/cakephp/cakephp/zipball/2.4.2). 

Open your [Koding Terminal](https://koding.com/Develop/Terminal) and type:

```
cd Web
wget -O cake.zip 
``` 

and then paste your download link with Ctrl-Shift-V. As an example, it should look like this: 

```
wget -O cake.zip https://github.com/cakephp/cakephp/zipball/2.4.2
```

On the left hand side, in the Koding FileTree, right click your file and choose Extract. This will extract your downloaded `cake.zip` into a directory `cake/`.

Expand that directory, and you'll see a directory with a name similar to `cakephp-cakephp-f53efef`. 

Drag that into your `Web/` directory. You can rename this directory to "cake", or whatever you like, as this will make it easier to type in your browser. 

Finally make sure that you have Apache's mod_rewrite enabled. Follow [this guide](http://learn.koding.com/guides/general-htaccess/) to learn you can do that.

The last step is a security step enforced by CakePHP. 

Open up `app/Config/core.php` and look for the following two lines. 

Edit the `DYhG93b0qyJfIxfs2guVoUubWwvniR2G0FgaC9mi` and `76859309657453542496749683645` strings to have randomized content for your deploy. Just remember that the second string is numbers only.  

```
/** * A random string used in security hashing methods. */ 
Configure::write('Security.salt', 'DYhG93b0qyJfIxfs2guVoUubWwvniR2G0FgaC9mi');

/** * A random numeric string (digits only) used to encrypt/decrypt strings. */ 
Configure::write('Security.cipherSeed', '76859309657453542496749683645');
```

You will now be able to access CakePHP by following a similar URL:

```
http://KODING_USERNAME.koding.io/cake
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

And that's it!

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
