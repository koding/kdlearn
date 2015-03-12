---
title: Sync files using Google Drive
author: Team Koding
date: 2014-07-08
categories: [koding,file sync,google drive, file transfer]

template: page.toffee
---

# Sync files using Google Drive

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and start synchronizing your files using Google Drive with just one command:

```
kpm install gdrive
```

***

This guide will cover how to get started with synchronizing your files that are hosted on your Google Drive account (works
with both personal and business Google Apps accounts).

You can install Google Drive on your [Koding](https://koding.com) VM by following these simple steps in [Terminal](https://koding.com/Terminal).

## Steps
To achieve the sync, we will use an app called [grive](http://www.lbreda.com/grive/) so first you need to install the `grive` app using the following command:

```
sudo apt-get install grive
```

After that you need to create a folder where the Google Drive folders and files will be synced.

```
mkdir GDrive
cd GDrive
```

We need to soft-link some dependencies for the `grive` app to work properly. Use the following command to achieve this.

```
sudo ln -s /usr/lib/libbfd-2.23.2-system.so /usr/lib/libbfd-2.23-system.so
```

The last step is to start the Google Drive app and authorize it with the Google services.

```
grive -a
```

Cut and paste the link that the grive app shows you into a new browser tab/window to get an authorization code.
Once you have an auth code, paste it back in the Terminal window to continue the installation process.

Now you can sync you files using the command `grive` in the `GDrive` folder you created.

**Note 1:** The app does not run in the background automatically continuously doing a sync. In order to achieve that, you can set up a cron job on your VM that runs every x seconds/minutes/hours depending on your preference. To learn more about cron, open up a new Terminal tab and type in:

```
man cron
```

** Note 2:** As per the author of grive, the application will not download any files that are the traditional Google Docs (Spreadsheet, Documents,Presentations, etc.). The app will only automatically upload/download any non-native Google Doc formats which include code files, text files, images, etc.
