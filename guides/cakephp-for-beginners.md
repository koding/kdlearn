---
title: CakePHP Installation for Beginners
template: page.toffee
---

# CakePHP Installation for Beginners

In this article we will installing CakePHP for beginners. Follow along, or try the [Try the Koding Demo](https://koding.com/Develop/Teamwork?import=http://tinyurl.com/my7fkyz) right now! 

## What is CakePHP?

[CakePHP](http://cakephp.org/) is a popular PHP framework created with ease of use, small codebase, and MVC in mind. It's also being actively developed, with two point releases in the last month alone. With a solid codebase, a supportive community, and active developers, it is a strong choice for any project. 

## CakePHP and Koding

Of course, CakePHP is especially easy on [Koding](https://koding.com). Developing locally means you need to already have a php framework up and running, as well as a database (MySQL for example). This becomes even more troublesome if you want to share your work with coworkers or friends. Exposing your ports to the outside world, finding your ip, and then sharing it. Thankfully on Koding this is a one step process. You already have the entire LAMP stack available to you, all from your browser. Likewise, sharing with your friends is as easy as sharing your Koding Domain. So, lets use [Koding](https://koding.com), shall we? 

## Installing CakePHP Steps

1.) On the homepage of CakePHP, copy the download link for the latest version of CakePHP. In this case we're going to be using [CakePHP 2.4.2](https://github.com/cakephp/cakephp/zipball/2.4.2). 2.) Open your [Koding Terminal](https://koding.com/Develop/Terminal) and type in `wget -O cake.zip ` and then paste your download link with Ctrl-Shift-V. As an example, it should look like this: `wget -O cake.zip https://github.com/cakephp/cakephp/zipball/2.4.2` 3.) On the left hand side, in the Koding FileTree, right click your file and choose Extract. This will extract your downloaded Cakezip into the directory `cake/`. Expand that directory, and you'll see a directory with a name similar to `cakephp-cakephp-f53efef`. 4.) Drag that into your `Web/` directory. You can rename this directory to "cake", or whatever you like, as this will make it easier to type in your browser. 5.) Finally lets ensure that we have Apache's mod_rewrite enabled. Run `sudo a2enmod rewrite && sudo service apache2 restart` just to be safe. If you already have mod_rewrite enabled, you can skip this step. 6.) The last step is a security step enforced by CakePHP. Open up `app/Config/core.php` and look for the following two lines. Edit the `DYhG93b0qyJfIxfs2guVoUubWwvniR2G0FgaC9mi` and `76859309657453542496749683645` strings to have randomized content for your deploy. Just remember that the second string is numbers only. [code]/** * A random string used in security hashing methods. */ Configure::write('Security.salt', 'DYhG93b0qyJfIxfs2guVoUubWwvniR2G0FgaC9mi'); /** * A random numeric string (digits only) used to encrypt/decrypt strings. */ Configure::write('Security.cipherSeed', '76859309657453542496749683645');[/code] 7.) That's it! Now just open up http://username.kd.io/cake in your browser, making sure to use your own username in the username url, and you'll see Cake up and running! 

## Can i skip some steps?

Of course! Simply [Try the Koding Demo](https://koding.com/Develop/Teamwork?import=http://tinyurl.com/my7fkyz) and you'll have CakePHP downloaded and open in seconds. Then just follow along with the editing steps. Awesome! 

## All in the browser

Thanks to [Koding](https://koding.com), our only requirement to get cake downloaded and running, in the browser. No special OS installation steps, no need to set up your own LAMP stack, no _localhost hassle_. This has been a beginner guide for CakePHP from [Koding]("https://koding.com) and we have more tutorials and guides on the way soon. Stay tuned!
