---
title: C++
author: Team Koding
categories: [first program, hello world, c++, koding]

series: hello-world
series-index: 2
template: series.toffee
---

# Hello World in C++

## Introduction

C++ is a general-purpose programming language. It has imperative, object-oriented and generic programming features, while also providing the facilities for low-level memory manipulation.

## Implementation

The first thing you need to do is to create a file called `helloworld.cpp` in your Koding VM and paste the bellow snippet into it.

```
#include <iostream>

int main() {
    std::cout << "Hello World!";
}
```

To run the above file in your Koding VM, just open your Koding Terminal and type the following commands:

```
g++ -o hellopp helloworld.cpp
./hellopp
```
> type:tip
> If g++ is not installed on your VM, you can easily install it using these commands:
> `sudo apt-get update; sudo apt-get install g++`

## Explanation

```
#include <iostream>
```

Lines beginning with the hash sign `#` are commands read and interpreted by the preprocessor. They are lines interpreted before the compilation of the program itself begins. In this case, the command `#include <iostream>`, instructs the preprocessor to include a section of standard C++ code, known as header iostream, that allows to perform standard input and output operations, such as writing the output of this program (Hello World) on the screen.

```
int main()
```

The int is what is called the return value (in this case of the type integer). Every C++ program must have a `main()` function since this is the starting point.

```
{}
```

The two curly brackets, one in the beginning and one at the end, are used to group all commands together, they are used to mark the beginning and end of a
group or function.

```
std::cout << "Hello World!";
```

This line is a C++ statement. Statements are executed in the same order that they appear within a function's body.

Your statement has three parts: first `std::cout`, which identifies the standard character output device; Second, the insertion operator `<<`, which indicates that what follows is inserted into `std::cout`. Finally, a sentence within quotes `"Hello world!"`, is the content inserted into the standard output. The semi-colon and the end shows that it is the end of the command.

And that's it!

You just wrote and ran your first Hello World in C++.
