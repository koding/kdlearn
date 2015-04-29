---
author: drodri
username: drodri
categories: [first program, C/C++]
---


# Getting Started with C and C++

In this guide we'll introducing C and C++ and how to build your first programs
in Koding.

C and C++ are the reference languages in many domains, from heavy computations,
research, robotics, embedded systems, financing and banking...
They are compiled languages, you write source code and a compiler translate it to
native binaries, that typically can run only in the platform they were compiled to
(Win, Linux, Mac). The process of converting source code to executable binaries,
that involve compiling and linking is called the build process. This process can
be specified by different means, e.g. using an IDE or Makefiles.


## Running your first C program

Lets create our first "Hello world" C application, and build it.
Open up your [Ace editor][ace], and open up a new file by pressing the Plus Button on the
tab list. If your file says `Untitled.txt`, you're good to go.

Next, paste the following code into the file.


```
#include <stdio.h>

void main(){
    printf("Hello world\n");
}
```

We haven't saved our file yet , so use **Ctrl-S** to save the file,
and name it `main.c` (note the extension c, not cpp).
Finally, open up the [Koding Terminal][terminal]
and build and run your application.

```
$ gcc -o hello main.c
$ ./hello
Hello world
```


## Running your first C++ program

Create another file, this time named "main.cpp" with the following code:

```
#include <iostream>

using namespace std;

int main(){
    cout << "Hello World" << endl;
    return 0;
}
```

Now we will build it with the g++ compiler, and run it. Please note that
even if they are similar, C++ is not an "extension" of C or C with classes but
a very different language by itself.

```
$ g++ -o hellopp main.cpp
$ ./hellopp
Hello world
```


Building larger applications can be somewhat difficult and cumbersome to the newbie.
As soon as your application start to have several files, you will need to define
how to build them in Makefiles, but we would rather recommend using the [CMake build system][cmake],
which is much simpler and fully portable to Windows and Mac platforms, with support
for many compilers, as Visual Studio, and IDEs as Eclipse.

The [Biicode platform][biicode] automatically generate CMake files for you, based on
your source code files. It also manage dependencies, so it can be used for reusing
existing code easily.





[koding]: https://koding.com
[ace]: https://koding.com/Ace
[terminal]: https://koding.com/Terminal
[cmake]: http://www.cmake.org/
[biicode]: https://www.biicode.com/

