---
title: Understanding the VM settings panel
author: Team Koding
date: 2014-11-03
categories: [koding features, koding]
template: page.toffee
---

# Understanding the VM settings panel

This guide will explain the basics of the VM settings panel.

![VM Panel 1](uvms2.png)

In order to open the VM settings panel you need to hover over the VM name on the right side of Koding (in the sidebar at the top) and then click on the little three points icon on the right, as picture above.

![VM Panel 2](uvms1.png)

After you click on the icon mentioned above the VM modal should open, which should look like the one pictured above.

The VM settings panel has three main sections: the Basic section, the More section and the Advanced section.

## Basic section

The basic section includes basic information about your VM and some basic functionality over it. Each line is explained below.

* Assigned URL: This is the long assigned URL of your Koding VM.
* Nickname: You can rename your VM and this will update the name that appears in the right sidebar.
* On/Off toggle: The current status of the VM. You can also turn off your VM from here, though we don't recommend it.
* Disk usage: How much space you have used of your VMs available space.
* Public IP: Your VM's public IP. This will change every time you start up your VM. For users on the Free plan, this will change each time you start up your VM. If your VM is Always-On, it will only change when you restart your VM.
* Specs: Specifications your VM has. This is based on your current plan.
* Provider: Your VM provider. In the future you will be able to choose from multiple providers.
* Guides: The most common and useful guides to get you started using your VM.

## More section

The more section includes some additional settings for your VM. Each setting has been explained below.

* Keep VM always on toggle: If you are a paying customer than you can chose to keep your VM Always-On. This means that your VM will not be shut down automatically after 60 minutes.
* Domains: You can enable a [short URL for your VM](http://learn.koding.com/faq/vm-hostname/) and/or [define subdomains](http://learn.koding.com/faq/vm-hostname/) and [custom domains for your VM](http://learn.koding.com/guides/domains/).

## Advanced section

The advanced section includes settings that only advanced users should use. If you are an unexperienced user then this section should be off limits.

* Reinitialize VM: This button will set your VM back to its default state. This means that the VM will be re-imaged, as if you deleted the VM and created a new one. [This guide](/faq/vm-reinit/) explains the reinit function in more detail.
* Resize VM: If you just upgraded to a paid plan you can choose to assign the necessary space.
* Terminate VM: If you're a paying customer you can remove your VM and create a new one if you so choose.

If you encounter any issues or have any questions regarding the VM settings panel you can email us at [support@koding.com](mailto:support@koding.com) and we'll gladly help.
