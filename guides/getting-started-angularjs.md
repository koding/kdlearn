---
title: Getting Started with AngularJS
author: Team Koding
categories: [frameworks platforms, angularjs, javascript]

template: page.toffee
---

# Getting Started with AngularJS

## Introduction

[AngularJS](http://angularjs.org/) is a Javascript framework that extends HTML to create interactive applications.
In contrast to other frameworks, AngularJS does not require additional code to manipulate the HTML elements to obtain data and update the user interface.
It provides extended HTML tags, known as directives, that developers can bind to Javascript variables and data structures.

This tutorial presents how to create and preview an AngularJS application on [Koding](https://koding.com).

## A first application in AngularJS

AngularJS is a Javascript Framework. 
To use it, it is necessary to reference the corresponding script in the HTML document.
You can reference a local copy of the AngularJS script in your machine or a remote copy located in some CDN server in the internet.
For instance, instead of using a local copy of AngularJS, you can reference the library in the Google APIs CDN using the following HTML code:

```html
<script 
  src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js">
</script>
```

Once referenced the AngularJS script, it is necessary to indicate which part of the HTML document must be processed by the framework.
Basically, it is necessary to define an `ng-app` attribute to indicate the HTML element that contains the application. 
For instance, if all the HTML document includes elements that must be processed by AngularJS, you can include the `ng-app` attribute in the root HTML tag.

```html
<!doctype html>
<html ng-app> 

  <!-- AngularJS application -->
   
</html>
```

Inside the element with the `ng-app` attribute, the HTML tags become dynamic elements that can be bounded to Javascript variables and data structures. 
These variables, known as the model, will be updated automatically when the user interacts with the HTML elements.
For instance, it is possible to define a text box that updates automatically a variable using the `ng-model` attribute. 
The following HTML code defines a text box with a binding to a variable named `yourName`:

```html
<input type="text"
  ng-model="yourName"
  placeholder="Enter a name here">
```

The value of the variables in the model can be presented in the user interface using expressions. 
For instance, the following expression presents to the user the value in `yourName`:

```html
{{yourName}}
```

Each time the user enters data into the text box, the variable `yourName` in the model is updated.
In addition, each time the variable `yourName` in the model is modified, the user interface is updated automatically.
This behaviour is known as double-binding: the view is bounded to the model, and the model is bounded to the view.


## Implementing the application in Koding

Using the concepts explained above, it is possible to create a simple application where the user can enter some data and the user interface is updated accordingly.

To create the application and use the preview options in Koding, it is necessary to create the project under the `Web` folder.
You can create the project folder using the following commands:

```
cd Web
mkdir your_project
cd your_project
```

Then, you may create an HTML file with the application. 
If you have installed the [`kdopen`](http://learn.koding.com/faq/kdopen/) command, you can create the file using the following command:

```
kdopen index.html 
```

> type:tip
> You can create the folders and files using the Koding user interface instead of the Terminal.

Then, you can enter the code for the application using the Koding editor.
For instance, the code for a simple AngularJS application is the following: 

```html
<!doctype html>
<html ng-app>
  <head>
  <script 
    src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js">
  </script>
  </head>
  <body>
    <div>
      <label>Name:</label>
      <input type="text"
        ng-model="yourName"
        placeholder="Enter a name here">
      <hr>
      <h1>Hello {{yourName}}!</h1>
    </div>
  </body>
</html>
```

You can now save the file and check out the result. 
To [preview the app](http://learn.koding.com/categories/previewing/), you can use the "Preview" option in the drop down menu of each editor tab. 
In addition, you can use the `Ctrl(Cmd) + Alt + P` keyboard shortcut.
This will open a new browser tab and show you a preview of the application.

## Further information

AngularJS is a framework aimed to create large applications. 
It supports, not only the double-binding, but also the definition of controllers, services and custom directives, among others.
The [Made with Angular website](https://www.madewithangular.com/) maintains a showcase of interesting Angular applications.
More information can be found in the [AngularJS website](http://angularjs.org/).
There are some free tutorials in the [CodeSchool](http://campus.codeschool.com/courses/shaping-up-with-angular-js/intro), the [Codecademy](https://www.codecademy.com/en/courses/learn-angularjs) and the [w3schools](http://www.w3schools.com/angular/default.asp) websites. 

If you encounter any issues or have any questions please drop us an email [here](mailto:support@koding.com).
