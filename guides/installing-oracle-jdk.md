---
title: How to install Oracle JDK
author: Team Koding
categories: [frameworks platforms, java, jdk]
template: page.toffee
---

# Installing Oracle JDK

By default, a new Koding machine includes Java [OpenJDK](http://openjdk.java.net/) 7u85 (64-bits). 
Although it is possible to use OpenJDK to run Java programs and application servers, some developers prefer to use the [Oracle JDK](https://www.oracle.com/java/). 

This guide shows you how to install the Oracle JDK in your Koding Machine.

> type:alert
> The installation of Oracle JDK also includes the Oracle JRE, some libraries and additional fonts.
> This process may require 300-500MB of free disk space in your VM.
> You can check the amount of free space you have by using the command: `df -h` (check the filesystem mounted in `/`). 
> If you need to free up space, follow [this guide](http://learn.koding.com/guides/freeing-up-space/).

## Installing Oracle JDK 7 using KPM

Koding offers a simple way to install the Oracle JDK by using the [Koding Package Manager](http://learn.koding.com/guides/getting-started-kpm/).

To install the Oracle JDK you can use the following command:

```
kpm install oracle-java7

```

You can check which Java version was installed by using the `java` command:

```
java -version
```


## Installing Oracle JDK 7 or 8 using `apt-get`

If you prefer, you can install the Oracle JDK using the `apt-get` package manager for Ubuntu.
To do it, you must add first a custom PPA (a custom source for software packages) that includes the Java installers.
The PPA for Oracle JDK 7 and 8 must be installed with the following commands:

```
sudo add-apt-repository ppa:webupd8team/java 
sudo apt-get udpate
```

Once the PPA is installed, you can install Java using the traditional `apt-get` command. 
To install the Java 7, you must use the following command:

```
sudo apt-get install oracle-java7-installer
```

To install Java 8, you must use:

```
sudo apt-get install oracle-java8-installer
```

Which version is running by default can be determined with the following command:

```
java -version
```

> type:tip
> Currently, there is an "early version" of [JDK 9](https://jdk9.java.net/). 
> You can install it using the same PPA used for Oracle JDK 7 and 8 by using:
> ```
> sudo apt-get install oracle-java9-installer
> ```

## Changing the default version of Java

If you install multiple versions of Java in your Koding VM, you can change the default implementation by using the following command:

```
sudo update-alternatives --config java
```

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
