---
title: AngularJS Step-by-Step Setup
author: Team Koding
date: 2014-03-09
categories: [angularjs, javascript]

template: page.toffee
---

# AngularJS Step-by-Step Setup

This article is all about AngularJS and how to get you started with it on 
[Koding](https://koding.com).

## AngularJS: What's it all about.

Everything is dynamic these days, or at least in should be. The age of the static documents is slightly fading away and people like to interact with websites and applications in real-time. Queue frameworks that offer dynamism to web apps. These frameworks offer an endless list of possibilities and give developers free reign over how people interact with their application, in real-time. One of the most popular frameworks these days, that is starting to be approached by more and more developers is AngularJS. AngularJS can be used with any application development workflow due to the fact that it's extensible and because it works well with other libraries. 

## Setting it up on Koding

Ok, but how can we develop a web application in the cloud and preview the 
result a the same time? It's easy, we use [Koding](https://koding.com)!  
[Koding's](https://koding.com) built-in preview system enables you to preview 
your progress with a single click. It's as simple as 1,2,3. So let's get 
started then. First we create a new .html file using the Ace editor app, that 
comes pre-installed with [Koding](https://koding.com), or any editor you prefer 
or have installed. The next step is to head over to the [AngularJS 
website](http://angularjs.org/) and get one of their simple examples. For this 
tutorial we're going to use the first tutorial that comes up, a simple "Hello!" 
example. We copy that and paste it into our file, the one that we created 
earlier.

```html
<!doctype html>
<html ng-app>
  <head>
  <script 
    src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.min.js">
  </script>
  </head>
  <body>
    <div>
      <label>Name:</label>
      <input type="text"
        ng-model="yourName"
        placeholder="Enter a name here">
      <hr>
      <h1>Hello {{yourName}}!</h1>
    </div>
  </body>
</html>
```

We can now save our file and check out the result, by clicking the little 
"hamburger" menu in the top right corner of Ace editor and then choose Preview.  
The example we got should display nicely. Go ahead and test to see if it 
works.  Simple and fun!

And that's it. Why not continue and experiment with AngularJS on 
[Koding](https://koding.com) and see what more cool stuff you can 
make. As always, more Quick Tips and beginner friendly guides coming 
soon, so stay tuned!
