---
author: Team Koding
date: 2014-08-02
categories: [nodejs, javascript]
---


# Getting Started with ExpressJS

In this guide we will go over basic usage of the NodeJS web framework, 
ExpressJS. If you are not familiar with NodeJS, please review the 
[Getting Started with NodeJS][gettingstartednode] guide. Lets get 
started!

## Installing

First, make a directory to follow along with this tutorial, and work from 
in that directory. Next, we're going to install Express with the 
following command.

```
npm install express
```

If you already have a `package.json` file for your project, you can add 
the `--save` flag and Express will be added as a project dependency. In 
this example we're going to ignore dependencies for simplicity.

You'll notice a new directory is created named `node_modules`. This is 
where the local installations of your packages are stored. When you 
import them, such as with `require('express')`, they are loaded from this 
directory.

## Hello World and Routes

Copy the following code into a file named `app.js`. Remember that at 
anytime you can run your server with `node app.js`.

```javascript
var express = require('express');
var app     = express();

app.get('/', function(req, res){
  res.send('Hello World, From /');
});
app.get('/:name', function(req, res){
  res.send('Hello '+ req.params.name);
});

var server = app.listen(3000, '0.0.0.0', function() {
  console.log('Listening on port %d', server.address().port);
});
```

Lets go over each section real quick.

```javascript
app.get('/', function(req, res){
  res.send('Hello World, From /');
});
app.get('/:name', function(req, res){
  res.send('Hello '+ req.params.name);
});
```

The `app.get()` method takes a Route *(string or regex)* to listen to 
requests on. If a user visits `http://username.kd.io/`, they are greeted 
with `Hello World, From /`.

If someone visits `http://username.kd.io/john`, they are greeted with 
`Hello john`. `:name` is a URL *parameter*, which is sort of like a 
wildcard for that section of the URL. Respond to the request with the 
parameter by using the name of the parameter on the `req.params` object.

```javascript
var server = app.listen(3000, '0.0.0.0', function() {
  console.log('Listening on port %d', server.address().port);
});
```

This final call simply starts the web server on `0.0.0.0:3000`.


## Middleware

We saw how to run a simple server, with a couple routes, now lets add a 
bit of middleware.

Middleware is a concept of a function which is called in the *middle* of 
the request cycle. It's useful for rejecting non-authorized users to many 
routes, logging, or just about anything. Middleware is pretty awesome.

Lets add our own middleware to simply log all requests to the console, 
and another to log all `/:name` requests from above.

```javascript
app.use(function(req, res, next) {
  console.log('['+ new Date() +'] ', req.path);
  next();
});

var logName = function(req, res, next) {
  console.log('Request to '+ req.params.name);
  next();
}
```

We've defined two middleware functions above. Our logging function is 
first, and we immediately pass it to `app.use()`. Every request that this 
express application receives will first go through this logging function.  
The logging function just logs the date time, and the path of the 
request. Note the `next()` callback, that tells Express that this 
middleware is done, and the next one can be called.

Our second middleware, `logName`, is not being used yet. Why? Well, we 
only want to use this for our `/:name` route, because it's supposed to 
log names. How can we achieve this though? Lets take a look at our 
`/:name` route, with the middleware added.

```javascript
app.get('/:name', logName, function(req, res){
  res.send('Hello '+ req.params.name);
});
```

By adding this middleware to our route, every request to `/:name` will 
first pass through our `logName` function, and then the final anonymous 
function to handle the full response.

Lets look at the full code at this state.

```javascript
var express = require('express');
var app     = express();

app.use(function(req, res, next) {
  console.log('['+ new Date() +'] ', req.path);
  next();
});

var logName = function(req, res, next) {
  console.log('Request to '+ req.params.name);
  next();
}

app.get('/', function(req, res){
  res.send('Hello World, From /');
});
app.get('/:name', logName, function(req, res){
  res.send('Hello '+ req.params.name);
});

var server = app.listen(3000, '0.0.0.0', function() {
  console.log('Listening on port %d', server.address().port);
});
```

**Note:** It's important to remember that order of execution matters! If 
we define a piece of middleware *after* a route, requests to that route 
will not run through that middleware. In the above example, the very 
first thing we do is declare our `app.use()` middleware, and in the 
`/:name` middleware we use the `logName` function *before* our handler.

## Adding Templates

Now we're getting a hang of routes and middleware, lets complete the step 
and add in a template. Add the following code to the top of your `app.js` 
file.

```javascript
app.set('view engine', 'jade');
app.set('views', __dirname + '/views');
```

`app.set()` is used to configure this app instance. In this case, we set 
a couple templating settings of Express, to use the Jade templating 
language from the `./views` directory.

Next, create a directory named `views`, and add the following code to a 
file named `index.jade`

```jade
doctype
html
  head
    title Hello #{name}
  body
    h1 Hello #{name}
```

We won't go over the Jade language here, but in short `#{name}` is a 
variable which is being passed to this template when we render it. If 
you're paying attention, you'll notice that we have yet to actually 
render a template in our requests. Lets add the above template to our 
`/:name` handler!

```javascript
app.get('/:name', logName, function(req, res){
  res.render('index', {name: req.params.name});
});
```

In our `/:name` handler, we've replaced the `res.send()` call with 
`res.render()`. This loads our `index.jade` template and renders it, with 
the object we're passing in as data. The `name` property of that object 
is accessible from the jade template!


## The final product

Lets take one final look at all of this `app.js` code together.

```javascript
var express = require('express');
var app     = express();

// Set our view engine to Jade, and the view directory
app.set('view engine', 'jade');
app.set('views', __dirname + '/views');

// Enable our custom Logging middleware
app.use(function(req, res, next) {
  console.log('['+ new Date() +'] ', req.path);
  next();
});

// Our logName middleware, which can be used in any route we want.
var logName = function(req, res, next) {
  console.log('Request to '+ req.params.name);
  next();
}

// Our two routes and handlers
app.get('/', function(req, res){
  res.send('Hello World, From /');
});
app.get('/:name', logName, function(req, res){
  res.render('index', {name: req.params.name});
});

// Finally, start our web server.
var server = app.listen(3000, '0.0.0.0', function() {
  console.log('Listening on port %d', server.address().port);
});
```

Run the above code with `node app.js`, and visit

```
http://username.kd.io/Josh
```

And you'll see an html page, rendered from your awesome new Express app!

And that's it! We've gone through what express is, how to set it up, 
routes, middleware, and finally templates. Thanks for reading!

[gettingstartednode]: getting-started-nodejs
