---
title: Elasticsearch install for beginners
author: Team Koding
date: 2015-02-06
categories: [elasticsearch]
template: page.toffee
---

# Elasticsearch install for beginners

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Elasticsearch using just one command:

```
kpm install elasticsearch
```

***

Elasticsearch is a flexible and powerful open source, distributed, real-time search and analytics engine. It can be scaled as needed. This tutorial will cover the installation process on a Koding VM.

## Getting started

Before you can start the Elasticsearch install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Make sure you have Oracle Java 7 installed on your VM before you continue. You can install the later using the following commands:

Add the repository first:

```
sudo add-apt-repository ppa:webupd8team/java
```

and then install the package like so:

```
sudo apt-get install oracle-java7-installer
```

You can check if Java has installed correctly by running `java -version`.

> type:success
> All Koding VMs come preinstalled with Java.

## Installing

To get Elasticsearch installed you'll need to run the following commands in your Koding Terminal.

Download the archive:

```
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.zip
```

Now unzip the downloaded archive:

```
unzip elasticsearch-1.4.2.zip
```

This will create a directory called `elasticsearch-1.4.2`. You now need to change into that directory by entering:

```
cd elasticsearch-1.4.2
```

and you'll be able to find the binaries in the bin folder.

## Configuration

The configuration files for Elasticsearch are found in the `config` folder of the above resulting directory.

There are two important configuration files: `elasticsearch.yml` and `logging.yml`. The first configures the Elasticsearch server settings, and the latter, the logger settings used by Elasticsearch.

You can find the Elasticsearch logs here `/var/log/elasticsearch`, by default.

The first thing you need to do is to remove the public access. Open the `elasticsearch.yml` file and search for `network.bind_host`, uncomment it and change the value to `0.0.0.0` so it looks like this:

```
network.bind_host: 0.0.0.0
```

After that you need to insert the following line somewhere in the file, to disable dynamic scripts:

```
script.disable_dynamic: true
```

You can now save the file and exit.

## Starting Elasticsearch

Make sure you are in the folder generated in the install process.

You can now start the Elasticsearch server by running the following command:

```
./bin/elasticsearch
```

Consider that fact that Elasticsearch needs some time to start but when it does it should be running on port 9200. You can check this using the following command:

```
curl -X GET 'http://localhost:9200'
```

Or open up a new browser window and follow a similar URL and you should see everything working:

```
http://KODING_USERNAME.koding.io:9200
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

You can stop the server using the RESTful API like so:

```
curl -XPOST 'http://localhost:9200/_shutdown'
```

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
