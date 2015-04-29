---
title: Cassandra installation for beginners
author: Team Koding
categories: [frameworks platforms, cassandra,java,apache]
template: page.toffee
---

# Cassandra installation for beginners

Before you continue reading this guide why not try a more easy way, using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) and install Cassandra using just one command:

```
kpm install cassandra
```

***

Apache Cassandra, is a highly scalable open source database system, that can achieve great performance on multi-node setups. This guide will help install Cassandra on your Koding VM.

## Getting started

Before you can start the Cassandra install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Make sure you have Oracle Java7 installed on your VM before you continue. You can install it using the following commands:

Add the repository:

```
sudo add-apt-repository -y ppa:webupd8team/java
```

Install the package:

```
sudo apt-get install -y oracle-jdk7-installer
```

Or you can use the KPM version by running:

```
kpm install oracle-java7
```

## Installing

Installing Cassandra is fairly easy. You just need to download the binary files from the official website and unpack them:

Download the files into the temp folder:

```
cd ~/temp
wget http://www.us.apache.org/dist/cassandra/2.1.2/apache-cassandra-2.1.2-bin.tar.gz
```

Unzip them:

```
tar -xvzf apache-cassandra-2.1.2-bin.tar.gz
```

Move them into your personal folder:

```
mv apache-cassandra-2.1.2 ~/cassandra
```

The next thing you need to do is to make sure that the folders Cassandra accesses, such as the log folder, exist and that Cassandra has the rights to write on them. Use the bellow commands to achieve this:

```
sudo mkdir /var/lib/cassandra
sudo mkdir /var/log/cassandra
sudo chown -R $USER:$GROUP /var/lib/cassandra
sudo chown -R $USER:$GROUP /var/log/cassandra
```

You now need to set Cassandra’s variables by running the following commands:

```
export CASSANDRA_HOME=~/cassandra
export PATH=$PATH:$CASSANDRA_HOME/bin
```

The default per-thread stack size needs to be increased. You can do that by running:

```
nano ~/cassandra/conf/cassandra-env.sh
```

and then scroll down to the line that says:

```
JVM_OPTS="$JVM_OPTS -Xss180k"
```

and change it to:

```
JVM_OPTS="$JVM_OPTS -Xss280k"
```

## Running Cassandra

To run Cassandra, you won't need to change anything in the `cassandra.yaml` file. You can simply run:

```
sudo sh ~/cassandra/bin/cassandra
```

and then run:

```
sudo sh ~/cassandra/bin/cassandra-cli
```

The result of the above commands should output `Connected to: 'Test Cluster'`. So you are now running your single-node cluster.

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
