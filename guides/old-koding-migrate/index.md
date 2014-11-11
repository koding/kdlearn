---
author: Team Koding
date: 2014-09-27
categories: [Git]
---

# Migrating Your Old Koding VM

Koding’s new VM infrastructure is vastly different from the old one so we 
did not want to take the risk of migrating your old VM for you 
as we could potentially end up causing more harm than good.  Each VM is 
unique and since you know your VM well so we thought it would be best for you to migrate 
the data yourself and do it at a time convient for you.

That being said, we still wanted to help as much as we can so we are providing 
you with a migration script that will assist you with data migration. This
script will copy the **home directory** of your old VM to the 
`/home/<username>/Backup/<old-vm-name>` folder of your new VM. *If you 
want to migrate files on your old vm that live outside the home directory,
you will need to move them into the home directory first.*

You can access your old VMs at https://old.koding.com

# Why not move all changed files?
Since the new VMs are running a newer version of Ubuntu, you will need to
re-install the server software that you may have installed yourself on
the old VM. If we copied over everything, it would cause a lot of confusion as
software versions would end up in conflict. You can retrieve a list of all manually
installed packages with this command:

```
aptitude search ~i | grep "^i   " | awk '{ print $2 }'
```

**Please note**, this script will simply copy files from the home directory
on the old vm to the `/home/<username>/Backup/<old-vm-name>` folder of the new
VM. It will not install software/scripts/init files anywhere on your new VM or start 
servers/services that were running on your old VM.

#Migration steps
## Step 1
Log into your new Koding account. At this point you will have, by default, 
one new VM. This is the VM into which we will bring data from your VMs on old Koding.

## Step 2
After the new VM has successfully started, you’ll see the IDE and Terminal.

![Migrate](migrate.png)

## Step 3
You will find the migrate script in the home folder of your new VM. To get started
, in the Terminal tab type the following command:

```
./migrate.sh
```

This command will start the migration process and will guide you on how 
to migrate data from old VMs. Note: You need run the above command for 
every old VM that you want to migrate.

And that’s it!

If you run into any kind of issues please let us know 
at [support@koding.com](mailto:support@koding.com) and we will gladly 
help.
