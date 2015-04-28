---
title: Understanding file permissions
author: Team Koding
date: 2015-02-25
categories: [understanding vm, file permissions,koding]
template: page.toffee
---

# Understanding file permissions

Linux-based systems, Ubuntu beeing one of them, have a simple system for managing individual file permissions, The Unix concepts for file ownership and permissions are the main driving force behind Linux and it's security at the file system level.

This guide will cover the basics of file permissions and how you can modify them.

## Users and groups

Because Linux is a multi-user system we have two main types of users: system users and regular users. By default system users are used when the system requires running non-interactive and or background processes. On the other hand the regular users are used for everything else.

A Linux-based system also has a superuser or root user that has absolute power over the system including modifying file ownership and permissions.

Linux-based systems also have groups. A group is a collection of 0 or more users. Each user belongs by default to a group but can also be a part of multiple groups.

## Ownership and permissions

Each file, in a Linux-based system, belongs to a single user and a single group and has certain access permissions. You as a user can view the permissions of a file, using this command:

```
ls -l <the name of your file or all files in a directory>
```

Bellow is an example of what the command `ls -l /Web` outputs when you run it in your Koding VM Terminal.

| Mode         | Owner      | Group      | File size | Last modified | Filename   |
|--------------|------------|------------|-----------|---------------|------------|
| -rw-r--r-- 1 | jakemurray | jakemurray | 1252      | Feb 18 20:04  | index.html |
| drwxr-xr-x 1 | jakemurray | www-data   | 1414      | Feb 18 20:04  | perl    |
| -rw-r--r-- 1 | jakemurray | jakemurray | 1247      | Feb 18 20:04  | php.php    |
| -rwxr-xr-x 1 | root       | jakemurray | 1431      | Feb 18 20:04  | python.py  |
| -rwxr-xr-x 1 | jakemurray | jakemurray | 1574      | Feb 18 20:04  | ruby.rb    |

Looking at the Mode column you notice some letters. What do they mean?

The first letter in the Mode column represents the type of file. In Linux, there are two basic types of files: normal and special.

Linux-based systems permissions allow 3 things to be done to a file: read, write and execute.

* r (read) - a user can view the contents of the file.
* w (write) - a user can change the contents of the file.
* x (execute) - a user can execute or run the file if it is a program or script.

Every file can have defined 3 sets of people for whom you can specify permissions.

* owner - a single user who owns the file. (usually the person who created the file)
* group - every file belongs to a single group.
* other - everyone else who is not in the group or the owner.

## Changing file permissions

To change permissions on a file or directory you can use the `chmod` command.

```
chmod [permissions] [path]
```

The `chmod` command has permission arguments that are made up of 3 components.

* Who are you changing the permission for? - owner, group or other
* Are you granting or revoking the permission - indicated with either a plus ( + ) or a minus ( - )
* Which permission are you setting? - read ( r ), write ( w ) or execute ( x ).

Here is a quick example:

Grant execute permissions for the demo.html file for the entire group the file belongs to.

```
chmod g+x demo.html
```

You can also set permission on files or folders using the octal notation. By using this method, each permissions category (owner, group, and other) is represented by a number between 0 and 7.

Here is a quick example of usage of the octal notation:

```
chmod 751 demo.html
```

If you want to change the owner and group of a file or folder you can use the `chown` command.

The basic syntax for using `chown` to change owners and groups is:

```
chown [options] new_owner:new_group <name of file or folder>
```

For example, the following command would transfer the ownership and change the group of a file named demo1 to a new owner named demo and the www-data group:

```
chown demo:www-data demo1
```

> type:tip
> Note: The same principles also apply to folders

You should now be able to understand how ownership and permissions work in Linux.

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
