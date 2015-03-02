---
title: VNC Startup Guide
author: Kaitlyn Schmidt
username: Hoshiko86
date: 2015-03-01
categories: [noVNC, VNC, GUI Development]
template: page.toffee
---

# VNC Startup Guide

or How to Develop and Run Client GUI Applications with Koding and noVNC

The Koding environment and tool base is a great way to code within the cloud.  No longer are we tied down to software running on our individual computers.  Coding, testing, and running web based applications within Koding is a snap as other tutorials will attest to, but what if you are trying to use Koding to develop a traditional client based GUI application?  How can we code and test those types of applications in the cloud?  Is it even possible? The answer of course, is YES!  We can develop our applications in Koding AND test them in the cloud, all from the comfort our our browser.  

In the following tutorial I will demonstrate how to set up your Koding VM to allow you to test and run a client GUI application.  In the end we are going to accomplish the following goals:

 1. Install Tkinter for Python.
 2. Write a simple Python GUI application to run.
 3. Download, install, and Start a TightVNC Server.
 4. Download, install, and start WebSockify.
 5. Connect to your Koding VM via noVNC.
 6. Test our sample GUI application.

## Install Tkinter for Python

Go to your [Koding Terminal](https://koding.com/Develop/Terminal)

Within the terminal type the following command:

```
sudo apt-get install python-tk
```

_NOTE: The terminal will ask you for your password before it installs Tkinter.  Be ready to type in your password._

This process downloads and installs Tkinter into your VM.

## Write a Simple Python GUI Application

Using your favorite Koding text editor, the built in Koding Editor or VI, create a new file called "test.py" in your "Documents" folder. Our example will use VI.

Go to your [Koding Terminal](https://koding.com/Develop/Terminal).

Create a "Documents" folder under your home directory, if one does not already exist.

```
mkdir home/YOUR_USER_NAME/Documents
```

Create a "test.py" file in your Documents Folder using the bellow command. It will open up Vim so you can edit the file.

```
vi /home/YOUR_USER_NAME/Documents/test.py
```

File Contents will be two lines.  Paste the following lines into VI or Ace.

```
import Tkinter
Tkinter._test();
```

To save the file in Vim, hit the "Escape" key to put Vim into command mode, then type:

```
:wq
```

You have now created and saved a very simple python GUI application.

## Download, install, and Start a TightVNC Server

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install TightVNC using just one command:

```
kpm install vnc
```

***

Go to your [Koding Terminal](https://koding.com/Develop/Terminal)

Type the following into your terminal

```
sudo apt-get install tightvncserver
```

_NOTE: The terminal will ask you for your password before it installs TightVNC.  Be ready to type in your password._

This process downloads and installs TightVNC into your VM.

To start your TightVNC server type the following command into your terminal.

```
vncserver :1
```

## Download, Install, and Start WebSockify

Before you continue reading this section why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install noVNC using just one command:

```
kpm install novnc
```

***

Go to your [Koding Terminal](https://koding.com/Develop/Terminal)

Ensure you are in your home directory.

```
cd /home/YOUR_USER_NAME/
```

From your terminal type the following.

```
git clone git://github.com/kanaka/noVNC
```

This will create a new folder in your home directory called noVNC.  Everything you need to run noVNC is contained in here.

Next we need to ensure our settings for noVNC are correct.  

In either the built in Koding Editor or your [Koding Terminal](https://koding.com/Develop/Terminal) , open up your xstartup file.

```
more /home/YOUR_USER_NAME/.vnc/xstartup
```

Your xstartup should look like the following:

```
#!/bin/sh

xrdb $HOME/.Xresources
xsetroot -solid grey
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
x-window-manager &
# Fix to make GNOME work
export XKL_XMODMAP_DISABLE=1
/etc/X11/Xsession
```

If your xstartup file does not look like this, use your editor (Vim or the built in Koding Editor) to modify and save the file to make it look like the example above.

Next thing to check is our launch.sh file.

```
more /home/YOUR_USER_NAME/noVNC/utils/launch.sh
```

Your launch.sh should look like the following:

```
#!/usr/bin/env bash

usage() {
    if [ "$*" ]; then
        echo "$*"
        echo
    fi
    echo "Usage: ${NAME} [--listen PORT] [--vnc VNC_HOST:PORT] [--cert CERT]"
    echo
    echo "Starts the WebSockets proxy and a mini-webserver and "
    echo "provides a cut-and-paste URL to go to."
    echo
    echo "    --listen PORT         Port for proxy/webserver to listen on"
    echo "                          Default: 6080"
    echo "    --vnc VNC_HOST:PORT   VNC server host:port proxy target"
    echo "                          Default: localhost:5900"
    echo "    --cert CERT           Path to combined cert/key file"
    echo "                          Default: self.pem"
    echo "    --web WEB             Path to web files (e.g. vnc.html)"
    echo "                          Default: ./"
    exit 2
}

NAME="$(basename $0)"
HERE="$(cd "$(dirname "$0")" && pwd)"
PORT="8787"
VNC_DEST="localhost:5901"
CERT=""
WEB=""
proxy_pid=""
```

Pay particular attention to the `PORT` and `VNC_DEST` variables.

If your launch.sh file does not look like this, use your editor (Vim or the built in Koding Editor) to modify and save the file to make it look like the example above.

Using your [Koding Terminal](https://koding.com/Develop/Terminal), type the following to start WebSockify from the noVNC folder:

```
/home/YOUR_USER_NAME/noVNC/utils/launch.sh
```

## Connect to your VNC Server

Connecting to your VNC Server from the cloud is fairly easy with noVNC.  

Within your browser navigate to

```
http://YOUR_ASSIGNED_URL:8787/vnc.html?host=YOUR_ASSIGNED_URL&port=8787
```

YOUR_ASSIGNED_URL can be found by looking up the [URL for your VM](http://learn.koding.com/faq/vm-hostname/).  It should be of the form 12_OR_SO_CHARACTERS.YOUR_USER_NAME.koding.io

Within the top righthand corner there will be a monitor looking icon.  When you hover over this button the tool-tip will say "Connect".

![Connect Button][1]

Click on this button and fill out the resulting form.

```
Host: YOUR_ASSIGNED_URL
Port: 8787
Password: YOUR VNC PASSWORD
```

If this doesn't work, and the noVNC setup asked you to define a password, use it here.  The noVNC password will be 8 characters or less.

![Connect Form][2]

Hit the "Connect" button.

You are now connected to your Koding VM within a VNC connection! You should see a terminal on your screen that you can use to control your VM.

![Successfully Connected][3]

## Test Our Sample GUI Application

Connect to your VNC Server via the above instructions.  

Use the terminal shown in noVNC for the following steps.  

**DO NOT RUN THESE STEPS IN THE KODING TERMINAL!**

At the command line within noVNC, type the following command:

```
python /home/YOUR_USER_NAME/Documemnts/test.py
```

This will start up our sample GUI application. You should see a pop up with two buttons: "Click ME" and "Quit"

![Sucessfull GUI Application Run][4]

## Conclusion

Congratulations!  If you've made it this far, you should have a successful setup.  Running other GUI programs that you develop is a easy as calling them from the command line in noVNC.

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).

[1]: http://i.imgur.com/O8Duk7k.png
[2]: http://i.imgur.com/55OmVP9.png
[3]: http://i.imgur.com/tTxlmK0.png
[4]: http://i.imgur.com/DfE3ZJk.png
