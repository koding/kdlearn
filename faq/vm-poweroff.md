---
title: How do turn off my my Koding VM?
importance: 5
---

To turn off your VM, simply type in `sudo poweroff` into a Terminal. This will start a graceful shutdown process for your VM and within a few minutes you will see the UI reflect the powered down state for your VM.

A `sudo shutdown` will shutdown (not power off) a VM...there's a difference. :)

And a `sudo reboot` will reboot your machine.  Here is an example of the output after you type in the command:
```
kodingvm: ~ $ sudo reboot
 
Broadcast message from kodingvm@kodingvm
kodingvm: ~ $     (/dev/pts/4) at 23:11 ...
 
The system is going down for reboot NOW!
```

Wating for a few minutes and then entering `CTRL-ALT-T` will yield a new terminal in your freshly rebooted machine.
