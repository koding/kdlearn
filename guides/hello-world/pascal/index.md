---
title: Pascal
author: Bee Jay
username: beeography
categories: [first program, hello world, pascal, koding]

series: hello-world
series-index: 6
template: series.toffee
---

# Hello World on Koding: Pascal

## Introduction

Pascal —or [Object Pascal](http://en.wikipedia.org/wiki/Object_Pascal "Object Pascal")— nowadays is mostly known as an old and outdated programming language. The fact is, Pascal is still alive and kicking right to this very day. Today's Pascal is **not** the old 70s Pascal. It evolves, adapts, and grows with the modern world. The most known and used Pascal compilers of today are [Free Pascal](http://freepascal.org "Free Pascal Compiler") with its [Lazarus IDE](http://lazarus.freepascal.org "Lazarus IDE") and [Embarcadero](http://www.embarcadero.com)'s [Delphi RAD Studio](http://www.embarcadero.com/products/delphi) as the successor of Borland Delphi.

Functionally, similarly to C language, Pascal is a general-purpose programming language. It has imperative, object-oriented and generic programming features, while also providing the facilities for low-level memory manipulation and the speed of native code. However, conceptually Pascal is a very different compared to the C programming language. Pascal brings you an elegant and neat language, yet still has as much power as C, or other modern programming languages.

## Implementation

Since Koding doesn't include the Free Pascal compiler, by default on your VM, the first thing you need to do is to install it manually. Don't worry, it's very easy and straight forward, thanks to Ubuntu OS that is present on each Koding VM. 

Now, open your Koding Terminal and type the following commands:

```bash
sudo apt-get update
sudo apt-get install fpc
```

Let it run and just answer Yes (Y) every time it asks for your confirmation. If all goes fine, Free Pascal should now be installed on your VM. To make sure, continue with this command:

```bash
fpc
```

It is should show Free Pascal's commands and arguments list. If these show up then Free Pascal has been installed on your VM, successfully.

Next, you'll need to create a file named `helloworld.pas` in your home folder and paste the below snippet into it.

```
begin
    writeln('Hello World!');
end.
```

To run the above file in your Koding VM, just open your Koding Terminal and type the following commands:

```bash
fpc helloworld.pas
./helloworld
```

The beauty of the Pascal language is that the syntax is very human friendly. That's what a modern programming language should be. So the above snippet will basically write a line of text that outputs `Hello World!`.

## Pascal on the Web

Beeing able to compile and run a simple Hello World console application isn't enoug! Today, everything goes on the web. And Pascal certainly is able to do just that!

Now, open the same `helloworld.pas` program above and let's add some more code. Modify the above code into this:

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

> type:tip
> Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

```
http://KODING_USERNAME.koding.io/helloworld.cgi
```

Your first Pascal CGI is running and accessible from the internet. Congratulations!

## Going Further

It's possible to write complex applications using Pascal. If you're new to Pascal, there are lots of Pascal tutorial on the internet. This one from [Tutorials Point](http://www.tutorialspoint.com/pascal/index.htm "Pascal Programming Online Tutorial") is one of the best online Pascal tutorials.

[Free Pascal](http://freepascal.org "Free Pascal Compiler") has pretty rich libraries, frameworks, and tools for almost any kind of programming needs, from console, database, mobile, games, multimedia, etc

And that's it.

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com)