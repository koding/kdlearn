---
title: What is my VM Hostname/Address/Domain Name?
importance: 5
---

The system assigned name for your VM is available on top of the VM settings panel under the label: *Assigned URL*.
This is not editable.

We realize that most users will probably run into trouble trying to remember our creatively designed VM names 
(sorry, we had to make sure they were unique) so Koding VMs can also very easily be assigned a username based 
namespace (username.koding.io). This makes it easy to remember the domain name for your VM since it is your 
username! (Note: You can still reach the VM by using the system assigned name as described above.)

To assign your username based domain to a VM, follow these 2 easy steps:
1. open the VM settings panel and click on "More" to reveal the domain settings (as
shown in the image below)
2. toggle the switch next to your personal namespace to enable it for this VM. (Note: If you have more than one VM, you will be able to reassign the same namespace on other VM settings panels but only one VM can have the namespace applied to it at any given time.)
![Personal namespace](/faq/vm-hostname/first.png)

In addition to this, Koding also allows you to create sub-domains
so that if you want to configure your apache/nginx web server to serve multiple 
virtual hosts, it's easy to assign them all their own unique sub-domains. [Read more about virtual hosts.](http://www.rackspace.com/knowledge_center/article/how-to-serve-multiple-domains-using-virtual-hosts)

To use this feature, head back to the VM settings panel and follow these 3 easy steps:

1. click the (+) icon next to the "Domains" label to open up an input box where you can type in a new sub-domain. All you need to provide is the sub-domain, we will add the .username.koding.io part automatically.
![Add subdomain](/faq/vm-hostname/second.png)
2. once added, these sub-domains become available on the setting panels 
of all your VMs for easy reassignment
3. deleting a sub-domain is as easy as adding one!
![Remove subdomain](/faq/vm-hostname/third.png)
