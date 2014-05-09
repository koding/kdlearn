---
title: Is Koding a production host
importance: 2
template: page.toffee
---

Koding is first and foremost a Development Environment, and not a Production 
Host. All features have been tailored with this in mind and evidence of this is 
reflected in all of the features you see implemented. Lets highlight some of 
these items.

### VMs Shutdown After Logout

Approximately 60 minutes after you log out, your Free VMs will shut down. Why?  
Koding‘s development focus is not centered around hosting your blog/site.  
Koding is here to enable you and to help you make great things. Attempting to 
be yet another host in a sea of perfectly capable production hosts won’t help 
achieve that goal.

Another benefit of this system, is that it helps avoid security concerns that 
collectively harm us all. There are plenty of users out there who have used 
Koding to host dangerous applications. Phishing, scamming, spamming, all of it. 
This directly harms all of us, by giving Koding a bad name, wasting resources, 
and hindering a service that we are trying to be productive with. It's no 
surprise that restrictions need to be put in place to inhibit this behavior, 
for the benefit of everyone.

**Note:** In the future Paid Always-On VMs will be an option. This is currently 
not available though.

### CPU Bursts vs Sustained

Koding wants to help you get work done, and get work done fast. Things like 
compilers have a lot to compute, but in short sporadic bursts.  
Koding's CPUallocation has been tailored with this in mind. It wants you to 
compute what you need, as soon as possible. It is not tailored for a long 
running process that expect heavy and consistent usage, such as a 
Minecraft server.

### Raw Ubuntu OS

These days a lot of hosting platforms are heavily optimized for their specific 
niche(s). They streamline the process of hosting your language or application 
style of choice, which gives you added stability and performance gains.  
Examples of this are the plethora of Apache-PHP hosts, Nodejitsu, Google App 
Engine, Heroku, AppFog, and a nearly limitless amount of others.

Why is this? Well, production hosting is hard, and there are obvious benefits 
to letting someone else do it. The idea of uploading your php site to a 
standard php host is easy. The idea of buying a dedicated server, setting up 
Apache, firewalls, updates, etc, just seems a bit crazy in comparison. On top 
of that, what about load balancing and CDNs? Doing it all yourself can be hard.

Well, Koding gives you that raw machine. It‘s not trying to make production 
hosting for you, but rather it’s giving you a completely open and powerful 
environment to _make stuff_! So by all means _make_ your Wordpress blog on 
Koding, and if you really want to host it on Koding wait a while and buy an 
Always-On VM. Just be aware of the design goals.
