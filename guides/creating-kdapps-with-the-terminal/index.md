---
title: How to create a kdapp through the terminal
author: Team Koding
date: 2014-03-09
categories: [koding]

template: page.toffee
---

# Prerequisites

If you have never made a KDApp before or a little rusty, please go through the [Creating KDApps](http://learn.koding.com/guides/creating-kdapps/) guide before continuing.

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

  create [name]          Create a new KDApp project
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

A `manifest.json` will be created in the root project directory. The manifest should resemble this.

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

# Adding Support for [LESS](https://github.com/less/less.js)

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
  "stylesheets": [
    "./resources/style.css"
  ],
  "less": [
    "./less/style.less"
  ]
}
```