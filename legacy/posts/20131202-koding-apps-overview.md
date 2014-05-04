title: Koding Apps Overview
link: http://learn.koding.com/koding-apps-overview/
author: lee
description: 
post_id: 412
created: 2013/12/02 18:20:16
created_gmt: 2013/12/02 18:20:16
comment_status: closed
post_name: koding-apps-overview
status: publish
post_type: post

# Koding Apps Overview

This guide goes over some useful details regarding Koding Apps. What they are, how to use them, and how to fix a broken install. We will not go over App Creation at this time, but there will be a guide for that in the future!

## Video

_(None yet, coming soon!)_

## What are Koding Apps?

Think of Koding Apps like Desktop Applications, on Koding. They can be anything from simple shortcuts such as installing PureFTPd or MySQL, to complicated apps such as real Image Editing and Realtime Collaboration.

### Installing Apps

Installation is quite simple. Navigate to [koding/Apps](https://koding.com/Apps) and find the app you want. Click on the desired app, and click the green **"Install Now"** button under the App title.

In a moment, once the App installs, you will be directed to [koding/Develop](https://koding.com/Develop) which shows a list of your installed Apps. To use one, simple click on it!

Each app will be different, but generally if it's an installer like PureFTPd, it will have an install option in the upper right. If it's an app that you use, just click on it and use it :D

## Apps, The nitty gritty details

So, what _are_ Apps you ask? Are they run on the server? Are they run on the client? It's kind of important to know if you want to develop them right?

Koding Apps are basically clientside Apps that use the Koding Framework to communicate with your VM. This means that potentially any web based and modular html/js/css app can be turned into a Koding App with some love! You can see this in the Koding Text editor. It's basically just the Ace Editor wrapped in the Koding Framework.

So keep an eye out for cool web platforms, chances are good that in the future we can integrate it into Koding!

## App Development

There are no published api docs currently, which makes development a bit hard. There are however, two Apps designed to help you develop Koding Apps. [Kodepad](https://koding.com/Apps/kodepad) and [Appmaker](https://koding.com/Apps/appmaker). It's mostly just code examples, but it's the best we currently have.

## App Submission

So, you made an awesome app and you want to submit it right? You can read up on the process for basic app submission [here](https://koding.com/Develop).