---
author: Team Koding
date: 2014-09-27
categories: [Git]
---

# Migrating Your Old Koding VM

Koding’s new VM infrastructure is vastly different from the old one so we 
did not want to take the risk of migrating your old VM data for you 
because we could potentially end up causing more harm than good.  Each VM is 
unique and you know it best so we thought it would be best for you to migrate your data 
and at a time when it was convient for you.

That being said, we still wanted to help as much as we can so are providing you with a migration script that will assist you with the data migration. This script will copy the home directory and any updated file 
across the entire VM file tree of your old VM to the `/home/<username>/Backup/<old-vm-name>`
folder of your new VM.

**Please note**, this script will simply copy files into the 
`//home/<username>/Backup/<old-vm-name>` folder. It will not install 
software/scripts/init files anywhere on your new VM or start 
servers/services that were running on your old VM. This is to ensure that 
we don’t accidentally overwrite files that you may need as the new VMs are running
a newer version of Ubuntu. You will need to re-configure your servers and re-initialize them on the new VM.
If you run into any issues, we are here to help. Just send us the details at 
[support@koding.com](mailto:support@koding.com).

#Migration steps
## Step 1
Log into your new Koding account. At this point you will have, by default, 
one new VM. This is the VM into which we will bring data from your VMs on old Koding.

## Step 2
After the new VM has successfully started, you’ll see the IDE and Terminal.

![Migrate](migrate.png)

## Step 3
You will find the migrate script in the home folder of your new VM. To get started
, in the Terminal tab type the following command.

```
./migrate.sh
```

This command will start the migration process and will guide you on how 
to migrate data from old VMs. Note: You need run the above command for 
every old VM that you want to migrate.

And that’s it!

If you run into any kind of issues please let us know 
at [support@koding.com](mailto:support@koding.com) and we will gladly 
help. If you need to log into your old VMs, head on over to 
<https://old.koding.com>. That server will remain active for another 30 
days.
