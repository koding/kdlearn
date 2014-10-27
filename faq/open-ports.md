---
title: What ports are open on my Koding VM?
importance: 5
---

Most Unix ports are available on Koding VMs. We do not block any TCP traffic
(inbound or outbound). See the following list for 
open ports, as well as ports in use by default.

- Ports **2** through **65,534** are open.
- Port **80** is taken by Apache, but this be turned off to free the port. To turn
  off Apache, type in: `sudo service apache2 stop` in Terminal.
- Ports **2** through **1,024** require `sudo` access.

