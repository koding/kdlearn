---
author: Antoine Proulx
username: proulxantoine
date: 2014-07-09
categories: [elixir]
---

# Elixir on Koding

This tutorial will show you how to install [Elixir](http://elixir-lang.org/) on your Koding VM and then how to update it when a new version is available.

## What is Elixir?

From [Elixir website](http://elixir-lang.org/):

> Elixir is a functional, meta-programming aware language built on top of the Erlang VM. It is a dynamic language that focuses on tooling to leverage Erlang's abilities to build concurrent, distributed and fault-tolerant applications with hot code upgrades.

## Installation

Because Elixir runs on the Erlang VM, you need to install Erlang first. At the time of this 
writing, Elixir is at version 0.14.2 and it needs at least Erlang 17.

### Erlang

To install Erlang, you can use the [Erlang Solutions repository](https://www.erlang-solutions.com/downloads/download-erlang-otp#tabs-ubuntu).

The first thing to do is to add the repository. To do that, open the [Terminal](https://koding.com/Terminal) and then enter the following:

```sh
wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
```

The `wget` command will download a package that will be used to add the 
Erlang Solutions repository and the other one installs it.

You can now install Erlang by typing this in the Terminal:

```sh
sudo apt-get update
sudo apt-get install erlang
```

(When prompted if you want to continue, type `y` and then `Enter`.)

This will refresh the list of available packages and then install Erlang.

### Elixir

Now that you have Erlang, you can install Elixir. To do this, we'll use a precompiled version and place it in `~/lang/elixir`.

In the following commands, you need to replace `[elixir-version]` by the value of the latest version that you'll find on the [download page](https://github.com/elixir-lang/elixir/releases/latest). For example, at the time of this writing, Elixir is at version 0.14.2, so you would replace `[elixir-version]` with `0.14.2`.

```sh
mkdir -p ~/lang/elixir
wget -O elixir.zip https://github.com/elixir-lang/elixir/releases/download/v[elixir-version]/Precompiled.zip
unzip elixir.zip -d ~/lang/elixir
```

The last thing you need to do is to add the Elixir binaries to your `PATH`. Your terminal will now know where to find Elixir.

First, open up your `.profile` file using `nano`:

```sh
nano ~/.profile
```

Then, at the end of the file, add:

```sh
PATH=$PATH:~/lang/elixir/bin
```

To exit `nano` and save the file, type `Ctrl+x`, `y` and then `Enter`.

To apply the modification to the `PATH` immediately, type:

```sh
source ~/.profile
```

Elixir is now installed!

## Usage

The easiest way to begin with Elixir is to use *Interactive Elixir*. In your terminal, type `iex` to start it. You can now enter Elixir expressions and see their results.

The last thing you need to do is to learn Elixir!

## Update

When a new version of Erlang and/or Elixir is released, you will want to update your installation.

### Erlang

Because Erlang has been installed with `apt-get`, the only thing you need to do is to run the following command in your Terminal:

```sh
sudo apt-get update
sudo apt-get upgrade
```

The first command will update the list of the available packages and the second one will download 
and install the packages that have been updated in the repositories.

### Elixir

Updating Elixir is not very complicated. First, you need to remove the old installation by issuing the following command in your Terminal:

```sh
rm -r ~/lang/elixir
```

Then, you can download the latest version of Elixir and extract the content of the archive like this (do not forget to replace `[elixir-version]`!):

```sh
mkdir -p ~/lang/elixir
wget -O elixir.zip https://github.com/elixir-lang/elixir/releases/download/v[elixir-version]/Precompiled.zip
unzip elixir.zip -d ~/lang/elixir
```

Elixir is now updated!
