---
title: How to free up space on a VM
author: Team Koding
date: 2015-01-13
categories: [koding]
template: page.toffee
---

# How to free up space on a VM

This tutorial will cover some basic steps and some more advanced ones, that will help you clear some space on your VM.

## Basics

You can use the bellow command to delete downloaded packages (.deb) already installed and that you no longer need:

```
sudo apt-get clean
```

To remove all stored archives in your cache for packages that can not be downloaded anymore, thus packages that are no longer in the repository or that have a newer version in the repository, use this command:

```
sudo apt-get autoclean
```

To remove unnecessary packages, after uninstalling an app there could be packages you don't need anymore this command will do just that.

```
sudo apt-get autoremove
```

## Advanced

Check for the the top 10 biggest subfolders in the current folder using this command:

```
du -sk * | sort -nr | head -10
```

You can also check to see if you have old kernels that require deletion:

```
ls -lh /boot
```

Use the bellow command to get a list of all installed packages, sorted by size. If you see something big and you're not using it uninstall it.

```
dpkg-query -W --showformat='${Installed-Size} ${Package}\n' | sort -nr | less
```

You can clean unused language files with translations using the `localepurge` tool:

```
sudo apt-get install localepurge
```

Check for unused content here `/var/tmp/` using this command:

```
du -sh /var/tmp/
```

If you wan to search for big files the bellow commands will help you do that:

```
find / -type f -size +1024k
```

or

```
find / -size +50000  -exec ls -lahg {} \;
```

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).