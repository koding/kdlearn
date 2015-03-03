---
title: Java
author: Team Koding
date: 2015-03-03
categories: [hello world, java, koding]

series: hello-world
series-index: 3
template: series.toffee
---

# Hello World in Java

## Introduction

Java is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.

## Implementation

The first thing you need to do is to create a file called `helloworld.java` in your Koding VM and paste the bellow snippet into it.

```
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

To run the above file in your Koding VM, just open your Koding Terminal and type the following commands:

```
javac helloworld.java
java helloworld
```

## Explanation

```
public class Main
```

The first line defines a class called Main. In Java, every line of code that can actually run needs to be inside a class. This line declares a class named Main, which is public, that means that any other class can access it.

```
public static void main(String[] args)
```

The main method has to have this exact signature in order to be able to run your program.

* public - means that anyone can access it.
* static  - means that you can run this method without creating an instance of Main.
* void - means that this method doesn't return any value.
* main - is the name of the method.

The arguments inside the method are the arguments that you will get when running the program with parameters. It's an array of strings.

````
{}
```

The curly brackets, one in the beginning and one at the end, are used to group all commands together, they are used to mark the beginning and end of a
group or function.

```
System.out.println("Hello, World!");
```

`System` is a pre-defined class that Java provides and it also holds some useful methods and variables. `out` is a static variable within `System` that represents the output of your program. `println` is a method of out that can be used to print a line.

And that's it!

You just wrote and ran your first Hello World in Java.
