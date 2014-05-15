---
title: SSH into your Koding VM
author: Koding Community
date: 2013-11-30
template: page.toffee
---

# SSH into your Koding VM

In this tutorial, we will go over the steps to SSHing into your VM! **Reminder**: As with all of these tutorials, they assume that there are no conflicts. If you have previously attempted to install this software please remove it fully or understand that conflicts may occur. Thanks :) 

## Video

Note: These videos are for an older UI, but still apply for the majority of steps. 

### *nix (Linux/OS X/BSD) Video

### PuTTY Video

## What you will need

In this tutorial, I am going to use the terminology of "Home" and "Koding" machines. Home being whatever the machine you are using to connect to Koding with. Koding being the machine that is receiving the connection. `Home -> Koding`. On the Home machine, you will need your SSH public/private keys. On Linux (or Cygwin on Windows), your SSH keys are usually found at `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`. On Windows (without Cygwin), you may need to generate new keys with [PuTTYGen](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html). If you need to generate a new key pair, please refer to a [Linux](https://help.github.com/articles/generating-ssh-keys) or [Windows](http://katsande.com/using-puttygen-to-generate-ssh-private-public-keys) tutorial, as appropriate. You will also need your Koding Username, and your VM Number. To find your VM number, review the [Find your VM Number](/docs/guides/find-your-vm-number/) guide. 

## Tutorial Steps for OpenSSH on *nix (Linux/OS X/BSD) or Cygwin

  1. First, copy your Public Key, usually found in `~/.ssh/id_rsa.pub`, and copy it in its entirety! It will look something like this:`ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyhKankDE4DRM86JqZ3JPdWDeqg+TbzlqlTLf OKTeokhRoMgy5WoMY/ZWUVES3d2vSHHwW3cwWlELmVdc3Ow57boZv3fOsPhybYHVRTClXYr1ncS xyTvjvCfvV5q22aIxHPWQ353543ssda87sa+85XEa4VnveJsEzxBZl4oJ4GB0AGa48+UdIqutrg Zu7D7JCK+Yl228X+3bJf3ddlqDaKaVXPivvvYqImK6ZwFsxh2lNO4E8IOd3OSK9zv6i+io8PxWm wP0tLFokxulAI8Td1sOPBE9s9bdJ5c2T/GfGjKF+aNKsd33TsYEjjc/plMZmRRrOgQwre6OAkgM vyV2X foo@bar.baz`
  2. Next, paste this entire Public Key into your SSH Keys section of your Account settings. This can be found by going to [Koding/Account](https://koding.com/Account) and clicking SSH Keys under the DEVELOP. Click the Plus button on the right side of the page, and paste your Public Key into this. Below is a screenshot of this area for clarification. ![Koding SSH Keys](/wp-content/uploads/sshkeys.png)
  3. Now go back to your Home machine, and create the file `~/.ssh/config` _(assuming it's not already created)_. Add the following code into that file:[code] Host *.kd.io User <username> ProxyCommand ssh %r@ssh.koding.com nc %h %p [/code]Where `<username>` is your username, without the `<>`.
  4. Next, on your Home machine and connect to your VM! This can be done by typing: `ssh <vm-Number>.<username>.koding.kd.io`. An example, here is my connection command: `ssh vm-0.leeolayvar.koding.kd.io`.You will have to enter your local SSH password, if you chose one when you created your key. After that, presented with `username@vm-X:~$`, signaling that you have connected successfully.This step has quite a few Gotchas so please review them below.Two likely gotchas, are Agent Failure and ssh_exchange_identification, which can be seen in the Possible Gotchas section below.
  5. ### Alternate id_rsa

If you're using an alternately named `id_rsa` file, you can modify your config to support this with the following example. [code] Host *.kd.io User <username> IdentityFile ~/.ssh/alternate ProxyCommand ssh -i ~/.ssh/alternate %r@ssh.koding.com nc %h %p [/code] Note the `IdentityFile ~/.ssh/alternate` and `-i ~/.ssh/alternate`, they tell SSH the location of your public key, and are required. Replace the file location with the location of your alternate key.

## Tutorial Steps for PuTTY on Windows

For this connection method, you will need the [PuTTY SSH client suite](http://www.chiark.greenend.org.uk/~sgtatham/putty/): `putty.exe`, `plink.exe`, and `pageant.exe`. **Note: **PuTTY has proven difficult to support due to the UI and ease of checking/configuring PuTTY incorrectly. With that said, i highly recommend using Cygwin, since it offers a real and normal Unix SSH Config. Much easier. 

  1. Copy the text contents of your PuTTY public key. If you are not sure what or where it is, please refer to What you will need.
  2. As in Step #2 of the Linux guide above, paste the entirety of your public key into the _SSH Keys_ section of your Koding account settings.
  3. Start up `putty.exe` and set the _Host Name (or IP address)_ to the same VM hostname as above:`vm-Number.<username>.koding.kd.io`![PuTTY session](/wp-content/uploads/puttysession.png)
  4. In the _Category_ menu on the left, select _Data_ under _Connection_. Enter your Koding username in the _Auto-login username_ box.
  5. Select _Proxy_ under _Connection_, and change the _Proxy type_ to _Local_. Enter the following line (modified for your system) in the _Telnet command, or local proxy command_ box:`C:\your\path\to\plink.exe <username>@ssh.koding.com -nc %host:%port`![PuTTY proxy](/wp-content/uploads/puttyproxy.png)
  6. Go back up to the _"Session"_ settings and save this PuTTY configuration to a new session by typing a name into the _"Saved Sessions"_ box, and clicking on _"Save"_.
  7. In Step 7, we will cover setting up your Auth. This can be done two ways, and we will cover both. **You only need to do one** method! Pageant has been working for everyone, where as PuTTY-Auth has been a bit problematic but is shorter. Choose whichever you like, but if you have issues, try Pagaent Auth below. 

### Pageant Auth

Open `pageant.exe`. It will launch into your Taskbar. ![Pageant Taskbar](/wp-content/uploads/pageanttaskbar.png) Right click the Pageant icon in the taskbar, and select _"View Keys"_. From there, click the _"Add Key"_ button. Navigate to your PuTTYGen **private** key and click _"Open"_. You should now have a key listed in your Pageant Key List. An example image is below. ![Pageant key List](http://learn.koding.com/wp-content/uploads/pageantkeylist.png) If your key has been added to the Pageant Key List, close the window. 

### PuTTY Auth

Reopen PuTTY and select your Session, then click Load. Next, under the _Connection_ menu, open up the _SSH_ menu and select _Auth_. Enable the _Allow agent forwarding_ checkbox. Under _Private key file for authentication_, browse to your PuTTYGen private key. ![PuTTY SSH auth](/wp-content/uploads/puttyauth.png) Next, Plink needs to know the explicit location of your key. So go back to _"Proxy"_ under _"Connection"_ and look for the _"Telnet command, or local proxy command"_ box. Currently, it should look like this: `C:\your\path\to\plink.exe <username>@ssh.koding.com -nc %host:%port` Modify it, by adding your private key location. So, it will look like this:
