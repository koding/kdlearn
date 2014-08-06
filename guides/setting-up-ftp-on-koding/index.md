---
title: Setting up FTP on Koding
author: Team Koding
date: 2014-01-07
categories: [ftp]
---

# Setting up FTP on Koding

In this tutorial, i will go over how to get your FTP Client connected to your 
VMs FTP Server. In this guide, we are using 
[FileZilla](https://filezilla-project.org/) as the FTP Client.

**Reminder**: As with all of these tutorials, they assume that there are no 
conflicts. If you have previously attempted to install this software please 
remove it fully or understand that conflicts may occur. Thanks :)

## What you will need

In this tutorial you will need three things.

1. Your Koding username
2. Your Koding password
3. Your VM Number that you'd like to connect to. [Refer 
here](/faq/find-your-vm-number) for help.

## Steps for Installation

1. Install the PureFTPd apt-get package, by entering the following command: 
sudo apt-get install pure-ftpd

2. Enter your Koding password, which is your root password.

3. If a bunch of text whizzes by with no visible errors, Congratulations! You 
now have a working FTP server on this VM! Next up, we need to connect to our 
FTP Server with our FTP Client!To do this, we are going to open up FileZilla 
and press Ctrl-S, to open up our site manager. You can also open this by going 
to File -> Site Manager. When the Site Manager pops up, click the “New Site” 
button.

4. Now, the last step is to enter our PureFTPd information! Enter the following 
information into your New Site. 

  - Host: `ftp.koding.com`
  - Encryption: Use plain FTP Login
  - Type: Normal
  - User: `<username>@<vm-Number>.<username>.koding.kd.io`
  - Password: `<your koding password>`

  Replace `<username>` with your username, and `<vm-Number>` with your VM 
Number; So that `<vm-Number>` becomes _vm-0_, _vm-1_, etc.

  The *FTP* Username, when filled out, should look like 
`leeolayvar@vm-0.leeolayvar.koding.kd.io`. Make sure the end includes 
_koding.kd.io_, it is important.

  If you have any confusion about where to enter this information, please refer 
to the video or the image below.

  ![FTP Client Settings](ftpsettings.png)

## Confirming your Installation

Connecting to your FTP Server with your FTP Client is the easiest way to confirm it is working, but what if that fails? Is your Server running?

To find this out, run the following command: `ps aux | grep ftpd`. This will print the running processes that contain the text "ftpd". What you are looking for, is a line containing **"PURE-FTPD (SERVER)"**. If you see that, your server is running, and the problem is likely not your server.

## Additional Resources

  * [FileZilla](https://filezilla-project.org/)
  * [FileZilla Download](https://filezilla-project.org/download.php?type=client)
