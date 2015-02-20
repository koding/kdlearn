---
author: Vinay Jain
username: vinayjain
date: 2014-07-29
description: 'Running Apache Tomcat On Koding'
categories: [Java]
---

# Apache Tomcat On Koding

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Tomcat using just one command:

```
kpm install tomcat
```

#Make the setup below

Create this links:
```
curl -sSL learn.koding.com/kpm.sh | sh
kpm install tomcat
ln -s /etc/tomcat7 usrtomcat
ls -l
ln -s /usr/share/tomcat7 tomcat
ls -l
sudo mkdir tomcat/temp
sudo mkdir tomcat/logs

```
Edit the users at tomcat server:
```
cd usrtomcat
sudo nano tomcat-users.xml  
```
Replace the file to look like below:
```
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
<role rolename="admin"/>
<role rolename="manager"/>
<role rolename="role1"/>
<role rolename="manager-gui"/>
<role rolename="admin-gui"/>
<role rolename="manager-status"/>
<user username="tomcat" password="tomcat" roles="admin,manager,admin-gui,manager-gui,manager-status,role1" />
</tomcat-users>
```
Edit server config at:
```
sudo nano server.xml
```
Edit the file to fit the port to 8084 in the node like below:
```
<Connector port="8084" protocol="HTTP/1.1"                                                                                   
               connectionTimeout="20000"                                                                                         
               URIEncoding="UTF-8"
               redirectPort="8443" />
```
At last execute:
```
sudo bash tomcat/bin/startup.sh
```
Access: 
http://your_koding_domain.koding.io:8084/manager/html/list

more information in:
http://tomcat.apache.org/tomcat-7.0-doc/manager-howto.html

***

In this guide we'll take a look on how to deploy Java Web Applications on [Apache Tomcat](http://tomcat.apache.org/) Server running on your [Koding](https://koding.com) Virtual Machine.

Since you are here I assume that you already know what Web Applications are and why do you need [Apache Tomcat](http://tomcat.apache.org/) to run those applications.

Tomcat doesn't come preinstalled with your VMs, so you need do download, install and configure Tomcat manually. Follow the steps below to get started :-

Go to the [Terminal](https://koding.com/Terminal), and download tomcat 7.0 using the `wget` command.
    
    
    wget http://apache.mirrors.hoobly.com/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz  
    
   
If the above link doesn't work, make sure you get the link from the tomcat's download page. 

Extract the downloaded file by typing :-
    
    
    tar -xvzf apache-tomcat-7*
    

Rename the directory for easy access in future.
    
    
    mv apache-tomcat-7.0.55 tomcat
    

Now we need to set role and password in `tomcat-users.xml` . Use the command below to edit the tomcat-user.xml.
    
    
    nano apache/conf/tomcat-users.xml
    
    
Add these lines just above `</tomcat-users>`
	
	
	<user name="anyusername" password="anypassword" roles="admin-gui,manager-gui" />
		
	
Since we have apache server (for PHP) running on our VM on port 80, we must specify another running port for tomcat. So we will edit  server.xml file now. Use the command below to open it in nano.

	
	nano apache/conf/server.xml
	
	
Find this line
	
	
	<Connector port="8080" protocol="HTTP/1.1" ....>
		
    
Change the port number to 8084
    
Everything is setup now. Its time to run tomcat.
	
	
	bash tomcat/bin/startup.sh
		

If you see `Tomcat Started` message, you can now open the localhost by typing in the address bar :-

    `your_koding_domain:8084` , for me its 
`hostname.vinayjain.koding.io:8084`

Click on the manager app button and enter your username and password you set in tomcat-users.xml.

Congratulations, you have Apache Tomcat up and running on your Koding VM. Deploy the `.war` file of your Java app in tomcat and run it.
