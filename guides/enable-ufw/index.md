---
title: Making your VM secure using Ubuntu UFW (Uncomplicated Firewall)
author: Team Koding
date: 2015-01-08
categories: [koding]
template: page.toffee
---

# Securing your VM using the built-in (and pre-installed) Ubuntu UFW
_(Note: you should follow the steps in this guide to its entirety otherwise if you enable the firewall and don't finish
adding key services like ssh, you may be locked out of your VM. Please proceed with caution.)_

From time to time, a need may arise when you need to secure your Koding VM from prying eyes. There are several solutions
available when it comes to enabling a firewall on Ubuntu (the operating system that runs on a Koding VM) and you are free
to try any/all of those. For the purposes of this guide, we will focus on the ufw firewall software that is already
installed by default on all Koding VMs.

UFW stands for "Uncomplicated Firewall" and is essentially a wrapper around the more complicated iptables firewall. It 
was built to provide an easy interface that is more usable for most users as compared to the more complicated interface that
comes with iptables.

## Checking the state of ufw on your VM
ufw should be pre-installed on your VM and you can easily check that by typing the following command in Terminal:
```
sudo ufw status
```
you should see the following result (in most cases):
```
Status: inactive
```
If for some reason, ufw is not installed on your VM, you can easily install it by using the following command:
```
sudo apt-get install ufw
```

To view a list of the current active rules, use the following command:
```
sudo ufw status verbose
```
you may see something like:
```
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing)
New profiles: skip
```

## Enable ufw
Type in this command to turn on the firewall
```
sudo ufw enable
```
Please follow the steps in the next section immediately as by default every incoming connection is denied and
if we don't add some specific rules quickly, you may get locked out of your own VM... yikes!

## Adding rules to ensure that your Koding VM works just fine even with ufw enabled.
Since you are using Koding via a browser, there are services running on your VM that the Koding application
needs to talk to. When you enable the firewall, you essentially are cutting off access to these services so 
it is VERY IMPORTANT that you enable the services below as soon as you turn on the firewall.

Type in this command to enable ssh access through the firewall
```
sudo ufw allow ssh

```

Now, enable ports needed for Koding
```
sudo ufw allow http
```

and then add a rule for a specific port that Koding requires
```
sudo ufw allow 56789/tcp
```

## Allowing access to specific standard services.
ufw already knows what to do for standard services like ftp, http, ssh, telnet, etc. so if you want to enable
any of these services, simply type in:
```
sudo ufw enable ftp
```

similarly, do deny a standard service, do:
```
sudo ufw deny ftp
```

## Adding rules for specific ports
Sometimes, you may have a non-standard port that you want to allow access to, you can achieve that by typing in:
```
sudo ufw allow 2290:2300/tcp
```
where 2290:2300 represents the port range you want to allow access to. Please note that you will need to replace
tcp with udp if you wish to allow access to both tcp and udp ports within that range.

## Adding a specific IP address
As you saw, you can add rules for specific ports and so similarly, you can also add rules for specific IP addresses.
```
sudo ufw allow from 192.168.0.0
```

you can also combine ports and IP addresses to create specific rules:
```
sudo ufw allow from 192.168.0.101 proto tcp to any port 22
```
Syntax to create deny rule is similar with allow rule. You only need to change parameter from allow to deny.

## Deleting a rule
First, get a numbered list of all rules:
```
sudo ufw status numbered
```
You may see something like:
```
Status: active
 
     To                         Action      From
     --                         ------      ----
[ 1] 22                         ALLOW IN    Anywhere
[ 2] 80                         ALLOW IN    Anywhere
[ 3] 56789/tcp                  ALLOW IN    Anywhere
[ 4] 22 (v6)                    ALLOW IN    Anywhere (v6)
[ 5] 80 (v6)                    ALLOW IN    Anywhere (v6)
[ 6] 56789/tcp (v6)             ALLOW IN    Anywhere (v6)
 
```
Now, simply use the number next to the rule you wish to delete and replace it in the command below:
```
sudo ufw delete 4
```

## Resetting back to original state
This is helpful when you want to delete/reset all rules.
```
sudo ufw reset
```
you will get a confirmation:
```
Resetting all rules to installed defaults. Proceed with operation (y|n)? y
```
When you hit "y" ufw will backup all existing rules before doing the reset. Resetting the rules will also disable your firewall. 

## Help, I locked myself out of my VM
If for some reason you enabled your firewall and did not take the steps needed to open up the ports needed for Koding to work, then
your only recourse is to reinit your VM. That process is described in [this guide](http://learn.koding.com/faq/vm-reinit/). If you 
encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
