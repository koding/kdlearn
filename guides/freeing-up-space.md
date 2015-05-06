---
title: How to free up space on a Koding VM
author: Team Koding
categories: [common questions, koding]
template: page.toffee
---

# How to free up space on a Koding VM

This tutorial will cover some basic steps and advanced that will help you clear space on your VM by deleting software packages that you don't need or use.

## Basics

Use the command below to delete downloaded packages (.deb) already installed and that you no longer need:

```
sudo apt-get clean
```

Use this command to remove all stored archives in your cache for packages that can not be downloaded anymore (since the packages are no longer in the repository or they have a new version in the repo).

```
sudo apt-get autoclean
```

Some apps leave behind remnant files even after you uninstall them. This command will clean up those orphaned files.

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

That should give you plenty to consider for deletion and once you are done deleting, hopefully you can recover storage space on your VM.

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
