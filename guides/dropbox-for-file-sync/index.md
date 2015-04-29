---
author: Team Koding
categories: [developer tools, koding, dropbox, file sync, file transfer]
---

# Using Dropbox with Koding

In this guide we'll walk you through how to set up Dropbox right on your Koding VM for a seamless sync experience between your local system and your Koding VM. Dropbox has built a best-in-class file sync and storage service.

## Getting started

Before we begin please make sure you have the Koding Package Manager (KPM) installed on your VM. Follow [this guide](http://learn.koding.com/kpm) to understand what KPM is and how to install it so you will be able to continue with this guide.

Also make sure you have an active Dropbox account (free or paid).

## Setup

Run the following command, in your Koding Terminal, to install the necessary dependency:

> type:alert
> If you already have Dropbox installed via KPM then you need to run `kpm uninstall dropbox` and then the below command to get the latest version.

```
kpm install dropbox
```

This will install the Dropbox daemon on your Koding VM, that will make the file sync possible.

After the install has finished you'll need to configure the daemon with your Dropbox account. In order to that you'll need to type this command:

```
dropboxd
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
The Dropbox deamon will sync files into the `~/Dropbox` folder. At this point, the Dropbox deamon is syncing all the files from your Dropbox account to your Koding VM. If you have a lot of files on your Dropbox account, this can quickly eat up the space on your VM so we recommend you configure "Selective Sync" as described below. To immediately stop the Dropbox deamon and cancel the download that is in progress, hit `Ctrl-c`.

> type:tip
> Whenever you turn on Koding VM you will have to run the `dropbox start` command to get dropbox started.

# Using the Dropbox selective sync feature
Selective sync allows you to specify which files from your Dropbox folder you would like to sync between your Koding VM and your Dropbox account.

To set up selective sync, follow these easy steps:
1. Download the Dropbox [command line instructions script](https://www.dropbox.com/download?dl=packages/dropbox.py) that Dropbox has created for this purpose.
2. Now all you need to do is add the folder that you wish to omit to the "do not sync" list. You can do that as follows:
```
/path/to/dropbox.py exclude add ~/Dropbox/path/to/folder/
```
Simply substitute the `/path/to/` above to the actual path to the Dropbox script you downloaded.

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
