---
title: Go
author: Team Koding
date: 2015-03-04
categories: [hello world, go, koding]

series: hello-world
series-index: 3
template: series.toffee
---

# Hello World in Go

## Introduction

Go or golang is a statically-typed language with syntax loosely derived from C, that adds garbage collection, type safety, some dynamic-typing capabilities, additional built-in types such as variable-length arrays and key-value maps, and a large standard library.

## Implementation

The first thing you need to do is to create a file called `helloworld.go` in your Koding VM and paste the bellow snippet into it.

```
package main

import "fmt"

func main() {
    fmt.Println("Hello World!")
}
```

To run the above file in your Koding VM, just open your Koding Terminal and type the following command:

```
go run helloworld.go
```

Or you can build the program into a binary. You can do this using the bellow command:

```
go build helloworld.go
```

And you can then execute the built binary directly.

```
./hello-world
```

## Explanation

```
package main
```

This is known as a “package declaration”. Every Go program must start with a package declaration. There are two types of Go programs: executables and libraries. Executable applications are the kinds of programs that you can run directly from the terminal.

```
import "fmt"
```

The import keyword is how you include code from other packages to use with you program. The fmt package (shorthand for format) implements formatting for input and output.

```
func main()
```

Functions are the building blocks of a Go program. They have inputs, outputs and a series of steps called statements which are executed in order. All functions start with the keyword func followed by the name of the function (main in this case), a list of zero or more “parameters” surrounded by parentheses, an optional return type and a “body” which is surrounded by curly braces.

```
{}
```

The two curly brackets, one in the beginning and one at the end, are used to group all commands together, they are used to mark the beginning and end of a
group or function.

```
fmt.Println("Hello World")
```

This statement is made of three pieces. First you access another function inside of the fmt package called Println (that's the fmt.Println piece, Println means Print Line). Then you create a new string that contains Hello World and call that function with the string as the first and only argument.

And that's it!

You just wrote and ran your first Hello World in Go.
