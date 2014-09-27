---
author: Team Koding
date: 2014-09-20
categories: [koding, domain]
---


<!--
# Koding and Domains

In this guide we'll go over some basic information about domains and 
Koding.
-->


# Custom Domains with your Koding VM

Koding VMs support custom domains as long as your DNS provider supports 
one of the following record types.

- CNAME Record
- A Record

To configure either of these record types, refer to your DNS providers 
guides and create the record type which you prefer. Once you have created 
it, find your [VM Address][vm address] on Koding, and paste in the full 
VM Address to the Record Value. This will point your Domain, to the 
Address that the host resolves to.



[vm address]: /faq/vm-address
