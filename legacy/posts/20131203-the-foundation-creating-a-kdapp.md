title: The Foundation: Creating a KDApp
link: http://learn.koding.com/the-foundation-creating-a-kdapp/
author: lee
description: 
post_id: 411
created: 2013/12/03 00:00:35
created_gmt: 2013/12/03 00:00:35
comment_status: closed
post_name: the-foundation-creating-a-kdapp
status: publish
post_type: post

# The Foundation: Creating a KDApp

This guide will go over the foundation of what Koding Apps are, from a programming perspective. By the end of this, you should know how to create a basic hello world app. We will not explain the KDFramework in this series step.

If you're looking for a more general example check out the [Koding Apps Overview](/).

## Video

## What are Koding apps

Koding apps are essentially WebApps for your VM. More precisely, when you open a Koding App a single JavaScript file is ran on your browser. It uses the KDFramework to then add content to your Koding session, as well as communicate to your VM to install/save/edit/delete/etc.

## File structure

When you refresh the app list what is actually happening is Koding is looking for folders located in `~/Applications` with a `manifest.json` file. This json file contains all of the information about an application, and Koding uses that to load the app name, version, thumbnails, etc.

Along with this manifest file there will be an `index.js` file which is the JavaScript file we mentioned earlier. This file is actually a compiled file, generated from the source CoffeeScript files.

## Creating a Hello World application

As we've seen, there are two required files that need to be created for an app to exist. Lets create a very stripped down version of these files.

First, create a directory located at `~/Applications/hello.kdapp`, and navigate there.

### Manifest File

Next, copy the contents of the following code block, and place them in a file called `manifest.json`.

`{ "name": "Hello World", "devMode": true, "path": "~/Applications/hello.kdapp", "source": { "blocks": { "app": { "files": [ "./index.coffee" ] } } } }`

This is a stripped down manifest file. Mature apps have many additional flags, and before you publish you will want to include more, but this is about as small as we could get.

You can place any number of source files into the `files` array, and each coffee file will be compiled and concatenated to the `index.js` file, _in the same order_ that you define in your files array. It's important to understand the order of this compilation, as variables must be defined before you actually use them.

### Source Code

Next, create a file called `index.coffee` in your app directory, and copy the following source code into it.

``` class HelloWorld extends JView constructor: -> super @hello = new KDHeaderView title: 'Hello World!' type: 'big'

pistachio: -> """ {{>@hello}}

Hello from our Hello App! 
    
    
    """
    

do -> appView.addSubView new HelloWorld() ```

Lets break down the above source. Remember, we are not trying to explain the framework too much, just enough to make sense of the above code.

#### HelloWorld and Views

Views are Kodings way of programatically representing the DOM. Allowing you to define elements and modify them all from your code. In the above code, `KDHeaderView` will be literally compiled to `<h1>Hello World!</h1>`. You can modify these views by adding css, changing their content, adding subviews, or even removing them entirely at a later time.

The HelloWorld class will be what we tell Koding is our extension of a Koding View. You can see that it extends `JView`, which is a Koding View.

#### JView and Pistachio

As we mentioned, `JView` is a Koding View. It extends `KDView`, adding Pistachio functionality. [Pistachio](https://github.com/phidelta/pistachio) is a templating language which is similar to Handlebars, and you can readup on it if you like.

The important thing to note here, is that `JView` and Pistachio _are entirely optional_. I included them here to show multiple ways of adding content to Koding Views. I could have included the `KDHeaderView` directly and not used `JView` at all.

#### Do and appView

The `do` usage here is a bit irrelevant, but many Coffee users forget what it actually _does_. `do ->` simple creates a javascript closure and executes the given function immediately.

`appView` on the otherhand, is the real hero of this whole code. We've explained that Koding uses views, and uses them everywhere, so it makes sense that we need to add our main view, to another view. That's what `appView` is.

`appView` is provided in our applications scope, and we need to add our application to it. This can be done with the method that all Views have, `KDView.prototype.addSubView()`. We use it here, to add an instance of our `HelloWorld` class to our apps container view.

### Compiling

Compiling can be done a number of ways. If you click **"Refresh Apps"**, you should see your app listed in the apps list. From there, you can hover over it and you will see little icons appear in the upper right, one of them is a compile button. Each time you make changes, click this button to recompile your app.

Another way to compile is to use `kdc` tool, in your Terminal. Simply run `kdc ~/Applications/yourapp.kdapp` and `kdc` will compile your app. It's worth noting that if you use this method, your browser's cached copy of `index.js` may need to be force cleared manually with F5.

Lastly, as a shameless plug, i offer my compiling tool as a method to compile your app during development. Check out the [AppAid Github](https://github.com/leeolayvar/appaid.kdapp) page for installation instructions. Once installed, open AppAid, and simply select your app from the list and click load. Compilation can be done automatically from there.

## Closing

You should now know what Koding Applications are made of, what they are made with, and how to make a basic Hello World application.

In the next installation, we'll take this a step further!