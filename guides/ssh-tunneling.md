---
author: Team Koding
date: 2014-08-9
categories: [ssh]
---

# How to setup an SSH Tunnel in Unix

In this guide we'll go over what SSH Tunneling is, what it's used for, 
and how to set one up on your Koding VM. So, lets get started!

## What is SSH Tunneling?

SSH Tunneling is the process of sending and receiving TCP and UDP packets 
through an SSH Connection. This enables you to bypass proxies and go 
directly to your VM, with whatever data/etc that you need.

## Why would I want to SSH Tunnel?

Koding Virtual Machines do not have direct IP access. They proxy http 
connections from your domain, to the machine itself. Note that only HTTP 
is proxied. This is why when you SSH into your VM, you set up a special 
SSH config to run your connection through `ssh.koding.com`.

Because of this Proxy, some things you may want to do on Koding, such as 
connecting a MySQL Database Client directly to your MySQL Server becomes 
impossible via the username domains.

To solve this, you use SSH Tunneling to connect to servers directly on 
your VM, from your local machine. Lets take a look at how this is done.

## Using a SSH Tunnel

First up, make sure you have gone through the [SSH Guide][ssh-guide], and 
can successfully connect to your VM using the steps outlined in that 
guide. You **must** have a working SSH connection for this to work.

Next, run the following command.

```
ssh -L 8080:localhost:80 hostname.username.koding.io
```

Where `hostname` is the hostname of your VM, and `username` is your 
Koding username.

After running this command, you'll simply connect to your VM.. it may 
appear like nothing has happened. But now, like magic, try loading the 
following URL into your browser.

```
http://localhost:8080/
```

Just like magic, you can see that your Port 8080 on **localhost** is 
returning the same thing as:

```
http://hostname.username.koding.io:80
```

Awesome! To connect with something like a MySQL Database Client, simply 
create an SSH tunnel with the appropriate Port **on the Virtual 
Machine**, and any port you'd like for your localhost. Then connect to 
your localhost with your MySQL Client!




[ssh-guide]: ssh-into-your-vm
