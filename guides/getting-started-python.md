---
author: Team Koding
date: 2014-08-04
categories: [python, flask]
---

# Getting Started with Python

In this guide we'll go over explaining what Python is, how to use Python 
Packaging via the PIP command, and how to write your first Python web 
server using a small library known as Flask. So, lets get started!

## What is Python

Python is a popular, general purpose, high level programing language. It 
focuses on readability programmer sanity over raw performance. Python2 
and Python3 come pre-installed on Koding VMs, and in this guide we're 
going to focus on Python2. Lets see what it looks like to run some python 
code!

## Running your first Python script

Open up your [Ace Editor][ace] create a new file named `hello.py`. Paste 
in the following code into that file.

```python
print "Hello from python!"
```

The `print` keyword takes a string and prints it to the Standard Output 
*(STDOUT)* of the process. Lets try running this file so we can see this 
output, but first save the file with **Ctrl-s**.  Now, open up your 
[Terminal][terminal] and type in the following command.

```
python hello.py
```

You should see output similar to this:

```
joshmurray@vm-19:~$ python hello.py
Hello from python!
joshmurray@vm-19:~$
```

Neat! Lets take this a couple steps further, and do something actually 
useful, lets run a web server! But first, lets get to know Pip, and 
install a library that makes making python Web Applications easy!

## Installing Pip

`pip` is a popular Python Package Manager. However, we need to install it 
onto our Koding VM to use it. To do that, we're going to use AptGet, with 
the following command.

```
sudo apt-get install python-pip
```

Remember that your sudo password is your Koding Password. Give that a 
moment, and once that finishes we can install Flask!

## Using Pip to install Flask

You may be wondering why we're using Flask to write this little web 
server of ours. Flask has a really nice API for making compact web 
applications.  This is great for a beginner guide, since we can look at a 
few core concepts without getting too bogged down with technical details 
of a web server.

Now that you have `pip` installed, to install Flask type the following 
command.

```
sudo pip install Flask
```

Note that we're using `sudo` because the default location for the 
installed packages is in a root directory. A common practice to store 
these without root permissions is to use a Virtual Environment to keep 
your packages installed per-project. We'll save that for a later guide 
though.

Once that finishes installing, lets write our Flask code!


## Creating your first Flask web server

Create a new file named `web.py`, and paste in the following code.

```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
```

There are a few interesting points in this source though, so before we 
run our web server, lets go over the source.

```python
from flask import Flask
```

First up are our `from` and `import` keywords. The `import` imports a 
module to an object with the same name. When used with the `from` keyword 
though, only the `Flask` object is imported to the current scope. So, 
this line imports a function named `Flask`.

```python
app = Flask(__name__)
```

Next up, we use that `Flask()` function to create a Flask instance, 
stored in the name `app`.

`__name__` is a special keyword which stores the name of the currently 
module, or it equals `"__main__"` if run directly. We'll see this again 
at the end of the script.

```python
def hello():
    return "Hello World!"
```

We're skipping a line, and going straight to the `def` keyword. This is 
how we **def**ine a function in Python. In this case, we're using this 
function as a handler for our Flask "route".

```python
@app.route("/")
def hello():
    return "Hello World!"
```

If we look at that function again, including the line we skipped, we see 
a new syntax structure, `@app.route("/")`.

This is known as a Decorator. Decorators are a special syntax for a 
function wrapping another function. If you're new to programming, this 
can be a bit of a tricky concept which involves [Higher Order 
Functions][hof]. We'll briefly touch this below, but for now we'll just 
take it at face value. This is how Flask routes our request to our 
handler.

A Route is a concept that directs requests *(people viewing your web 
server)* and *routes* them to your Handler functions. `"/"` is the path 
for this route, meaning that when someone connects to 
`http://username.kd.io/` they are given this function.

If someone connected to `http://username.kd.io/foo/bar`, it would not 
return this handler, because `/foo/bar` does not match our `hello` route.


```python
if __name__ == "__main__":
    app.run(host='0.0.0.0')
```

Finally we're at the end of the script. If you remember the `__name__` 
keyword from before, remember that it holds the name of the current 
*module*. If the file is run directly from Python though, ie `python 
web.py`, then the value is `"__main__"`.

By writing a `__name__ == "__main__"` condition, we make it so that if 
this file is run directly it will start the web server. If the file is 
**imported** though, it will not. This is great because we don't want 
imports to execute a bunch of potentially dangerous code. Good 
programming practice.

## Running our Flask web server

Now that we have looked at the source, lets run this thing! We can run 
this file just like above, with..

```
python web.py
```

And then connect to it with the following address.

```
http://username.kd.io:5000
```

Flask will display our text when you request the root path, awesome!

## Decorators Briefly Explained

Now that we've gone through the web server source, lets revisit the 
Decorators and go into a bit more depth. We won't go over every concept 
in full detail, so that we can keep this a sanely short beginner 
tutorial, and not a book.

To help explain decorators, lets add our own Decorator.

```python
def from_py(hello):
  def wrapper(*args, **kwargs):
    return hello(*args, **kwargs) + " From Python!"
  return wrapper

@app.route("/")
@from_py
def hello():
    return "Hello World!"
```

Lets analyze this.

`from_py` is simply a function, that takes another function. When we add 
the keyword before of a function `def`, `from_py` is called with that 
function as the first argument. This "wraps" `hello()` with our 
`from_py()` function.

Next, we create a new function **inside** the `from_py` function, we 
create a new function that acts as a handler. The `(*args, **kwargs)` 
parameters is a special syntax to keep all of the given arguments in 
those two objects, so that we can fully pass them to the `hello()` 
handler.

In our wrapper function, we then **call** then `hello()` function, with 
the arguments given to `wrapper()`.

When `hello()` returns, we add our own string `" From Python!"`, and 
return that as well.

So that means

```python
@app.route("/")
@from_py
def hello():
    return "Hello World!"
```
Is actually many functions, more than three. We could write out the 
entire structure here, but just focus on the `@from_py` for now, as to 
avoid being confused by a huge group of nested functions.

If this still doesn't make sense, don't worry! Higher order functions can 
take some getting used to. Practice them, and make your own, they're well 
worth understanding!

## Python2 vs Python3

Finally, a Python talk is never complete without wrapping everything up 
in a big Python2 vs Python3 debate! .. Luckily, we won't do that here.

If you're new to Python, and unsure which version to use, it doesn't 
really matter. They're both quite similar, pick one, and learn it. Once 
you learn one, the other version will be easily usable, and you'll be 
able to spot the differences with ease.

Python3 is the eventual future, but it's taken many years to gain 
traction, and will take many more. Choosing which to use can be a hard 
decision for seasoned programmers wanting to write large code bases. You 
shouldn't worry about that, currently. Save that for another day :)

This concludes the getting started with Python guide. Thanks for reading!





[koding]: https://koding.com
[ace]: https://koding.com/Ace
[terminal]: https://koding.com/Terminal
[hof]: http://en.wikipedia.org/wiki/Higher-order_function
