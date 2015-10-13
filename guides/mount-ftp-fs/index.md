---
title: How to mount a remote FTP server as a local directory?
author: Team Koding
categories: [developer tools, file sync, ftp, file transfer]
template: page.toffee
---

Many times you have your code and other relevant files on another server
and need to keep them there but still want to work on them. The easiest
way to achieve this is to mount the remote system as a local directory
on your Koding VM so that you can work on the files as if they were on
your Koding VM.

This guide walks you through the process of installing the required 
software on your Koding VM. We will use an application called `curlftpfs`.

You will also need:
1. IP address/domain name of the remote ftp server
2. ftp username and password for the remote server

### Installing the required application
To install curlftpfs on your Koding VM, use the following command in Terminal:
```
sudo apt-get update
sudo apt-get install curlftpfs
```

### Configuring your VM
Once installation is done, you will need to select a local folder on your VM
that will be the "mount point" for the remote server. As an exmaple, we will
create a new folder called `remote-ftp` in the VM's `/mnt` directory. If you already know
which folder you wan to use, you can skip these steps:

```
sudo mkdir /mnt/remote-ftp
```

### Making the connection
To initiate a connection, use the following command:
```
sudo curlftpfs ftp.yourserver.com /mnt/remote-ftp -o user=ftp-username:ftp-password,allow_other
```

Note: the `allow_other ` option above will allow the non-root user on your VM to also access
the files available via this mount method.

> type:alert
> Do not add space after the comma or the allow_other argument will not be recognized.

That should do it. Now if you navigate to the `/mnt/remote-ftp` directory and pull up a file
list, the list of files should be from the remote server.

> type:tip
> Even if the files in `/mnt/remote-ftp` are "owned" by the `root` user, any other user should
> still be able to operate on the files because we used the `allow_other` option when we set
> up the connection.
