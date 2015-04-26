---
title: Are inactive accounts cleaned up?
importance: 5
---

### How does Koding ensure that the platform is scalable and performant for all users?
We perodically clean up VMs of inactive accounts to ensure that the dormat resources
allocated to these accounts are not a burden for the system. This ensures a "speedy"
Koding for everyone who uses it regularly.

> type:tip
> Inactive VMs are cleaned up but the account is not itself deleted. Paid account VMs
> are not a part of the cleanup process even if they are unused.

### The cleanup process
1. If a user has not logged into their account in over 21 days, we send them an email notification
requesting that they confirm their active status by simply logging back into their account.
2. However, if by the 27th day the user is still dormant/inactive, another email is sent but this
time with the notice that the inactive VM will be deleted (along with all the data inside it).
3. On day 30, the dormat VM is deleted permanently.

This type of cleanup is necessary because with hunderds of thousands of accounts,
we want to ensure that our regular users get the full benefit of the resources of the platform.

> type:tip
> Even though the VM is terminated, we still keep a record of any referral space you may
> have accumulated when you were an active user so if you return at any point in the future,
> you can reclaim the referral space.

Maintaining your account is simple, just log back in!
