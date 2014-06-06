---
title: MySQL on Koding
author: Koding Community
date: 2013-11-30
categories: [koding, mysql]

template: page.toffee
---

# MySQL on Koding

MySQL comes preinstalled with all Koding VMs, and can be logged into by typing the following command into your [Koding Terminal](http://koding.com/Terminal)
    
    
    mysql -uroot

You should note that the `-p` flag is not included in that command. That is because there is no root user password by default. You can assign a password with the following command:
    
    
    mysqladmin -u root password NEWPASSWORD

When entering MySQL login details into your applications, make sure you log in from localhost, not your VM Hostname.

## Troubleshooting

**MySQL Socket Error**

If you receive a socket error with the above commands, your MySQL Server is not running. To start it, type the following command:
    
    
    sudo service mysql start
