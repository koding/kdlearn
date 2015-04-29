---
author: Vinay Jain
username: vinayjain
title: Apache Tomcat on Koding
description: 'Running Apache Tomcat On Koding'
categories: [frameworks platforms, Java]
---

# Apache Tomcat On Koding

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Tomcat using just one command:

```
kpm install tomcat
```

***

In this guide we'll take a look on how to deploy Java Web Applications on [Apache Tomcat](http://tomcat.apache.org/) Server running on your [Koding](https://koding.com) Virtual Machine.

Since you are here we assume that you already know what Web Applications are and why do you need [Apache Tomcat](http://tomcat.apache.org/) to run those applications.

> type:alert
> Tomcat doesn't come preinstalled with your VM, so you need do download, install and configure Tomcat manually.

Follow the steps below to get started:

Head over to your VM [Terminal](https://koding.com/Terminal), and download Apache Tomcat 7.0 using the `wget` command.

```
wget http://apache.mirrors.hoobly.com/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz
```

If the above link doesn't work, make sure you get the link from Tomcat's official download page.

Extract the downloaded file by typing:

```
tar -xvzf apache-tomcat-7*
```

Rename the directory for easy access in future.

```
mv apache-tomcat-7.0.55 tomcat
```

Now we need to set role and password in `tomcat-users.xml`. Use the command below to edit the tomcat-user.xml file.

```
nano apache/conf/tomcat-users.xml
```

Add this line just above `</tomcat-users>`

```
<user name="CHOOSE A USERNAME" password="INSERT A PASSWORD HERE" roles="admin-gui,manager-gui" />
```

> type:alert
> Make sure you replace the `CHOOSE A USERNAME` and `INSERT A PASSWORD HERE` with a desired username and password.

Since you already have the Apache server running on your VM on port 80, you must specify another running port for Apache Tomcat. So we will edit the server.xml file now. Use the command below to open it using `nano`.

```
nano apache/conf/server.xml
```

Find this line

```
<Connector port="8080" protocol="HTTP/1.1" ....>
```

Change the port number to `8084`.

Everything is setup now. It's time to run Apache Tomcat. Use the bellow command to achieve this.

```
bash tomcat/bin/startup.sh
```

If you see the `Tomcat Started` message, you can now follow a similar url as the bellow one:

```
http://KODING_USERNAME.koding.io:8084
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

Click on the manager app button and enter your username and password you set in `tomcat-users.xml`.

Deploy the `.war` file of your Java app to Apache Tomcat and run it.

And that's it.

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com)
