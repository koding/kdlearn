---
title: Perl
author: Team Koding
date: 2015-03-03
categories: [first program, hello world, perl, koding]

series: hello-world
series-index: 5
template: series.toffee
---

# Hello World in Perl

## Introduction

Perl is a family of high-level, general-purpose, interpreted, dynamic programming languages. The Perl languages borrow features from other programming languages including C, shell scripting (sh) etc. They provide powerful text processing facilities without the arbitrary data-length limits of many contemporary Unix commandline tools, facilitating easy manipulation of text files.

## Implementation

The first thing you need to do is to create a file called `helloworld` in your Koding VM and paste the bellow snippet into it.

```
#!/usr/bin/perl

use strict;
use warnings;

print "Hello, World!";
```

To run the above file in your Koding VM, just open your Koding Terminal and type the following commands:

first ensure the file is given executable permissions:

```
chmod u+x helloworld
```

and then run this command

```
perl helloworld
```

## Explanation

```
#!/usr/bin/perl
```

Every Perl program should start with this as its very first line, although this may vary from system to system. This line tells the machine what to do with the file when it is executed.

```
use strict;
use warnings;
```

These two statements turn on the 'strict' and 'warnings' pragmas. These are strongly encouraged for all Perl programs since they tell the Perl interpreter to check for programming errors like undeclared variables.

```
print "Hello, World!";
```

The print function outputs some data. In the above case it prints out the string `Hello world`, and as always the statement ends with a semicolon.

And that's it!

You just wrote and ran your first Hello World in Perl.
