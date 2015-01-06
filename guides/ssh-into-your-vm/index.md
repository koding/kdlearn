---
title: Connect with SSH, from Unix
author: Team Koding
date: 2014-09-15
categories: [ssh]
---

# Connect with SSH, from Unix

Connecting to your VM with SSH will allow you to use another Terminal, 
outside of Koding, to interact with your Koding VM. If you're using 
Cygwin, these instructions will work fine for you.

We are going to use the terminology "local" to represent the machine that 
you're connecting to Koding with.

## What you will need

- Your [Koding][koding] username
- Your Koding VM Address
- An SSH Key on your local machine. If you don't have a key, Github has 
  an awesome tutorial found [here][github keygen].

## Copy your Public Key

First, copy your Public Key, usually found in `~/.ssh/id_rsa.pub`, and 
copy it in its entirety. Note the `.pub` in the filename. This is the 
**public** key, and it is very important that you copy this one. It will 
look something like this.

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyhKankDE4DRM86JqZ3JPdWDeqg+Tbzlql
TLfOKTeokhRoMgy5WoMY/ZWUVES3d2vSHHwW3cwWlELmVdc3Ow57boZv3fOsPhybYHVRTClX
Yr1ncSxyTvjvCfvV5q22aIxHPWQ353543ssda87sa+85XEa4VnveJsEzxBZl4oJ4GB0AGa48
+UdIqutrgZu7D7JCK+Yl228X+3bJf3ddlqDaKaVXPivvvYqImK6ZwFsxh2lNO4E8IOd3OSK9
zv6i+io8PxWmwP0tLFokxulAI8Td1sOPBE9s9bdJ5c2T/GfGjKF+aNKsd33TsYEjjc/plMZm
RRrOgQwre6OAkgMvyV2X foo@bar.baz
```

## Adding to your Authorized Keys

Next, we need to create a file called `authorized_keys` **on your Koding 
VM**, and paste the previously copied key into it. Run the following 
commands in your **Koding Terminal**.

```
mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
```

Now, open up the `authorized_keys` file that you just created, and paste 
in your public key. To open the file you can use a Terminal editor such 
as Nano or Vim, or simply use the File Explorer on the left hand side to 
open the `~/.ssh/authorized_keys` file.

Once the key has been pasted in, save the file.

## Connecting with SSH

Lastly, open up your local Terminal client and ssh to your VM Address as 
shown below. If you do not know your VM Address, instructions to find it 
can be [found here][vm address].

```
ssh username@vmaddress
```

Replace `username` with your username, and `vmaddress` with your [VM 
Address][vm address]. As an example, here is a filled our ssh command.

```
ssh joshmurray@unkk05c3f84e.joshmurray.koding.io
```

## Troubleshooting

If you experience trouble, try connecting to your VM with the `-vv` flag 
and share the output with Koding users. An example of the above ssh 
command with the `-vv` flag is below.

```
ssh -vv joshmurray@unkk05c3f84e.joshmurray.koding.io
```


**Just a quick tip :**

If you want to open GUI for any app, while you SSH include "-X" to enable X11 forwarding.

 ```
 ssh vm-0.leeolayvar.koding.kd.io -X 
 ```
Enable trusted X11 forwarding, by using the -Y option.

 ```
 ssh vm-0.leeolayvar.koding.kd.io -Y
 ```
 


[koding]: https://koding.com
[github keygen]: https://help.github.com/articles/generating-ssh-keys
[connect windows]: /guides/connect-with-ssh-windows
[vm address]: /faq/vm-address
