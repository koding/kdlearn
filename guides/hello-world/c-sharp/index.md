---
title: C-Sharp (C#)
author: Team Koding
categories: [first program, hello world, C-Sharp, koding]

series: hello-world
series-index: 3
template: series.toffee
---

# Hello World in C#

## Introduction
To run C# code on a Linux environment, you will need to use Mono. Mono is an open source implementation of Microsoft's .NET Framework based on the ECMA standards for C# and the Common Language Runtime. Mono is sponsored by [Xamarin](http://xamarin.com/). Mono allows developers to build cross-platform applications with improved developer productivity. [Find out more](http://www.mono-project.com/docs/about-mono/) about Mono. 

## Installing Mono
The following instructions will install Mono and MonoDevelop on your Koding VM.

> type:alert
> Before proceeding, make sure that you have at least 150MB free on your VM. You can check the 
> amount of free space you have by using the command: `df -h`. If you need to free up space, follow
> [this guide](http://learn.koding.com/guides/freeing-up-space/).

To install Mono, type this command in your Terminal:
```
sudo apt-get install monodevelop mono-utils nunit -console -y
```
The installation process will take a few minutes. Once it is done, you can verify that the Mono compiler was 
successfully installed by using the following command:
```
mcs --version
```
the output should look something like:
```
Mono C# compiler version 3.2.8.0
```
> type:tip
> the version number above may be different in your case, that's quite ok.

## Writing your first program in C#
Open up a new tab in the Koding IDE and type in the following code block:

```
// "Hello World!" program in C#

using System;

namespace HelloWorld
{
    public class Hello
    {
        public static void Main ()
        {
            Console.WriteLine ("Hello World!");
        }
    }
}
```
Save the file as `hello.cs` by using the "Save As.." option from the drop down menu available on the tab of this file
in the IDE.

Now to compile this program so that you can run it, type the following command in Terminal:
```
mcs hello.cs
```
> type:tip
> make sure you are in the same directory as the saved file when you execute the command above
> otherwise you may get a "file not found" error.

The compiler will do its thing and create a new file called `hello.exe` which you can then run by typing
this command in Terminal:
```
mono hello.exe
```
You should see the following output in the Terminal:
```
Hello World!
```

Congratulations, you have written your first C# program! 

Now that Mono is installed and available on your VM, you can find plenty of C# tutorials on the Internet and try them out on your Koding VM. Remember one thing, since there is no graphical environment on your Koding VM, you should only write or practice C# programs that are NOT graphical. In other words, stick to writing C# applications that are command line only
for now.
