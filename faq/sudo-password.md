---
title: What is my sudo/root password?
importance: 5
---

To switch to the `root` user on your VM, simply type in:
```
sudo su
```

By default, there is no `sudo` password on your Koding VM. It is blank/empty.

So, if you want to use run a command as the root user, all you need to do is as follows:

```
sudo <command you wish to use>
```

When you hit enter, the sudo level command you wish to run without a password prompt.

If you wish to, you can add a sudo password yourself. To do this, change user to root by typing:
```
sudo su
```
and then create a password for the root user by typing:
```
passwd
```
You will be asked to type in the new password twice. Once done, the new password you picked is the password you will need to use when
using the `sudo` command from that point on.
