---
title: Sync files using Google Drive
author: Team Koding
date: 2014-07-08
categories: [koding]

template: page.toffee
---

# Sync files using Google Drive

This guide will cover how to get started with syncronizing your files that hosted on Google Drive.

You can install Google Drive on your [Koding](https://koding.com) VM by following these simple steps in your Terminal.

## Steps

First you need to install the `grive` app using the following command.

```
sudo apt-get install grive
```

After that you need to create a folder where the files will be synced

```
mkdir Drive
cd Drive
```

We need to softlink some dependencies for the `grive` app to work properly. Use the following command to achieve this.

```
sudo ln -s /usr/lib/libbfd-2.23.2-system.so /usr/lib/libbfd-2.23-system.so
```

The last step is to start the Google Drive app and authorize it with the Google services.

``` 
grive -a
```

Follow the provided link, get the authorization code and paste it back in the terminal.

Done! :)

Now you can sync you files using the command `grive` in the `Drive` folder you created.