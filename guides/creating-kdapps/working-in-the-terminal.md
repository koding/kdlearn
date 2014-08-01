---
title: Working In The Terminal
author: Team Koding
date: 2014-03-09
categories: [koding]

series: creating-kdapps
series-index: 4
template: series.toffee
---

# Prerequisites

If you have never made a KDApp before, please go through the [Creating KDApps](http://learn.koding.com/guides/creating-kdapps/) guide before continuing.

# What is KDApp CLI
KDApp CLI is a command-line version of the Koding DevTools, it lets you build, test and publish koding apps. 
KDApp is made for the power users of [koding.com](http://koding.com), the developers whose native enviroment is the command-line.


# Significant Improvements

- Support for separating code into multiple files
  - Make sure to list all the files in the [manifest.json](#adding-support-for-code-separation)
- Support for [LESS](#adding-support-for-less)
- Ability to preview your apps as if they were already published
  - Previewing is implemented through companion [Preview app](https://koding.com/Apps/bvallelunga/Preview)  
  - Auto compiling of **LESS** and **Coffeescript** on file change
  - Reload the page to get newly compiled app

# Requirements

- [Install node.js](http://nodejs.org/) version `>=0.10.x`

# Install

```
$ sudo npm install -g kdapp
```

# Getting Started

```
$ kdapp create "First App" # create KDApp project
$ cd FirstApp.kdapp        # change to project directory
$ kdapp preview            # compile and prview app
```

# Usage

```
Usage: kdapp [options] [command]

Commands:

  create [type] [name]   Create a new <basic> or <installer> KDApp (default: basic)
  compile                Compile all assets of app, making it ready to be published
  compile [type]         Compile specific assest: coffee, less
  preview [options]      Preview the application on a local web server
  publish [env]          Publish to <sandbox> or <store> enviroment
  help                   Output help information

Options:

  -h, --help     output usage information
  -V, --version  output the version number
  -q, --quite    Disable Logging
```

# Manifest

A `manifest.json` will be created in the root project directory. The manifest file is required by Koding to understand how to run your app, it looks similar to this:

```
{
  "background": false,
  "behavior": "application",
  "version": "0.1",
  "title": "First App",
  "name": "Firstapp",
  "identifier": "com.koding.apps.firstapp",
  "path": "~/Applications/FirstApp",
  "homepage": "bvallelunga.kd.io/firstapp",
  "repository": "git://github.com/bvallelunga/firstapp.kdapp.git",
  "description": "FirstApp : a Koding application created with the blank template.",
  "category": "web-app",
  "source": {
    "blocks": {
      "app": {
        "files": [
          "./index.coffee"
        ]
      }
    },
    "stylesheets": [
      "./resources/style.css"
    ]
  },
  "options": {
    "type": "tab"
  },
  "icns": {
    "128": "./resources/icon.128.png"
  },
  "fileTypes": []
}
```

## Adding Support for Code Separation

Update the `manifest.json` by adding your new files block under `files`

```
"source": {
  "blocks": {
    "app": {
    
      # Order files by dependencies, meaning that the 
      # index.coffee should be last since it requires both 
      # foo and bar files
      
      "files": [
        "./foo.coffee"   # File 3
        "./bar.coffee"   # File 2
        "./index.coffee" # File 1 
      ]
    }
  },
  "stylesheets": [
    "./resources/style.css"
  ],
  "less": [
    "./less/style.less"
  ]
}
```


## Adding Support for [LESS](https://github.com/less/less.js)

Update the `manifest.json` by adding a `less` block under `sources`

```
"source": {
  "blocks": {
    "app": {
      "files": [
        "./index.coffee"
      ]
    }
  },
  
  # Do NOT remove stylesheets block
  
  "stylesheets": [
    "./resources/style.css"
  ],
  
  # Order files by dependencies, meaning that the 
  # style.less should be last since it requires both 
  # mixins and colors files 
  
  "less": [
    "./less/mixins.less" # File 3
    "./less/colors.less" # File 2
    "./less/style.less"  # File 1
  ]
}
```
