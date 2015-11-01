---

title: How to install Wildfly
author: Team Koding

categories: [frameworks platforms, java, jdk]

template: page.toffee

---

# Installing Wildfly 

[Wildlfy](http://wildfly.org/) is a full-featured application server that support the latest Java EE 7 standards.
In constrast to other Java application servers such as [Tomcat](http://tomcat.apache.org/) and [Jetty](http://www.eclipse.org/jetty/), 
Wildfly supports technologies such as EJB and JSF without further configuration.
It is the preferred server for many developers interested in using these technologies in an opensource platform that is also commercially supported. 

This guide shows you how to install the Wildfly application server in your Koding Machine.

> type:alert
> The installation of Wildfly requires 120MB of free disk space in your VM.
> You can check the amount of free space you have by using the command: `df -h` (check the filesystem mounted in `/`).
> If you need to free up space, follow [this guide](http://learn.koding.com/guides/freeing-up-space/).

## Prerequisites

To run Wildfly, you need Java installed in your Koding VM. 
By default, the Koding VMs include a OpenJDK installation that can be used.

You can check which Java version is installed using the `java` command:

```
java -version
```

> type:tip
> Some people prefer the Oracle JDK instead of OpenJDK. 
> You can install Oracle JDK using the [Koding Package Manager](http://learn.koding.com/guides/getting-started-kpm/):
> ```
> kpm install oracle-java7
> ```


## Installing Wildfly

The first step to install Wildfly is to download the software from the official [website](http://wildfly.org/downloads/).
There are many formats for the file (e.g. there are `.zip` and `.tar.gz` files).
Here we will use the `.tar.gz` file.

You can download the software directly into the `/opt` folder, the folder used to store optional packages and additional software.
After downloading the archive, you can extract the content directly in that folder.
You can use the following commands to download and extract the software:

```
cd /opt
sudo wget http://download.jboss.org/wildfly/9.0.2.Final/wildfly-9.0.2.Final.tar.gz 
sudo tar -xzvf wildfly-9.0.2.Final.tar.gz 
```

The Wildfly software must be now located at `/opt/wildfly-9.0.2.Final`. 
To simplify the access to that folder, you can create a symbolic link:

```
sudo ln -s /opt/wildfly-9.0.2.Final /opt/wildfly
```

> type:tip
> To free up disk space, after extracting the files, you can delete the downloaded archive:
> ```
> sudo rm /opt/wildfly-9.0.2.Final.tar.gz 
> ```

First, you can create a `wildlfy` user group and a `wildfly` user using the following commands:

```
sudo addgroup wildfly
sudo useradd -g wildfly wildfly
```

Then, you must change the ownership of the Wildfly folder to the `wildfly` user.

```
sudo chown -R wildfly:wildfly /opt/wildfly-9.0.2.Final
```


> type:tip
> In order to modify the Wildfly configuration files without using `sudo` all the time, you can add your Linux user to the `wildfly` group.
> For instance, if your username is *username*, you may add your user to the `wildfly` group with the following command:
> ```
> sudo usermod -a -G wildfly username
> ```


## Configuring Wildfly as an Ubuntu service

In Ubuntu Linux, services (servers) such as apache and sshd starts when the machine boots and are managed using commands such as `service`.
Wildfly includes an script that can be included in the Linux configuration to start and run the server in the same way.
You must copy that script into the `/etc/init.d` folder using the following commands:

```
sudo cp /opt/wildfly/bin/init.d/wildfly-init-debian.sh /etc/init.d/wildfly
sudo chown root:root /etc/init.d/wildfly
sudo chmod ug+x /etc/init.d/wildfly
```

Now you can start the wildfly server using `sudo service wildfly start`, stop wildfly `sudo service wildfly stop`, 
and determine the status of the server with `sudo service wildfly status`.

To enable Wildfly to start automatically when the server starts, you must add the server to the Linux run-levels.
There are some files that define which programs must run in each level of the operating system.
You may add the wildfly to the startup process using the following command:

```
sudo update-rc.d wildfly defaults
```

## Configuring remote access to Wildfly

By default, the Wildfly listen only to the localhost (i.e. it can be accessed only from the Koding VM).
To access Wildlfy from other machines (including your browser) you need to configure the server to listen to the other network interfaces in the machine.
You can change the wildfly configuration by editing the corresponding XML file.

```
sudo cd /opt/wildfly/standalone/configuration
sudo vi standalone.xml
```

You must change the `public` interface originally bounded to `127.0.0.1`...

```html
<interface name="public">
    <inet-address value="${jboss.bind.address:127.0.0.1}"/>
</interface>
```

to listen to any IP address. The resulting XML fragment must be:

```html
<interface name="public">
    <any-address/>
</interface>
```

After modifying the configuration, you must restart the Wildlfy server.

```
sudo service wildfly restart
```

If your username is *username*, you can access your Wildfly server using `http://username.koding.io:8080`.


## Configuring the Wildfly Administration Console

Wildfly includes an administration console that allows you to upload and monitor web applications.
This console is configured by default to listen only to the localhost.
If you want touse the console from other machines, you must create a management user and configure the `management` interface to listen to any address.

To access the administration console from other machines, you must update the `management` interface in the `/opt/wildfly/standalone/configuration/standalone.xml` file.
The following code must replace the configuration in the XML file:

```html
<interface name="management">
    <any-address/>
</interface>
```

After restarting Wildfly, the management console will be available at `http://username.koding.io:9990`

When you go to the management console, it may show you an error message or a login page.
To access the console you must add a *Management User* to Wildfly.
You must run the `add-user` program using the following command:

```
sudo /opt/wildfly/bin/add-user.sh 
```

Once you have created the management user, you can use it to enter to the console.


## Further information

Wildfly supports a lot of Java technologies. 
You can use it to create web applications and web services with different options for concerns such as security, clustering and high availability.
To learn more, you can check the official [technical guides](https://docs.jboss.org/author/display/WFLY10/Documentation), 
including the [administration guide](https://docs.jboss.org/author/display/WFLY10/Admin+Guide).


If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
