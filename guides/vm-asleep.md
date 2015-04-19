---
title: Why is my VM asleep?
author: Team Koding
date: 2015-04-17
categories: [koding]

template: page.toffee
---

### Why does my VM appear as asleep when I visit it on a browser?

There are two main reasons for this:
1. The VM is actually off. :) If this is the case then all that needs
to be done is that the owner of the VM needs to turn the VM on. Details
on how to turn on your VM are available [here](http://learn.koding.com/guides/understanding-vm-panel/).
> type:tip
> If you have a free account, then your VM will automatically
> turn off after 60 minutes of inactivitiy on koding.com.
2. If your VM is on but you are still seeing the "VM is asleep" page, then
that means the global DNS propagation for your particular VM has not yet
completed. Global DNS propagation can take anywhere from 1 to 10 minutes
from the time you turn on your VM.
> type:tip
> For paid accounts, IP addresses don't change upon reboot so DNS propagation
> time is not a problem.

If you have tried the above and are still having issues, please [send us a note](mailto:support@koding.com)
 with the details and we'll be glad to help.
