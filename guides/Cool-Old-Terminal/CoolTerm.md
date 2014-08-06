---
draft: true
title: Vintage Style Terminal 
author: Dinesh Auti
date: 06 Aug 2014
categories: [koding]

template: page.toffee

---

# Vintage Style Terminal

Hello people!!! Welcome to this awesome tutorial.

Frankly speaking.. after the end of this tutorial nothing new will be learned by you! This is tutorial is all about #funwithkoding. So proceed with caution.... ;-)

Allow me to take you for a ride into the good old computing days … where GUI was a rare occurance. Command line is all that they had. It was kind of geeky. But as days progressed GUI was introduced & since it was easy for all to use, focus was shifted from command line to GUI.

Even though GUI is widely popular, some people ... mainly programmers .. love the command line.

![Alt][1]

*NOTE : This can be done on Linux systems only*

**Description :**

cool-old-term is a terminal emulator which tries to mimic the look and feel of the old cathode tube screens. It has been designed to be eye-candy, customizable, and reasonably lightweight. It now uses the konsole engine which is powerful and mature. This terminal emulator requires Qt 5.2 or higher to run.

**Build Instructions :**

First retrieve the dependencies

_**Ubuntu 14.04**_

```sudo apt-get install build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev``` ```qtdeclarative5-controls-plugin qtdeclarative5-qtquick2-plugin libqt5qml-graphicaleffects``` ```qtdeclarative5-dialogs-plugin qtdeclarative5-localstorage-plugin qtdeclarative5-window-plugin```

Copy the code from below .. to maintain the indentation. So that you can paste it directly into the terminal.

*sudo apt-get install build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qtdeclarative5-controls-plugin qtdeclarative5-qtquick2-plugin libqt5qml-graphicaleffects qtdeclarative5-dialogs-plugin qtdeclarative5-localstorage-plugin qtdeclarative5-window-plugin*

_**Anyone else**_

Install Qt directly from [here](http://qt-project.org/downloads). Once done export them in you path (replace "/opt/Qt5.3.1/5.3/gcc_64/bin" with your correct folder):

```export PATH=/opt/Qt5.3.1/5.3/gcc_64/bin/:$PATH```

_**Complie**_

Once Qt are installed and in your path you need to compile and run the application:


```git clone https://github.com/Swordifish90/cool-old-term.git```   
```cd cool-old-term```  
```cd konsole-qml-plugin```  
```qmake && make && make install```    
```cd ..```  
`./cool-old-term`  


That's it. You have been transported to the good old computing days!!! Enjoy coding in a awesomely weird way ;-)

_**Koding**_

This effect can be ported to coding (not exactly). Here's how :

1. Follow this [tutorial](http://learn.koding.com/guides/ssh-into-your-vm/) to establish a SSH connection with your koding VM.
2. Then follow the above method to install cool-old-term.
3. SSH into koding VM from this modified terminal.

NOTE : You cannot install this on koding VM, I tried :-( . For  this to work SSH is the only way. If sometime later I am able to work it out on koding terminal... I will update the post.

The end result :

![Alt][2]
![Alt][3]

[1]: /home/dineshauti/kdlearn/guides/Cool-Old-Terminal/cool_old_computing.jpg 
[2]: /home/dineshauti/kdlearn/guides/Cool-Old-Terminal/cool_term_koding.png
[3]: /home/dineshauti/kdlearn/guides/Cool-Old-Terminal/coolterm_green.png