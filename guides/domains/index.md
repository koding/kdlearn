---
author: Team Koding
categories: [understanding vm, koding, domain]
---

# Custom Domains with your Koding VM

Koding VMs support custom domains (for free!) as long as your domain provider
supports one of the following record types.
- CNAME Record
- A Record

> type:tip
> These record types are the most common and should be supported by 100% of the 
> domain providers out there.

## Find your VM Address
First, you'll need to find and copy your [VM Address][vm hostname]. To
find this, please refer to [this guide][vm hostname] - it will look
something like the address below:

```
ulkk3a3a4bb3.joshmurray.koding.io
```

## Create Your Domain Record

Next, you'll need to create and configure either a **CNAME** Record, or
an **A Record** with your domain provider.

To configure either of these record types, refer to your provider's guides
and create the record of the type that you prefer.
> type:tip
> You can use either type. There's no difference from our end.

Once you have created the record on your domain registrar's panel, 
paste in the VM Address from above to the `Record Value`. This will 
point your Domain to the Address that the host resolves to.

## The Waiting Game
If the record you are creating is new, it should resolve very quickly. If
however, it is an older record you must wait for the global cache to expire.
This may take anywhere from 5 minutes to 24 hours.

If it has not been resolved after a day, ensure that you used the proper
VM Address *(as shown above)*. If it is correct, try contacting your
Domain Provider and ensure that they are able to use Addresses rather
than IPs in their record values.

## Can I use my VMs IP?
Our free VMs have rotating IPs which means that after your VM goes
offline, it is not guaranteed to boot up with the same IP. This means
that you **should not** use your VMs IP as the record value if you're
**not** using an Always-On VM.

If you have a paid Koding account and your VM is marked as `Always-On`, 
an IP should work, as long as your VM is not shutdown. For more information 
on Always-On VMs, see the [Pricing Page][pricing].

Once you are done pointing your domain to your VM, you can experiment with
pointing multiple domains to the same VM using as described in [this guide](http://learn.koding.com/guides/vhosts-and-subdomains/).a

[vm hostname]: /faq/vm-hostname
[pricing]: https://koding.com/Pricing
