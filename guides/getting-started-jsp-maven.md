---
author: Gregory Mihalik
username: gmihalik
date: 2015-01-15
description: 'Getting Started with JSP and Maven'
categories: [Java]
---

# Getting Started with JSP and Maven on Koding

In this guide we'll take a look on how to set up and deploy a JavaServer Pages website using Maven and Tomcat on your Koding VM. 
This tutorial assumes you have [updated your OS](http://learn.koding.com/guides/upgrading-your-vm/) and 
set up an [Apache Tomcat Server](http://tomcat.apache.org/) by following this [tutorial] (http://learn.koding.com/guides/apache-tomcat-on-koding/).

## What is JSP

JavaServer Pages (JSP) is used to create dynamic web pages of HTML or XML. 
JSP is known for its rapid development and ease of maintenance. JSP seperates the UI of an application from
content generation, which allows designers and developers to work together without changes affecting eachother. 

## What is Maven

Maven is a software project management tool based on the concept of a Project Object Model (POM) that can be used for building and managing any java-based project. 
By using a POM, Maven is able to manage a projects build, reporting, and documentation from a central piece of information.

## Installing Maven

First check and see if you have Maven installed with the following:
```
mvn -v
```

If you have a new VM then chances are you do not have Maven installed. To install the latest version type the following:
```
sudo apt-get install maven
```
Next navigate the directories into your Apache Tomcat server to the webapps folder.
```
cd Documents/tomcat/webapps
```

Now we will create a Maven project using the Maven project generator with the following command. 
Choose your GroupId.
the artifactId is your project name.
the archetypeArtifactId is the type of project that Maven will create. Use "maven-archetype-webapp" to create a web app.
```
mvn archetype:generate -DgroupId=com.mihalik -DartifactId=mywebapp -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
```
mvn archetype:generate -DgroupId=com.mihalik -DartifactId=mywebapp -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false     

Move into the project folder:
```
cd mywebapp
```

Use the Maven command to package the project which will install dependies and prepare the project.
```
mvn package
```

Use the Maven command tomcat:run in order to run 
```
mvn tomcat:run
```

In your browser type in the following URL to point to your webapp.
```
http://[hostname].[username].koding.io:8080/[web-app-name]/
```

If everything worked correctly you should see "Hello world". If you did, Congrats! You have setup and deployed your first web app using JSP and Maven.
If you did not, please review the instructions and see if you missed anything.

To further understand the structure of your Maven/JSP project, navigate to 
```
cd Documents/tomcat/webapps/mywebapp/src/main/webapp/resources/index.jsp
```
on the tomcat webserver.

In this file you will see basic HTML markup with the message "Hello World!". 
You can change this message and refresh your webpage in your browser and see the changes you made.

Now lets add some JSP to this file.
