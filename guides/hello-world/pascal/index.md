---
author: Bee Jay
username: beeography
date: 2015-05-30
categories: [first program, hello world, pascal, koding]
---

# Hello World on Koding: Pascal

## Introduction

Pascal —or [Object Pascal](http://en.wikipedia.org/wiki/Object_Pascal "Object Pascal")— nowadays is mostly known as an old and outdated programming language. But, let me assure you, it's all wrong at any levels and terms. The fact is, Pascal is still alive and kicking right to this very day. Today's Pascal is **not** the old 70s Pascal. It evolves, adapts, and grows with the modern world. The most known and used Pascal compilers of today are the mighty [Free Pascal](http://freepascal.org "Free Pascal Compiler") with its awesome [Lazarus IDE](http://lazarus.freepascal.org "Lazarus IDE") and [Embarcadero](http://www.embarcadero.com)'s [Delphi RAD Studio](http://www.embarcadero.com/products/delphi) as the successor of Borland Delphi.

Functionally, similarly to C language, Pascal is a general-purpose programming language. It has imperative, object-oriented and generic programming features, while also providing the facilities for low-level memory manipulation and the speed of native code. However, conceptually Pascal is a very different beast compare to C language. Pascal brings you an elegant and neat language yet still has as much as power of C, or other modern programming languages today.

## Implementation

Since Koding doesn't include Free Pascal compiler by default on your VM, the first thing you need to do is to install it manually by yourself. Don't worry, it's very easy and straight forward. Thanks to Ubuntu! 

Now, open your Koding Terminal and type the following commands:
```bash
$ sudo apt-get update
$ sudo apt-get install fpc
```
Let it run and just answer Yes (Y) every time it asks for your confirmation. If all go fine, Free Pascal should have already been installed on your VM. To make sure, continue with this command:
```bash
$ fpc
```
It is supposedly show Free Pascal's commands and arguments list. If it is then Free Pascal is installed on your VM successfully. Congratulations!

Next, you need to create a file named `helloworld.pas` in your home folder and paste the below snippet into it.
```
begin
    writeln('Hello World!');
end.
```
To run the above file in your Koding VM, just open your Koding Terminal and type the following commands:
```bash
$ fpc helloworld.pas
$ ./helloworld
```

Do you really need an explanation for the Pascal source code above? Don't you think it has explained by itself? Yes, that's one of many beauties of Pascal language. The syntax is very human friendly. That's what a modern programming language should be.

## Pascal Goes To The Web

So, just being able to compile and run a simple Hello World console application is enough? I don't think so. Today, everything goes to the web. And Pascal certainly is able to do just that! Let's do it!

Now, open the same `helloworld.pas` program above and let's add some little magics. Modify the above code into this:
```
begin
    writeln('content-type: text/html;');
    writeln;
    writeln('Hello World from Pascal!')
end.
```
Then switch to your Terminal window and type these commands:
```bash
$ fpc helloworld.pas
$ mv helloworld Web/helloworld.cgi
```
The last command above is deploying your Pascal program as CGI into your web accessible folder on your Koding VM.

Next, open a new browser window and type your Koding VM domain followed by `helloworld.cgi`, for example:
```
http://username.koding.io/helloworld.cgi
```
Tadaaa! Your first Pascal CGI is running and accessible from the internet. Congratulations!

## Going Further

It's sure possible to write more complex applications using Pascal. I have written Koding Hello World using Pascal at [my Koding domain](http://beeography.koding.io/pascal.cgi "Koding Hello World from Pascal"). If you're new to Pascal, there are lots of Pascal tutorial on the internet. This one from [Tutorials Point](http://www.tutorialspoint.com/pascal/index.htm "Pascal Programming Online Tutorial") is one of the best online Pascal tutorial.

[Free Pascal](http://freepascal.org "Free Pascal Compiler") has pretty rich libraries, frameworks, and tools for almost any kind of programming needs, from console, database, mobile, games, multimedia, etc. Also don't forget its awesome [Lazarus IDE](http://lazarus.freepascal.org "Lazarus IDE"). Both are free, open source, and cross platform. Enjoy!

That's it all, folks!
