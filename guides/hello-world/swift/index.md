---
author: Bee Jay
username: beeography
date: 2015-12-13
categories: [first program, hello world, swift, koding]
---

# Hello World on Koding: Swift

## Introduction

In June 2014, at WWDC 2014 event, [Apple](http://apple.com) surprised programmers all around the world by introducing a new programming language dubbed "**Swift**". Apple promises many things with this new programming language, some of them are ease of use, great performance, and code safety. It also introduces a new programming paradigm called protocol oriented programming. And it will become the official programming language on Apple platforms, slowly replacing Objective-C.

As if it's not enough, along with the release of Swift v.2.0 at WWDC 2015 event, Apple also announced that Swift will become an open source project and support Linux as well. And by the end of 2015, along with Swift v.2.2, Apple officially release Swift as an open source project with its own official website at [swift.org](http://swift.org). This move is mostly accepted positively by many programmers. Many software experts say that this move will boost Swift into popular programming language in relatively short time. 

## Installation

Swift v.2.2 fortunately supports Linux Ubuntu since the first time it went open source. As Koding is also using Ubuntu, the installation should be easy enough. Alright, let's try it out... 

1. First we should download the correct Swift file for our VM. As Koding is using Ubuntu 14.04, we will download the appropriate version. We're going to use `wget` to dowload the file. Open a terminal, assuming you're on your home directory, type this:

  ```bash
  $ wget https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz
  ```
  
2. Download the package signature file. Type this:

  ```bash
  $ wget https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz.sig
  ```
  
3. Download and import the package associated PGP keys. Type this:

  ```bash
  $ wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
  ```
  
4. Download and import the signing keys for the package. Type this:

  ```bash
  $ wget -q -O - https://swift.org/keys/release-key-swift-2.2.asc | gpg --import -
  ```
  
5. To make sure that we got the correct Swift files, do the file verification. Type this:

  ```bash
  $ gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift
  ```
  
  You might see some warnings, but as long as the verification doesn't fail, you could simply ignore them.
  
6. Install the required clang development tools. Type this:

  ```bash
  $ sudo apt-get update
  ```
  
  then follow by this:
  
  ```bash
  $ sudo apt-get install clang libicu-dev
  ```
  
  Just press *y* (yes) everytime it asks for confirmation.
  
7. As all the requirements are set, now extract the archive. Type this:

  ```bash
  $ tar xzf swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz
  ```
  
8. For convinience, it's better to rename the Swift folder. Type this:

  ```bash
  $ mv swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04/ swift-2.2 
  ```
  
9. The last step, type this:

  ```bash
  $ export PATH=~/swift-2.2/usr/bin:"${PATH}"
  ```
  
  > ✔︎ **TIP**    
  > For convinience, open your `.bashrc` file and at the last line add this:
  > ```
  > PATH=~/swift-2.2/usr/bin:"${PATH}"
  > ```
  
10. If everything goes well, you should be able to use Swift by now. To test it, type this on the terminal:

  ```bash
  $ swift -version
  ```
  
  It should return your currently installed Swift version. It should look like this:
  <pre>
  Swift version 2.2-dev (LLVM 46be9ff861, Clang 4deb154edc, Swift 778f82939c)         
  Target: x86_64-unknown-linux-gnu
  </pre>
  
  If you see similar text like the above then congratulation, you've just installed Swift successfully!
  
  > ✔︎ **TIP**    
  > As Swift has been installed on your VM, you may safely delete the downloaded `.tar.gz` and `.tar.gz.sig` files to save some spaces. 

## First Program 

Since you already have got Swift installed on your system, let's play around with it. Let's write a simple Hello World program.

1. For convinience, let's install Koding command to open editor from the command line. Open your terminal and type this:

  ```bash
  $ kpm install kdbin 
  ```
  
  Wait for a second until it finishes its job. You may skip this first step if you already have `kdopen` installed on your VM.
  
2. Create a new swift source file name `hello.swift`. Type this:

  ```bash 
  $ kdopen hello.swift 
  ```
  
3. After the editor open the file, type this code:

  ```swift 
  print("Hello World from Swift!")
  ```
  
  Then save the file.
  
4. Back to your terminal. Run the program, type this:

  ```bash 
  $ swift hello.swift 
  ```
  
  If nothing goes wrong, it should display `Hello World from Swift!` on the console. 
  
5. The above step is using swift as an interpreter (REPL). If you want to try the swift compiler, type this:

  ```bash 
  $ swiftc hello.swift 
  ```
  
  Notice the additional `c`, it means "compiler". If no error message is shown, it means the compilation is successful. Swift produces an executable binary file. To run it, simply type this:
  
  ```bash 
  $ ./hello 
  ```
  
  It should also display `Hello World from Swift!` on the console. 

Here's the Hello World demo video:

![Swift Hello World](http://i.imgur.com/7BK2fra.gif)

Of course a simple Hello World program wouldn't be enough. To learn more about Swift language, you could read the online Language Guide [here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html). You could also download the ebook from <a href="https://swift.org/documentation/TheSwiftProgrammingLanguage(Swift2.2).epub">here</a> (.epub).

> ✔︎ **TIP**    
> If you just want to learn the Swift language without bothering to install Swift on your VM, you may try my online Swift runner [here](http://beeography.koding.io/webswift.cgi). Have fun!

## What's Next 

Swift is a brand new programming language. It's still being actively developed and improved by Apple with the help of programmers all around the world. Apple puts its bet on this language for its future. If you really want to master this language, you should actively monitor Swift official website and follow the [mailing lists](https://swift.org/community/#mailing-lists). Many things are being discussed to make Swift the ultimate programming language of the future. It's also fun to watch a language growing. 

Alright... that's all folks! :)
