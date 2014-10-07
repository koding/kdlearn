---
author: Team Koding
date: 2014-08-20
categories: [ruby]
---

# Getting Started with Ruby

In this guide we'll explain what Ruby is, and how to write a simple web 
server using the built in Socket library. So, lets get started!

## What is Ruby

Ruby is a popular, general purpose, high level programing language. It 
focuses on readability programmer enjoyment over raw performance. Koding 
VMs come pre-installed with Ruby and RubyGem, making it super easy to get 
started. Lets see what it looks like to run some Ruby code!

## Running your first Ruby script

Open up your [Ace Editor][ace] and create a new file named `hello.rb`.  
Paste in the following code into that file.

```ruby
puts "Hello from Ruby!"
```

The `puts` name is a function which takes a string and prints it to the 
Standard Output *(STDOUT)* of the process. Lets try running this file and 
see the output, but first save the file with **Ctrl-s**. Now, open up 
your [Terminal][terminal] and type in the following command.

```
ruby hello.rb
```

You should see output similar to this:

```
joshmurray: ~ $ ruby hello.rb
Hello from Ruby!
joshmurray: ~ $
```

Neat! Now that we know how to run some code, lets look at a real example 
of some Ruby code.

## Your first Ruby web server

Just like before, create a new file named `web.rb`, and paste in the 
following code.

```ruby
require 'socket'

server = TCPServer.new '0.0.0.0', 3000

loop do
  socket  = server.accept
  request = socket.gets
  puts request

  response = "Hello World!\n"
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"
  socket.print "\r\n"

  socket.print response
  socket.close
end
```

That looks a bit complicated, so lets break it down piece by piece.

```ruby
require 'socket'
server = TCPServer.new '0.0.0.0', 3000
```

First, we use `require` to import the `socket` module. `TCPServer` comes 
from this module, and we use it to create a new Socket server on 
`0.0.0.0:3000`. This is a **plain** socket server, meaning that we're 
going to implement an HTTP response ourselves. Getting our hands dirty!

```ruby
loop do
  socket  = server.accept
  puts socket.gets
```

Next up, `loop do` creates a never ending loop. Each iteration of the 
loop executes until `server.accept`. This blocks, waiting for connections 
from our TCP Server.

When your browser connects to the TCP Server, the socket servers returns 
a connection object named `socket`. From that object, we use `gets` to 
read a line from the incoming data Stream.

The incoming stream is what your browser sent to the TCP Server as part 
of it's request. So with `socket.gets` you're simply reading what your 
browser sent. We then take that, and use `puts` to print it to the STDOUT 
just like in our Hello example above. Note that we're just printing to 
STDOUT to help us understand when requests are incoming, it is not 
required.

```ruby
  response = "Hello World!\n"
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"
  socket.print "\r\n"
```

Next up, we start building our response. We start by writing `"Hello 
World!\n"` to the variable `response`. We then print a series of strings 
to the socket.

This section can get a little confusing, because it involves returning 
*HTTP Headers* to the requesting browser. We won't go into detail of this 
here, but just understand that this is part of the HTTP Spec, that we're 
manually implementing.

As part of these headers, we print the `Content-Length`, which is the 
number of bytes in our `response` string. After all the headers are done, 
we follow up by adding one more new line, to separate the headers from 
the content we want to print. Again, as part of the HTTP Spec.

```ruby
  socket.print response
  socket.close
end
```

Finally, we use that same `socket.print` method to print our `response` 
variable. After that's done, we close the socket.

But does this work? Open up your [Terminal][terminal] just like before, 
and run it with the following command.

```
ruby web.rb
```

Once that's running, open up your browser and connect to the following 
address, replacing `username` with your Koding Username.

```
http://hostname.username.koding.io
```

Congratulations, you're running a Ruby Web server, with a hand made HTTP 
implementation!

## Installing dependencies with RubyGem

This is great and all, but it's quite the complex way to run a simple web 
server. Lets make this a lot easier with the popular web framework, 
[Sinatra][sinatra].

To use Sinatra, we need to install it. Run the following command to 
install Sinatra with RubyGems.

```
sudo gem install sinatra
```

RubyGems is Ruby's answer to Dependency Management. Similar to NPM and 
PIP, the above command will install Sinatra and all dependencies of that 
library.

Next up, open your `web.rb` file again, and replace the entire contents 
with the following code.

```ruby
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 3000

get '/' do
  "Hello World, from Sinatra!"
end
```

Be sure that this may not work on Koding so you may need to add this line ``` require 'rubygems' ``` to the top of the current code.

Now run it just like before, and visit it in your browser. Just like 
that, you have a working Sinatra web server!

In a following tutorial we'll dig deeper into Sinatra, but for now check 
out the [Official Documentation][sinatra]. And as always, Happy Koding!


[koding]: https://koding.com
[ace]: https://koding.com/Ace
[terminal]: https://koding.com/Terminal
[sinatra]: http://www.sinatrarb.com
