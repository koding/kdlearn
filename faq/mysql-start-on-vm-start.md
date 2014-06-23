---
title: How Can I Make MySQL Start When My VM Starts?
importance: 10
---

MySQL comes installed by default on all Koding VMs, but it does not start by 
automatically when the VM boots. To have it start on VM boot, run the following 
command in your [Terminal](https://koding.com/Terminal):

```
sudo rm /etc/init/mysql.override
```

You may still need to start MySQL by hand, the first time. To start MySQL, run 
the following command:

```
sudo service mysql start
```
