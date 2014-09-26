---
author: Team Koding
date: 2014-09-27
categories: [Git]
---

# Migrating Your Old Koding VM

Koding’s new VM infrastructure is vastly different from the old one so we 
did not want to take the risk of migrating your old VM data for you 
because we could potentially end up causing more trouble.  Each VM is 
unique and you know it best so we wanted you to migrate the data 
yourself, when you wanted to do it. To access your old VMs, you can 
always log into <https://old.koding.com>.

That being said, we still wanted to help as much as we can so we have 
written a migration script that will assist you with the data migration.  
This script will copy the home directory and any updated/changed file 
across the VM file tree of your old VM to the `/home/<username>/Backup`
folder of your new VM.

**Please note**, this script will simply copy files into the 
`/home/<username>/Backup` folder. It will not install 
software/scripts/init files anywhere on your new VM or start 
servers/services that are running on your old VM. This is to ensure that 
we don’t accidentally overwrite files that you may need. You will need to 
re-configure your servers and re-initialize them on the new VM.

## Step 1

Log into your new Koding account. At this point you will have by default 
one new VM. This is the VM into which we will bring data from your 
existing VMs on old Koding.

## Step 2

After the VM has successfully started, you’ll see the IDE and Terminal.

![Migrate](migrate.png)

## Step 3

In the Terminal view type the following command.

```
./migrate.sh
```

This command will start the migration process and will guide you on how 
to migrate your data from the VM that you have on old Koding. You need 
run the above command for every VM that you want to migrate to new 
Koding.

And that’s it! Hopefully you migrated your old files to the brand new 
Koding interface. If you run into any kind of issues please let us know 
at [support@koding.com](mailto:support@koding.com) and we will gladly 
help.

If you need to log into your old VMs, head on over to 
<https://old.koding.com>. That server will remain active for another 30 
days.
