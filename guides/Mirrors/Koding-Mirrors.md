---
author: Dinesh Auti
username: dineshauti
date: 2014-08-13
description: 'How to change the default Mirrors in Koding'
categories: [Koding]
---

Welcome!!!

In this tutorial I am going to show you how to change the default Koding Mirrors with the Ubuntu Mirrors.

Why is this required ?

When you try to downlaod the 32-bit libraries that are required to run 32-bit apps on Koding, you will probably face an error saying that the packages are not available. In this situation you can change the default Koding Mirrors with the Ubuntu Mirrors. This will allow you to download the packages. This is one possible reason, there may be many more ...

*NOTE : Here I am assuming that you have Ubuntu installed on your Home PC or laptop.*

### 1. Get the Default Ubuntu Mirrors

Navigate to the sources.list on your PC or Laptop and copy it’s content

```
sudo nano /etc/apt/sources.list
```
This will open the sources.list in a editor

### 2. Replace Koding’s Default Mirror

Now login into Koding’s terminal. Navigate to sources.list. Comment out the default Mirror’s (So that you can revert back). Paste the content that we copied in step 1. Press Ctrl + X. Say yes .. by pressing Y. & then press Enter.

```
sudo nano /etc/apt/sources.list
```

###  3. Update

Enter the following command

```
sudo apt-get update
```
That’s it you are ready to go.

Enjoy :-)