---
author: Team Koding
date: 2014-08-01
categories: [content management systems, ghost, nodejs]
---

# Ghost Blog Installation

In this article we will go over the installation process for the awesome 
new blogging software, [Ghost](https://ghost.org/). Installation is quick 
and easy, and just requires a few configuration edits, making this great 
for beginners. So, lets get started!


## What is Ghost?

Ghost is an awesome new blog software written with “Just Blogging” in 
mind. Think WordPress without the complexity, bringing blogging back to 
it’s roots, so to say. This is all well and good, but with any product 
that is so new there is always confusion on how to install, develop, and 
run it.

So lets try and resolve some of that confusion. Lets go over the simple 
process of setting up Ghost on [Koding](https://koding.com) so you can 
learn it, toy with it, develop with it, and create your Ghost blog to be 
exactly what you want.

## Downloading Ghost

We're going to use the [Koding Terminal][terminal] to download Ghost, so 
visit the [Ghost Download][download-page] and look for the download link.  
Copy the url.

At the time of writing this guide, the download url is: 
<https://ghost.org/zip/ghost-0.5.2.zip> *(This version is likely 
outdated, please visit the download page and get the most updated link.)*

Now, go to your [Terminal][terminal] and type in the following commands.

```
mkdir ghost
cd ghost
wget [ghost-zip-url]
```

Replace `[ghost-zip-url]` with the full URL of the zip file that you 
copied above.

## Unzipping Ghost

The download is in zip format, so we need to unzip it. Type in the 
following command.

```
unzip [ghost-zip-name]
```

## Installing Dependencies

Next, we need to install the dependencies.

```
npm install --production
```

This step will take a minute or two.

## Edit the config

Next up, open up the [Ace Editor][ace] and double click your `ghost` 
directory to expand it. Right click, and rename, the `config.example.js` 
file to `config.js`.

On line 36, look for the following section:

```javascript
        server: {
            // Host to be passed to node's `net.Server#listen()`
            host: '127.0.0.1',
            // Port to be passed to node's `net.Server#listen()`, for 
iisnode set this to `process.env.PORT`
            port: '2368'
        },
```

Replace `127.0.0.1` with `0.0.0.0`, and change the Port to whichever 
you'd like to use. Save the file with **Ctrl-s**.

## Starting Ghost

Go back to your [Terminal][terminal] and type in the following command to 
start your Ghost Blog.

```
npm start
```

> type:success
> If you had previously closed your Terminal, you'll need to navigate into the ghost directory again, with `cd ghost`.

## Visiting your Ghost Blog

Now open up a new tab and visit your Ghost Blog on your Koding domain at 
the following address.

```
http://hostname.username.koding.io:port
```

Where `username` is your Koding username, and `port` is the port you 
chose above.

If you navigate to the following address, you can signup as Admin to your 
Ghost installation.

```
http://hostname.username.koding.io:port/ghost
```

## Running Ghost on Port 80

If you'd like to run Ghost on the default Port 80, you'll have to Stop 
Apache, and start Ghost with sudo. Here are the commands to do this.

```
sudo service apache2 stop
sudo npm start
```

This should be typed from the Ghost installation directory.

And that's it! You should now have a Ghost installation up and running.  
Happy Blogging!


[ace]: https://koding.com/Ace
[terminal]: https://koding.com/Terminal
[download]: https://ghost.org/download/
