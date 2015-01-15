---
author: Team Koding
date: 2015-01-15
categories: [koding, dropbox, file sync]
---

# Using Dropbox with Koding

In this guide we'll walk you through how to set up Dropbox right on your Koding VM for a seamless sync experience between your local system and your Koding VM. Dropbox has built a best-in-class file sync and storage service.

## Getting started

Before we begin please make sure you the Koding Package Manager (KPM) installer on your VM. Follow [this guide](http://learn.koding.com/kpm) to understand what KPM is and how to install it so you will be able to continue with this guide.

Also make sure you have an active Dropbox account (free or paid).

## Setup

Run the following command, in your Koding Terminal, to install the necessary dependency:

```
kpm install dropbox
```

This will install the Dropbox daemon on your Koding VM, that will make the file sync possible.

After the install has finished you'll need to configure the daemon with your Dropbox account. In order to that you'll need to type this command:

```
./.dropbox-dist/dropboxd
```

Next you'll see a message similar to this one:

```
Please visit https://www.dropbox.com/cli_link_nonce?nonce=A_VERY_LONG_NUMBER to link this device.
```

Copy the link and past it in a new tab.

Sign in to your Dropbox account.

That's it! You should see a message in your Terminal similar to this one:

```
This computer is now linked to Dropbox. Welcome YOUR_DROPBOX_NAME
```

__Note: Whenever you turn on Koding VM you will have to run the `./.dropbox-dist/dropboxd` command to get dropbox started.__

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).