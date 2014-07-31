---
author: Vinay Jain
username: vinayjain
date: 2014-07-29
description: 'Running Apache Tomcat On Koding'
categories: [Java]
---

# Apache Tomcat On Koding

In this guide we'll take a look on how to deploy Java Web Applications on [Apache Tomcat](http://tomcat.apache.org/) Server running on your [Koding](https://koding.com) Virtual Machine.

Since you are here I assume that you already know what Web Applications are and why do you need [Apache Tomcat](http://tomcat.apache.org/) to run those applications.

Tomcat doesn't come preinstalled with your VMs, so you need do download, install and configure Tomcat manually. Follow the steps below to get started :-

Go to the [Terminal](https://koding.com/Terminal), and download tomcat 7.0 using the `wget` command.
    
    
    wget http://apache.mirrors.hoobly.com/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz  
    
   
If the above link doesn't work, make sure you get the link from the tomcat's download page. 

Extract the downloaded file by typing :-
    
    
    tar -xvzf apache-tomcat-7.0.53.tar.gz
    

Rename the directory for easy access in future.
    
    
    mv apache-tomcat-7.0.53 tomcat
    

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

    `your_koding_domain:8084` , for me its `vinayjain.kd.io:8084`

Click on the manager app button and enter your username and password you set in tomcat-users.xml.

Congratulations, you have Apache Tomcat up and running on your Koding VM. Deploy the `.war` file of your Java app in tomcat and run it.