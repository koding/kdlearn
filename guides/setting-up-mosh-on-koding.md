---
title: Setting up MOSH on Koding.io
author: Tushar Mathur
username: tusharmathur
categories: [koding, mosh]
template: page.toffee
---

Using a remote server for development is so much cooler for obvious reasons. Using MOSH on top of it naturally makes the experience much better.

###[Koding.com](https://koding.com) + [MOSH](https://mosh.mit.edu/#getting) = *Ecstasy*


Here is how you can get mosh to work on koding.com

1. SSH into the koding server from your client machine. If you haven't added ssh keys yet checkout their [tutorial](http://learn.koding.com/guides/ssh-into-your-vm/). 
    ```bash
    ssh <username>@<username>.koding.io
    ```

2. Setup [uncomplicated firewall](http://learn.koding.com/guides/enable-ufw/) in the remote machine.
    ```bash
    sudo apt-get install ufw
    sudo ufw status verbose
    sudo ufw enable
    ```

3. Open up critical ports first viz. HTTP, SSH and 56789 for koding.
    ```bash
    sudo ufw allow ssh
    sudo ufw allow http
    sudo ufw allow 56789/tcp
    ```

4. Open up the port (60001 is used by mosh in most cases) on the remote machine for the client machine to access it via udp.
    ```bash
    sudo ufw allow 60001/udp
    ```

5. Connect the remote machine by running the mosh command from the client machine. This will automatically ssh into the remote server and start the mosh-server.
    ```bash
    mosh <username>@<username>.koding.io
    ```

That's it, you are done.
