---
title: Real World KDApp
author: Team Koding
date: 2014-04-24
categories: [koding, coffeescript, javascript]

series: creating-kdapps
series-index: 4
template: series.toffee
---

# Real World KDApp

In our previous example, we took some shortcuts to simplify the application. As 
a result of these shortcuts, our application would be unable to be deployed.  

So, in an effort to actually have our application be useful, lets roll up our 
sleeves and make a deployable application!

## Create it on DevTools

Rather than copy code from this tutorial and paste it into DevTools, we're 
going to simply have it create one for us.

So, open up [DevTools][devtools] and press the **Create New** button in the 
center of the app.

![create new](create-new.png)

If you already have a file open, you'll have to go to the DevTools menu in the 
upper right and choose **Create a new App**.

Choose whatever name for your app you like, and press Create. In this tutorial, 
the app is named "Example".

## Examine our new App

If we look into our newly created `~/Applications/Example.kdapp` folder, we can 
see that DevTools created a handful of files. Two of which are quite familiar, 
`index.coffee` and `manifest.json`.

We're going to ignore the Manifest file for the moment, but we'll cover that 
soon. Lets take a look at our friendly `index.coffee` file.

```coffee
class ExampleMainView extends KDView

  constructor:(options = {}, data)->
    options.cssClass = 'example main-view'
    super options, data

  viewAppended:->
    @addSubView new KDView
      partial  : "Welcome to Example app!"
      cssClass : "welcome-view"

class ExampleController extends AppController

  constructor:(options = {}, data)->
    options.view    = new ExampleMainView
    options.appInfo =
      name : "Example"
      type : "application"

    super options, data

do ->

  # In live mode you can add your App view to window's appView
  if appView?

    view = new ExampleMainView
    appView.addSubView view

  else

    KD.registerAppClass ExampleController,
      name     : "Example"
      routes   :
        "/:name?/Example" : null
        "/:name?/yourusername/Apps/Example" : null
      dockPath : "/yourusername/Apps/Example"
      behavior : "application"
```

Whoa! This one is quite a bit longer, but we can still see some familiar spots.  
Lets break it down, piece by piece.

### ExampleMainView

First up, our friendly neighborhood `ExampleMainView`.

```coffee
class ExampleMainView extends KDView

  constructor:(options = {}, data)->
    options.cssClass = 'example main-view'
    super options, data

  viewAppended:->
    @addSubView new KDView
      partial  : "Welcome to Example app!"
      cssClass : "welcome-view"
```

Just like our `HelloWorld` view from the last tutorial, this is a Koding View.  
However, unlike our `HelloWorld` this view extends `KDView` directly.

This means that it does not have a `JView.prototype.pistachio` method, and to 
actually render views to the DOM we need to do it another way, via the 
`KDView.prototype.viewAppended` method.

When our View is added to another view, such as `appView`, our `viewAppended()` 
method is called. This event is a good place to add our views with the 
`KDView.prototype.addSubView` method.

The KDView itself will be rendered to a generic `div` element, with the partial 
*(contents)* of `"Welcome to Example app!"`, and a cssClass of `welcome-view`.

### ExampleController

```coffee
class ExampleController extends AppController

  constructor:(options = {}, data)->
    options.view    = new ExampleMainView
    options.appInfo =
      name : "Example"
      type : "application"

    super options, data
```

`AppController` is a recent addition to the KDFramework. It is used to register 
your App with Koding itself; Provided along with routes, names, and filepath 
information about your app.

### appView and KD.registerAppClass

```coffee
if appView?

  view = new ExampleMainView
  appView.addSubView view

else

  KD.registerAppClass ExampleController,
    name     : "Example"
    routes   :
      "/:name?/Example" : null
      "/:name?/yourusername/Apps/Example" : null
    dockPath : "/yourusername/Apps/Example"
    behavior : "application"
```

Here is where we actually *use* our `ExampleController`. We do so only if 
`appView` does not exist. If `appView` exists, we are already registered or the 
instance has already been created and loaded.

If it does not exist, we need to pass our ExampleController into the 
`kd.registerAppClass` function. 

The two main options given in this example are as follows:

- `name`: The displayed name for this application.
- `routes`: The routes that this application can be loaded from. In our 
  example, <https://koding.com/yourusername/Example> and 
<https://koding.com/yourusername/Apps/Example>.

Note that most applications won't need to modify routes their AppControllers.  
However, if more details are desired you can check out the [source][kdf] and 
soon the API Documentation will be posted.



## Publishing for Testing

All of that is well and good, but we came here for a Real World App, right? We 
need this to run *outside* of DevTools.

If you click the menu in the upper right of DevTools, you'll see two options.  
**Publish for Testing** and **Publish to AppStore**. Choose Publish for Testing 
for now.

You'll be presented with an AppStore link for your App, which looks like this:

![private app](private-app.png)

This added your Application to the AppStore in **Private Mode**. Only you can 
run this app. But if you click Run, you'll see that your app does indeed run!

![testing app](testing-app.png)

As you can see above, it loads into your App Bar, you'll get a real URL for it, 
and it is indeed a *Real* Koding App. This lets you test your app as if it was 
officially published, and use it under real conditions.


## Publishing to the AppStore

Testing is all well and good, but eventually you'll want to publish it right?  
Well if you go back to DevTools and choose the **Publish to AppStore** option 
your App will be published to the AppStore, but not yet publicly visible.

Your App will be awaiting approval from Koding Moderators. Once we look at it 
and ensure that your App works properly, we'll approve it! Then, all Koding 
users will be able to load your awesome application and enjoy all the hard work 
you put in.


## Where to go from here

You should now have a good understanding of what Koding Applications are, and 
what the creation, testing, and publishing process is like. Next, you'll want 
to add awesome functionality and gain a deep understanding of the Koding 
Framework, right?

To do this, proceed to the API Documentation*(coming soon)* and the 
[KDFramework Source][kdf]. These will cover all of the available Classes, large 
and small, of the Koding Framework.

Thanks for reading, and stay tuned for additions to this guide, going in more 
depth.


[kdf]: https://github.com/koding/kd
[kdfio]: http://www.kd.io
[devtools]: https://koding.com/DevTools
