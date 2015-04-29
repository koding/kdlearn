---
title: Ruby
author: Team Koding
categories: [first program, hello world, ruby, koding]

series: hello-world
series-index: 8
template: series.toffee
---

# Hello World in Ruby

## Introduction

Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, including functional, object-oriented, and imperative. It also has a dynamic type system and automatic memory management.

## Implementation

The first thing you need to do is to create a file called `helloworld.rb` in your Koding VM and paste the bellow snippet into it.

```
#!/usr/bin/ruby

puts 'Hello, world!'
```

To run the above file in your Koding VM, just open your Koding Terminal and type the following command:

```
ruby helloworld.rb
```

## Explanation

```
#!/usr/bin/ruby
```

The shebang line is read by the program loader to determine what program to use to run the script. This line cannot be preceded by any blank lines or any leading spaces.

```
puts 'Hello, world!'
```

The above line is pretty self explanatory. It will put something (in the above case, a "Hello World!" string) on the screen.

And that's it!

You just wrote and ran your first Hello World in Ruby.
