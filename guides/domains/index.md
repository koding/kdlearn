---
author: Team Koding
date: 2014-09-02
categories: [understanding vm, koding, domain]
---

# Custom Domains with your Koding VM

Koding VMs support custom domains as long as your domain provider
supports one of the following record types.

- CNAME Record
- A Record

## Find your VM Address

First, you'll need to find and copy your [VM Address][vm hostname]. To
find this, please refer to [this guide][vm hostname] - But it will look
something like the address below:

```
ulkk3a3a4bb3.joshmurray.koding.io
```

## Create Your Domain Record

Next, you'll need to create and configure either a **CNAME** Record, or
an **A Record** with your domain provider.

To configure either of these record types, refer to your providers guides
and create the record type which you prefer.

Once you have created it, paste in the VM Address from above to the
Record Value. This will point your Domain to the Address that the host
resolves to.

## The Waiting Game

If the record you are creating is new, it should resolve very quickly. If
however, it is an older record you must wait for the cache to expire.
This may take anywhere from 5 minutes to 24 hours.

If it has not been resolved after a day, ensure that you used the proper
VM Address *(as shown above)*. If it is correct, try contacting your
Domain Provider and ensure that they are able to use Addresses rather
than IPs in their record values.

## Can I use my VMs IP?

For technical reasons, free VMs have rotating IPs. After your VM goes
offline, it is not guaranteed to boot up with the same IP. This means
that you **should not** use your VMs IP as the record value if you're
**not** using an Always-On VM.

If however your VM is Always-On, an IP should work, as long as your VM is
not shutdown. For more information on Always-On VMs, see the [Pricing
Page][pricing].



[vm hostname]: /faq/vm-hostname
[pricing]: https://koding.com/Pricing
