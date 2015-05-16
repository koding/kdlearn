---
title: How can I monitor network traffic/usage?
importance: 5
---

There are a variety of tools for Ubuntu that you can install on your VM in order to monitor traffic and network usage. Listed below are three of our favorites.
> type:tip
> Before installing any of the tools mentioned below, make sure you update your
> repositories by using the command: `sudo apt-get update`

1. **nload**: This tool allows users you to monitor the incoming and outgoing traffic separately. It also draws out an ascii graph to indicate the same, the scale of which can be adjusted. Easy and simple to use, and does not support many options. So if you just need to take a quick look at the total bandwidth usage without details of individual processes, then nload will be handy.
To install, type the following command in Terminal:
```
sudo apt-get install nload -y
```
and then to run, type:
```
nload
```
2. **iftop**: This tool measures the data flowing through individual socket connections, and it works in a manner that is different from Nload. Iftop uses the pcap library to capture the packets moving in and out of the network adapter, and then sums up the size and count to find the total bandwidth under use. Although iftop reports the bandwidth used by individual connections, it cannot report the process name/id involved in the particular socket connection. But being based on the pcap library, iftop is able to filter the traffic and report bandwidth usage over selected host connections as specified by the filter.
To install, type the following command in Terminal:
```
sudo apt-get install nload -y
```
and then to run, type:
```
sudo iftop -n
```
3. **iptraf**: This is an interactive and colorful IP Lan monitor. It shows individual connections and the amount of data flowing between the hosts.
To install, type the following command in Terminal:
```
sudo apt-get install iptraf iptraf-ng -y
```
and then to run, type:
```
sudo iptraf
```
4. **nethogs**: This is a small 'net top' tool that shows the bandwidth used by individual processes and sorts the list putting the most intensive processes on top. In the event of a sudden bandwidth spike, quickly open nethogs and find the process responsible. Nethogs reports the PID, user and the path of the program.
To install, type the following command in Terminal:
```
sudo apt-get install nethogs -y
```
and then to run, type:
```
sudo nethogs 
```
5. **vnstat**: This utility is bit different from most of the other tools. It actually runs a background service/daemon and keeps recording the size of data transfer all the time. Next it can be used to generate a report of the history of network usage. Vnstat is more like a tool to get historic reports of how much bandwidth is used everyday or over the past month. It is not strictly a tool for monitoring the network in real time.
To install, type the following command in Terminal:
```
sudo apt-get install vnstat -y
```
and then to run, type:
```
sudo service start vnstat
```
Running vnstat without any options would simply show the total amount of data transfer that took place since the date the daemon is running. To monitor the bandwidth usage in realtime, use the `-l` option (live mode). It would then show the total bandwidth used by incoming and outgoing data, but in a very precise manner without any internal details about host connections or processes.  
