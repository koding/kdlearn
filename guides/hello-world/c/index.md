---
title: C
author: Team Koding
categories: [first program, hello world, c, koding]

series: hello-world
series-index: 1
template: series.toffee
---

# Hello World in C

## Introduction

C is a general-purpose, imperative computer programming language. As a language it supports structured programming, lexical variable scope and recursion, also having a static type system that prevents unintended operations is a major advantage.

## Implementation

The first thing you need to do is to create a file called `helloworld.c` in your Koding VM and paste the below snippet into it.

```
#include<stdio.h>

int main() {
    printf("Hello World");
    return 0;
}
```

To run the above file in your Koding VM, just open your Koding Terminal and type the following commands:

```
gcc -o hello helloworld.c
./hello
```

## Explanation

```
#include<stdio.h>
```

This line will include a file called stdio.h that represents the standard Input/Output header file. This file allow you to use certain commands for input or output which you can use in you program.

```
int main()
```

The int is what is called the return value (in this case of the type integer). Every C program must have a `main()` function since this is the starting point.

```
{}
```

The two curly brackets, one in the beginning and one at the end, are used to group all commands together, they are used to mark the beginning and end of a
group or function.

```
printf("Hello World");
```

The `printf` is used for printing things on the screen, in this case the words: __Hello World__. As you can see the data that is to be printed is put inside round brackets. The words Hello World are inside inverted commas, because they are what is called a string (a single letter is called a character and a series of characters is called a string). Strings must always be put between inverted commas. After the last round bracket there must be a semi-colon. The semi-colon shows that it is the end of the command.

```
return 0;
```

When you wrote the first line `int main()`,  you declared that main must return an integer `int main()`. With `return 0;` you can return the value null to the operating system. When you return with a zero you tell the operating system that there were no errors while running the program.

And that's it!

You just wrote and ran your first Hello World in C.
