---
title: "EmberJS: A Starting Kit for Beginners"
author: Team Koding
date: 2014-03-02
categories: [emberjs, javascript]

template: page.toffee
---

# EmberJS: A Starting Kit for Beginners

Ambitious applications are the future. The way we interact with a web application will impact our productivity. That's why in this short tutorial we are going to cover some of the basics of [EmberJS](http://emberjs.com). If you want to skip the tutorial and get right in the action you can [try our Koding demo](https://koding.com/Develop/Teamwork?import=http://tinyurl.com/l5gnb8w). 

## EmberJS: The facts

They say that if you use EmberJS you don't have to reinvent the wheel. Well we say that they are right. EmberJS is built for developers by developers. It's friendly, fast and definitely a good alternative if you want to build something awesome. And we here at Koding like it when people build awesome stuff, therefor this tutorial is here to help you get started with one of the most on-growing and well-built frameworks out there. Right, now let's get started on how to set up EmberJS on [Koding](https://koding.com). 

## The Steps

### Step 1.

We open up a new file using your favorite code editor inside [Koding](https://koding.com), because as you may know, you have Ace pre-installed or maybe you're a Vim or Emacs individual. For the sake of this tutorial we are going to use the Ace editor. 

### Step 2.

We copy and paste the following code into are newly created file. [code] <!doctype html> <html> <head> <meta charset=utf-8 /> <title>Ember Koding Demo</title> </head> <body> <script type="text/x-handlebars" data-template-name="index"> <h2>Ember.js on Koding</h2> <ul> {{#each item in model}} <li>{{item}}</li> {{/each}} </ul> </script> <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script> <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.1.2/handlebars.min.js"></script> <script src="//cdnjs.cloudflare.com/ajax/libs/ember.js/1.1.2/ember.min.js"></script> <script> App = Ember.Application.create({}); App.IndexRoute = Ember.Route.extend({ setupController: function(controller) { controller.set('content', ['cyan', 'magenta', 'penguin', 'pie']); } }); </script> </body> </html> [/code] Ok now that we saved the file and opened up the preview and saw that everything worked as it should let's explain a bit what is actually happening. First, before everything, we need the following libraries that make our EmberJS app work: jQuery, handlebars and of course emberJS. The app uses handlebars for templating. After we set up the template and loaded the libraries we need to create the actual app. First we initialize ember and then we use a Router that helps to manage the state of the application and the resources needed as a user navigates the app. In our case set some content using the already created template that was made possible with the help of the handlebars library. And there you have it. A short tutorial on how to use EmberJS on [Koding](https://koding.com). Don't forget if you want you can try out the Koding demo by following this [link](https://koding.com/Develop/Teamwork?import=http://tinyurl.com/l5gnb8w). As always, more Quick Tips and beginner friendly guides from [Koding](https://koding.com/) coming soon, so stay tuned!
