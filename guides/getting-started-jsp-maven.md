---
author: Gregory Mihalik
username: gmihalik
description: 'Getting Started with JSP and Maven'
categories: [frameworks platforms, Java]
---

# Getting Started with JSP and Maven

In this guide we'll take a look on how to set up and deploy a JavaServer Pages (JSP) website using Maven and Tomcat on your Koding VM. 
This tutorial assumes you have [updated your OS](http://learn.koding.com/guides/upgrading-your-vm/) and 
set up an [Apache Tomcat Server](http://tomcat.apache.org/) by following this [tutorial](http://learn.koding.com/guides/apache-tomcat-on-koding/).

## What is JSP

JavaServer Pages (JSP) are used to create dynamic web pages of HTML or XML by using embedded Java and/or Java backend. 
JSP is known for its rapid development and ease of maintenance. JSP separates the UI of an application from
content generation, which allows designers and developers to work together without changes affecting each other. JSP covers the "V" in the Model-View-Controller (MVC) architecture. 

## What is Maven

Maven is a software project management tool based on the concept of a Project Object Model (POM) that can be used for building and managing any java-based project. 
By using a POM, Maven is able to manage a projects build, reporting, and documentation from a central piece of information.

## Installing Maven

First check and see if you have Maven installed with the following command in the terminal:

```
mvn -v
```
If you have a new VM then chances are you do not have Maven installed. If you see the following message you have Maven installed and can skip over the next step for Maven Installation. The message below contains which version of Maven and Java you are using as well as the directory for Maven and Java.

```
Apache Maven 3.0.5
Maven home: /usr/share/maven
Java version: 1.7.0_65, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-7-openjdk-amd64/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "3.13.0-29-generic", arch: "amd64", family: "unix"
```
To install the latest version of Maven type the following:
```
sudo apt-get install maven
```
Next navigate the directories into your Apache Tomcat server to the webapps folder.
```
cd Documents/tomcat/webapps
```

Now we will create a Maven project using the Maven project generator with the following command structure. 
```
mvn archetype:generate -DgroupId=com.[package name] -DartifactId=[web app name] -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
```
You need to fill in the following: the GroupId (package name), the artifactId (project name).

The archetypeArtifactId is the type of project that Maven will create. Use "maven-archetype-webapp" to create a web app.
The following is an example:
```
mvn archetype:generate -DgroupId=com.mihalik -DartifactId=myWebApp -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false     
```

Move into the project folder:
```
cd myWebApp
```

Use the Maven command to package the project which will install dependencies and prepare the project.
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
cd Documents/tomcat/webapps/myWebApp/src/main/webapp/resources/index.jsp
```
on the tomcat web-server.

In this file you will see basic HTML markup with the message "Hello World!". 
You can change this message and refresh your webpage in your browser and see the changes you made.

```
<html>
    <body>
      <h1>Hello, the time & date is now: <%= new java.util.Date() %></h1>
    </body>
</html>
```

In the above example you can see Java code wrapped in the tags <%= [code] %>, this is a JSP expression. A JSP expression will output the result of Java code into the web page. 

Scriptlets, denoted with <% [code] %> tags are useful in adding Java code to your web page. Scriptlets are useful for initializing variables, manipulating data, or adding statements/loops to control the content of the web page.

```
  <h2>
    Hello! using a scriptlet 1 + 1 = 
    <%
      // This is a scriptlet
      int a = 1;
      int b = 1;
      out.println( a + b); // This code will output the result of a + b to the HTML output.
    %>
  </h2>
```

The following example is a great way to dynamically load content that you may receive from a database call. Rather than writing out a line for every result (which we may not know how many results we are going to receive) we can write the code for the table once and iterate over data or some other parameter to output the rows for the table dynamically.

```
<TABLE BORDER=2>
  <%
  int n = 4;
      for ( int i = 0; i < n; i++ ) {
          %>
          <TR>
          <TD>Number</TD>
          <TD><%= i+1 %></TD>
          </TR>
          <%
      }
  %>
</TABLE>
```

Congrats! You have made a simple web app using Java (JSP), Maven, Tomcat, and your Koding VM. JSP is a great primer for simple web apps and a great introduction into learning about the Java Web tier.

The Java web tier development has moved towards utilizing Facelets over JSP for creating views since Java EE 6, but JSP is still utilized in programs today. 

Good luck with your further Java web development and happy coding! 
