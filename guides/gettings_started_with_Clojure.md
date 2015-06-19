---
author: Jajati K. Sahoo
username: jp0d
categories: [first program, Clojure]
---


# Getting Started with Clojure

In this guide we'll introduce Clojure and how to write your first program
in Koding.

Clojure is a functional programming language that features a concise syntax, 
elegant concurrency support. The best feature of this language is it's ability 
to compile into Java byte code and running it on the standard JVM.

## Setting up Clojure

Clojure is written in Java and is available in the form of a Jar file. To use 
the Clojure interpreter, one must download it from the maven repository below. 
The below command will download Clojure in the current directory.

$ curl -O -J -L http://repo1.maven.org/maven2/org/clojure/clojure/1.6.0/clojure-1.6.0.zip

If the link doesn't work, please take the latest Maven repository from 
Clojure website.

## The Clojure Shell or the REPL

To enter the Clojure shell or REPL, execute the following command from the [Terminal][terminal].
To be able execute the following you must have a valid JRE in your VM.

```clojure
$ java -cp clojure-1.6.0.jar clojure.main
Clojure 1.6.0
user=> (+ 10 10)
20
```

## Creating a shortcut for Clojure.

If you wish to create a shortcut to the Clojure shell, you can create a small script and put it
in the `~/bin` directory. You could name the script `cloj.sh` and put the following content 
there.

```sh
#!/bin/bash

java -cp /home/your_user_name/clojure-1.6.0/clojure-1.6.0.jar clojure.main
```

Then use the following command to make it executable.

```sh
chmod +x ~/bin/cloj.sh
```

To access the Clojure shell, you can type `$ cloj.sh` command anywhere from the [Terminal][terminal].

## Install [Lein](http://leiningen.org/)
`Lein` is the build tool for Clojure. It creates the project structure and builds your 
Clojure application. The following steps may be used to install Lein.

- First download the `lein` application using the following command in your ~/bin directory.

```sh
curl -O -L -J https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
```
- Make it executable using the command `chmod +x ~/bin/lein`
- Run the `lein` program from [Terminal][terminal]. It'll download itself.

[koding]: https://koding.com
[ace]: https://koding.com/Ace
[terminal]: https://koding.com/Terminal
[lein]: http://leiningen.org/


