---
title: How do turn off my my Koding VM?
importance: 5
---
To turn off your VM, we recommend that you use the power on/off toggle in the [VM settings modal](http://learn.koding.com/guides/understanding-vm-panel/). This ensures that all internal API calls are triggered and all Koding services are aware that you have powered down your VM.

> type:tip
> VMs for our free accounts automatically turn off after 60 minutes of inactivity on our IDE or Terminal
> so there's no need to manually turn the VM off.

That being said, sometimes you may need to restart your VM and want to do it via the Terminal. In such cases, simple type the following command in Terminal:
```
sudo reboot
```
you will see the following msg on your Terminal while the reboot command is processed and your VM restarts
```
connecting................
```
followed by
```
Failed to connect to terminal, click here to try again.
```
followed by
```
An unknown error occured, please open a new tab. Click here to dismiss this one.
```
both of the above messages, even though they look like errors are normal because a manual reboot has been requested.

We don't recommend using `sudo poweroff` or `sudo shutdown` to power down your VM as it will leave the associated sub-systems in an unknown state which may disrupt you from using your account. Use the settings panel to stop/turn off your VM.
