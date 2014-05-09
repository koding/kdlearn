---
title: How to create a Playground for Teamwork
template: page.toffee
---

# How to create a Playground for Teamwork

In this article we will go over the simple process of adding your own Playground to the official Teamwork Playground list.

## The publication process

First, create your awesome Playground content. After completing your content for your Playground, all that you need to do is edit two files and create a merge request on Github. Once merged, your Playground will be published instantly.

## Creating a playground

To get started, clone [Koding's Teamwork Repository](https://github.com/koding/Teamwork) and go to the **Playgrounds** folder. Once there, open up **manifest.json**.

In the manifest.json, you will see lots of Playground configs. Add your own config here, in the same format. A sample Facebook Config is below.

[code] { "name": "Facebook", "manifestUrl": "https://raw.github.com/koding/Teamwork/master/Playgrounds/Facebook.json", "description": "Facebook Playground", "icon": "https://teamworkcontent.s3.amazonaws.com/covers/facebook.png" } [/code]

The config details are explained below:

  * **name** The name of your Playground. It must be unique.
  * **manifestUrl** The url of the your Playground's manifest file. We will cover the manifest file content in a moment.
  * **description** A few words about of your Playground.
  * **icon** The cover icon of your Playground. It must be 240px by 240px. It will be used on the Teamwork Playgrounds Modal, see below for an example. ![playgrounds_many](http://blog.koding.com/wp-content/uploads/2013/10/playgrounds_many.png)

Now it's time to create your Playground's **manifest** file. This file is used to customize Teamwork for your Playground, allowing you to easily change look and feel and the functionality. As an example, [Click here](https://github.com/koding/Teamwork/blob/master/Playgrounds/Bootstrap.json) to see an example of the Bootstrap Playground Manifest file.

[code] { "name": "AngularJS", "version": "1.2.0", "styling": { "textColor": "#FFF", "textShadowColor": "none", "borderColor": "#e52a3a", "bgColor": "#e52a3a", "bgImage": "https://teamworkcontent.s3.amazonaws.com/icons/angularjs.png" }, "content": { "type": "zip", "url": "https://teamworkcontent.s3.amazonaws.com/zipfiles/AngularJS.zip" }, "run": { "handler": "preview", "command": "https://$USERNAME.kd.io/Teamwork/AngularJS" }, "initialState": { "preview": { "url": "https://$USERNAME.kd.io/Teamwork/AngularJS" }, "editor": { "files": [ "./index.html" ] } } } [/code]

Next we'll cover all the properties of the manifest file:

  * **name** The name of your Playground. Keep it short and meaningful.
  * **version** The version of your Playground. If you make a Playground for a framework like AngularJS then you may want to use it's version number as your Playground's version. Otherwise it's a good idea to start your version number by ```0.1```. Let's say, you add new examples to your Playground and want to publish latest content, you need to update version number and Teamwork users will be prompted again to download latest content.
  * **styling** The styling options that will be applied to Teamwork's header. With these styling options, you can change text color, background color and even the logo of Teamwork and make your Playground unique.
  * **textColor** The color of the title. Default is `#4c4c4c`.
  * **textShadowColor** Pass a color if you want to add shadow of your title, otherwise pass none. This defaults to none.
  * **borderColor** The Teamwork header has `3px solid #c7c7c7` border at the bottom. Pass a color to override it.
  * **bgColor** Background color of the header.
  * **bgImage** Logo of your Playground. It must be 37px by 37px. Otherwise it will be forced to that size. Default is Teamwork Logo.
  * **content** Let Teamwork know where your Playground content is located. The `content` config requires two properties, `type` and `url`. Currently the only supported content type is `zip`. So your content must be zipped and put a publicly available location.
  * **run** With this config option, you can execute a command in the Terminal or open a web page on Teamwork's Previewer. The `run` config requires 2 properties, `handler` and `command`.
  * **handler** Handler defines which Teamwork pane will be visible and do something when user clicked to Run button. It should be `terminal` or `preview`.
  * **command** The command that will be run on Terminal or opened by Preview. We give you some placeholders to deal with the active state of Teamwork.
  * **$ACTIVE_FILE_PATH** This placeholder can be used with Terminal. If your command includes this placeholder, it will be replaced by the active file's path on the editor.
  * **$USERNAME** This placeholder can be used with Preview or Terminal. If your command includes this placeholder, it will be replaced by the Teamwork's session owner username.
  * **initialState** This config will be used to decorate the Teamwork panes after it became ready. For example you can open a web page or open your default files to editor when you Playground opened.
  * **preview** Define a `preview` object and `url` property in it to open a web page. You can use some placeholders inside of url. See the documentation for **command**.
  * **editor** Define a `editor` object and `files` property in it to open the files you want. `files` must be an array that contains file paths. It must start with `./` which defines the root of your zip file.
  * **prerequisite** This config will be used to check your Playground is ready if you have something to do before it opened. For example, each time user has opened the Wordpress Playground, we have to check a database named wordpress. `prerequisite` config requires two parameters, `type` and `command`. Currently only implemented pre-requisite type is `sh`. So this means your command will be run on Terminal before user start to interact with your Playground.

With this article in hand you should be ready to get started making your very own Playgrounds and contributing to the community. As always, ask in the [Activity Feed](https://koding.com/Activity) if you have any questions.

Now go make some awesome content :)
