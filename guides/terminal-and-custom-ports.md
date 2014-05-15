---
title: Terminal and Custom Ports
author: Koding Community
date: 2013-11-30
template: page.toffee
---

# Terminal and Custom Ports

So far we've covered how to edit files in the Ace editor, and view them running on Apache, but what if we want to run our own web server? Web servers such as Nodejs can be run from your Web Terminal! Simply go to [Develop](https://koding.com/Develop) and click on the Terminal Icon:

![terminal_app_icon](/wp-content/uploads/terminal_app_icon.png)

  


This will open the [Terminal App](https://koding.com/Develop/Terminal). The Terminal app is a _real_ Terminal in your browser, allowing you to run anything _(Vim/Emacs/Unix Commands/etc)_ just like you would on your local environment. Lets run a few commands. You can copy the commands below, and paste them into your terminal with Ctrl-Shift-V and hit return.
    
    
    echo "var http = require('http'); http.createServer(function (req, res) { res.end('Hello from Nodejs');}).listen(3000); console.log('Now listening')" > myfile.js
    node myfile.js
    

This may look complex, but all it does is create a file called `myfile.js`, and then run it immediately. After running this, you'll have a Nodejs server running on Port `3000`. This is accessible by going to `http://yourusername.kd.io:3000`.

As you can see, the Virtual Machine coupled with KDApps such as [Ace](https://koding.com/Develop/Ace) and [Terminal](https://koding.com/Develop/Terminal) allow us to do a lot in our browser, how can we expand this functionality? Are there more than just the default few apps available? Of course! We'll cover that [Next!](/installing-and-using-kdapps/)
