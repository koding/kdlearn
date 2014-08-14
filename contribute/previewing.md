---
author: Team Koding
date: 2014-08-04
categories: [koding]
collection: guide

series: contribute
series-index: 4
template: series.toffee
---

# Previewing

While you shouldn't need to preview your guides, since Markdown is 
designed to be human friendly in the source, if you insist you can 
preview your guides as they are on Koding University. This guide will go 
over that process. Note that this will require a bit of developer 
know-how, so be prepared to get your hands dirty. Lets get started!

## Requirements

You will need a working NodeJS installation to compile the Koding 
University source. If you do not, visit the [NodeJS downloads][downloads] 
page and grab the installer.


## Installation

With a working NodeJS installation, we need to install the KU 
dependencies, as well as a global installation of the GulpJS. This can be 
done with the following code:

```
npm install -g gulp
cd .metalsmith
npm install
```

## Building

With Gulp installed, simply run the following command, to compile the 
entire project into HTML.

*(Ignore `cd .metalsmtih` if you're already in that directory)*

```
cd .metalsmith
gulp
```

The `.metalsmith/build` directory will contain all of the compiled html, 
css, and any static resources *(such as images/etc)* from the markdown 
directory.

Compiling can take 1-2 minutes, so be patient.

## Previewing

If you want to preview the compiled site, open a new Koding Terminal tab 
and run the following:

*(Ignore `cd .metalsmtih` if you're already in that directory)*

```
cd .metalsmith
gulp preview
```

This will run a small HTTP Server on Port `8000`, ie: 
`http://you.kd.io:8000`. Keep this tab open, and in  a **different** 
Koding Terminal tab run your `gulp` command from above.  Each time you 
compile the site, this will show your compiled site.


## Compiling as you type

To have your Markdown compiled as you write your documents, run the 
following commands:

*(Ignore `cd .metalsmtih` if you're already in that directory)*

```
cd .metalsmith
gulp watch
```

This, in combination with the preview command above, will compile the 
site each time you change the Markdown.

Note that if you add images for your guide to use, you'll want to run the 
full `gulp` command again.


And that sums it up! You now know how to contribute to Koding University, 
in multiple ways. Keep up the awesome work, and we look forward to your 
contribution!



[downloads]: http://nodejs.org/download
