---
title: How to install pgcli
author: Team Koding
categories: [python]
template: page.toffee
---

# How to install pgcli

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install pgcli using just one command:

```
kpm install pgcli
```

***

Pgcli is a command line interface for Postgres with auto-completion and syntax highlighting.

## Getting started

Before you can start the pgcli install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

After that make sure you have the Python package manager or `pip` installed.

First check if `pip` is installed on the system.

```
which pip
```

If the above command returns an error, then you do not have pip installed on your VM. You can install it using this command.

```
sudo apt-get install python-pip
```

> type:alert
> Make sure you also have Python installed on your VM before you can install pip.

## Installing

Pgcli uses `psycopg` to talk to the postgres database. In order to install `psycopg`, you will need `libpq` and `python-dev` installed on your VM. Use the bellow command to achieve this.

```
sudo apt-get install libpq-dev python-dev
```

Now you can go ahead and install pgcli. You can use this command.

```
sudo pip install pgcli
```

And that's it!

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).