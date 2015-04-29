---
author: Team Koding
categories: [frameworks platforms, nodejs, javascript]
---


# Getting Started with NodeJS

In this guide we'll go over explaining what NodeJS is, what it can do, 
and how to write your first NodeJS web server on Koding. We'll be 
approaching everything from a beginners perspective. So, lets get 
started!


## What is NodeJS

NodeJS, commonly called Node, is a program which runs JavaScript code on 
a computer. This is similar to your browser, except instead of having 
access to the Document Object Model *(DOM)* and HTML5 APIs, it has access 
to a Node specific API which gives you access to the file system, and raw 
networking.

JavaScript run in Node is very similar to Python or Ruby. You have a 
command `node`, which runs some JavaScript code. This code uses the Node 
API to modify the file system, or send/receive network packets. It's 
rather low level by itself, but like all major languages people have 
built frameworks ontop of the raw API to make it easier to create 
applications.

## Installing NodeJS and NPM

By default every Koding VM comes preinstalled with NodeJS and NPM, but in case you somehow removed it you can use the following commands to get it back.

To install it use the following command:

```
sudo apt-get install nodejs
```

If the above should fail you can install NodeJS through a PPA repository like so:

```
sudo apt-get install python-software-properties  
sudo add-apt-repository ppa:chris-lea/node.js  
sudo apt-get update  
sudo apt-get install nodejs  
```

You can check the NodeJS version and if it installed correctly, after the installation process has finished, using the following command:

```
nodejs -v
```

You will also need the Node Packaged Modules or NPM. To install NPM, simply run the following command:

```
sudo apt-get install npm
```

To make sure NPM has installed successfully, run:

```
npm -v
```

## Running your first Node Script

Lets setup a single print line script, and call it. Open up your [Ace 
editor][ace], and open up a new file by pressing the Plus Button on the 
tab list. If your file says `Untitled.txt`, you're good to go.

Next, paste the following code into a new script.


```javascript
console.log('Hello from NodeJS!')
```

If you're familiar with Web Development, you'll likely notice that this 
line if code is identical to what you could use in your Browser. You can 
copy this code and run it in your Browser Console right now! This works, 
because the JavaScript running in Node is *just javascript*. No 
modifications to the language have been made. The differences come when 
we start using the Node API, which we'll see when we run our web server 
below.

Before we run a web server though, lets see the output of our script.  We 
haven't saved our file yet though, so use **Ctrl-S** to save the file, 
and name it `hello.js`. Finally, open up the [Koding Terminal][terminal] 
and run this file with the following code.

```
node hello.js
```

You should see output similar to this:

```
joshmurray: ~ $ node hello.js
Hello from NodeJS!
joshmurray: ~ $
```

Not surprisingly, it printed our `console.log()` output! Next up, lets 
get out feet wet with a little bit of the API known as the `http` 
library.

## Running your first Node Web Server

```javascript
var http = require('http');

var server = http.createServer(function(req, res) {
  res.end('Hello from NodeJS!\n');
  console.log('Someone visited our web server!');
})

server.listen(3000, '0.0.0.0');
console.log("NodeJS web server running on 0.0.0.0:3000");
```

Just like in the steps above, open a new file, paste in the above code, 
and save it as `web.js`. Lets break down this code piece by piece before 
we run it.

```javascript
var http = require('http');
```

This line is how NodeJS "Imports" modules. Each NodeJS file is considered 
a module, and can be imported by specifying the file location relative to 
the path of the current file.

Eg, `require('./foo')` would import a file named `foo.js` in the current 
directory. `require('./foo/bar')` would import a file named `bar.js` in 
the `foo` directory.

You should note that there is a difference between our relative imports, 
and the `http` import above. If you install a library with `npm`, or use 
built-in libraries like `http`, you do not need to specify the path. Node 
will look up your file path until the package is found, or return an 
error if it fails to find it. `http` is part of the Standard Library, so 
of course it is found.

After `require('http')` loads the module, we store it in a variable named 
`http`

```javascript
var server = http.createServer(function(req, res) {
```

Here, we call a function `createServer` on the `http` module. I won't go 
into too much detail of the usage of function, but in short it takes a 
function and passes in a Request and Response object to the function. For 
further reading, checkout the documentation on 
[createServer()][createServer].

This function creates a web server, stored in `server` in our example.  
Each time a request comes in to our server, our function is called with 
the `req` *(Request)* and `res` *(Response)* of the current request. We 
can get information about the request, and create a response for the 
requester.

```javascript
  res.end('Hello from NodeJS!\n');
  console.log('Someone visited our web server!');
```

In this example, we're calling `res.end()` to end the current request. We 
pass in a string, to be given to the client.

We also make a `console.log()` call, so that in our Terminal we can see 
when people request our web server.

```javascript
server.listen(3000, '0.0.0.0');
console.log("NodeJS web server running on 0.0.0.0:3000");
```

Finally, we call the `server.listen()` function. This takes a port, and 
an IP to listen on. When called, it starts the server we defined above.  
Meaning that any requests that are made to that address *(relative to the 
machine)*, `0.0.0.0:3000` calls our above function, which we then end 
with `Hello from NodeJS!`.

Lets try this out now, and run it. Just like before, with the file saved 
type `node web.js` *(remember, we named this one `web.js`)*. Once it's 
running, open up your browser and go to

```
http://hostname.username.koding.io:3000
```
Where `username` is your Koding Username.

After you visit your that address, you should see a simple web response 
with the `Hello from NodeJS!` string. If you then go back to the 
Terminal, you'll see that the server logged a visit. If you refresh your 
web page a few times, you can watch your web server respond to each 
request!

```
NodeJS web server running on 0.0.0.0:3000
Someone visited our web server!
```

This sums up the Getting Started with NodeJS guide. You should now have a 
good understanding of what Node is, from a very basic perspective. As 
always, don't forget to look at the [API Documentation][apidocs]. Have 
fun with Node!






[koding]: https://koding.com
[ace]: https://koding.com/Ace
[terminal]: https://koding.com/Terminal
[createServer]: http://nodejs.org/api/http.html#http_http_createserver_requestlistener
[apidocs]: http://nodejs.org/api
