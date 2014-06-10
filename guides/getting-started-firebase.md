---
title: Firebase setup and usage for beginners
author: Team Koding
date: 2014-02-27
categories: [firebase, javascript]

template: page.toffee
videoId: za6mRxKuUig
---

# Firebase setup and usage for beginners

In this beginner tutorial we will go over the basics of Firebase. Follow along, or [Try the Koding Demo](https://koding.com/Develop/Teamwork?import=http://goo.gl/TVcmyp) right now!

## What is Firebase?

Adding real time elements can be an awesome addition to almost any web application. Even plain websites can benefit greatly from real time elements. From user content updating in real time to notifying visitors about that newly made blog post, there are quite a few options when creating real time content.

The challenge comes with actually implementing them. You often have to support multiple required methods to update clients such as Polling or WebSockets, and as always many browsers have unique quirks that can mutate and twist your well thought out plans into a hacky mess. Most people choose frameworks like SockJS or SocketIO to abstract away the pain, but even with these frameworks you still need to be running server logic to handle persistent connections and events. This server side logic isn’t too hard either, but it really depends on your needs. If you’re using Wordpress or a Content Management System, server side logic is probably not something you desire messing with.

## Along comes Firebase

Firebase handles these problems by going one step further than SockJS and SocketIO. Instead of just abstracting the protocols used to communicate real time data with the client, Firebase abstracts the server too. What does this mean? Well, it means with just a few lines of JavaScript, you can have a real time application. No servers to manage, no protocols to manage, just a few calls to JavaScript and your data in real time.

## Sounds great, what does it look like?

In the following short video, we go through the super-easy process of setting up an existing page to take input from one connected client and broadcast it to all connected clients. For reference, we're using the chat example [found here](https://www.firebase.com/tutorial/#example/chat).

Just like that, our previously static html page has real time elements! No server setup, no complications, just Firebase.

## Could it be easier?

Of course! With our [Teamwork Import](https://koding.com/Develop/Teamwork?import=http://goo.gl/TVcmyp) you can continue right where the above video left off. And of course, by using [Koding](https://koding.com), this entire process was in your browser. As easy as you could want, with no localhost hassle.

More getting started guides are coming soon, so stay tuned!
