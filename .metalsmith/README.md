
# KDLearn Development

KDLearn is a series of Markdown files which are compiled to HTML. This 
compiling is handled by code found within this directory.

## Content First

Note that KDLearn's project structure is **content first**. This means that 
when someone visits the repo, they immediately see the content and know how to 
write it. They don't have to learn our implementation or even have a clue how 
to compile it. They only have to know Markdown.

So, if you're looking to contribute features to KDLearn, make sure that 
implementation stays entirely within this directory. This includes all SASS, 
layout images, javascript, etc.

## Installation

A global installation of `gulp`, and varying node packages are required. From 
the `kdlearn` directory, type the following:

```
npm install -g gulp
cd .metalsmith
npm install
```

## Building

With Gulp installed, simply run the following command, to compile the entire 
project into HTML.

```
gulp
```

The `./build` directory will contain all of the compiled html, css, and any 
static resources *(such as images/etc)* from the markdown directory.

## Previewing

If you want to preview the compiled site, open a new Koding Terminal tab and 
run the following:

```
cd .metalsmith
gulp preview
```

This will run a small HTTP Server on Port `8000`, ie: `http://you.kd.io:8000`.
  
Keep this tab open, and in  a **different** Koding Terminal tab run your `gulp` 
command from above.  Each time you compile the site, this will show your 
compiled site.


## Compiling as you type

To have your Markdown compiled as you write your documents, run the following 
commands:

```
cd .metalsmith
gulp watch
```

This, in combination with the preview command above, will compile the site each 
time you change the Markdown.

Of course, you can skip the `cd` command if you're already in the source 
directory.
