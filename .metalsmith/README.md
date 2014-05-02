
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

A global installation of `cult` and varying node packages are required.

1. `npm install -g cult`
2. `cd .metalsmith`
3. `npm install`

## Building

With Cult installed, simply run `cult build` to compile the entire project into 
HTML.

The `./build` directory will contain all of the compiled html, css, and any 
static resources *(such as images/etc)* from the markdown directory.

## Watching

To have your Markdown compiled as you write your documents, run the following 
commands:

1. `cd .metalsmith`
2. `cult watch`

If you're working on templates/etc, run the following commands:

1. `cd .metalsmith`
2. `cult watch:all`

Of course, you can skip the `cd` command if you're already in the source 
directory.
