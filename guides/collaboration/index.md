---
title: How can I do real-time collaboration on Koding?
author: Team Koding
categories: [collaboration, koding]

improvable: false
---
### What is Collaboration?
Koding Collaboration allows you to easily and effectively collaborate and share resources with your
team, students, peers or friends. When you enable Collaboration, you are effectively sharing your
virtual machine (VM) with those whom you invite into the sharing session. The session remains active
until you hit "End Session". Every person you share a session with requires a Koding account (free or paid).

> type:alert
> Since the user(s) with whom you share your session have access to all the files on your VM, make sure that you are sharing with people that you know.

![Collaboration 1](otheruser.png)

### What can I share?
When you collaborate with someone, you can give them full access to your VM. This means that an invited
user can view/edit files and directories on your VM.

Besides file sharing, you can also share your IDE, Terminal and your Drawing board. When you start a
sharing session, the contents of your entire workspace are shared. This includes any existing open IDE
or Terminal tabs or any new one's that you open during the sharing session.

During an active Collaboration session, anything typed by any user in the sharing session is automatically
reflected on the screens of the other users in the same session. If you have ever worked on a shared
Google doc with realtime editing, this should feel very natural in comparison to that experience.

### What can I use Collaboration for?
Collaboration is great for things like:
1. Collaborative programming
2. Interviews
3. Teaching
4. Bug hunting/fixing
5. Doing client work (with the client)

Since Koding Collaboration allows you to share your Terminal as well, it's great for those times when
you are stuck with that shell script and need someone to take a peek. Koding Collaboration also
allows you to share a white-board for all those times when a picture is just needed.

### Options for the host when starting a collaboration session.
When starting a session, the host of the session has the following options available to them:
1. <a name="watch_mode"></a>**What does "Watch" mode mean?** Watch mode, the default mode, 
shares your workspace and everyone in that session gets a replica of your
workspace on their screen. So if you open file tabs, new Terminals tabs and even switch tabs, other
sessions participants see it all and their screens also update in real time with these actions.  When a session participant chooses to "unwatch" your session, it means they are free to do what they
want on their end of the collaborative session without having to be distracted by the host changing
files or opening new tabs. This is very useful when you want to work on a few different files and
the users in the session can open files independently on the VM shared by the host yet not distract
each other. This is a bit confusing at first but then you'll wonder how else would Collaboration
ever happen!
2. <a name="read_only"></a>**Read-only session**
If this option is enabled then none of the guests can make any changes to your files either
through the editor or the Terminal. The session is essentially "read-only" for them. This is a great
option for teachers to use cause you don't want your student's doing `rm -rf` on your VM! :)
3. <a name="mute_host"></a>**Participants/Guests can mute the host**
In some situations, a host may want to allow guests to mute them, this option provides that
functionality. This is handy when there is no real "host" and someone starts a session for the
group/team but everyone needs equal level of controls over the session.

### What does "Kick" do?
This is available to the host if they want to remove someone from a shared session without ending
the session.

![Collaboration 1](watch-kick.png)

### Do sessions "auto-close"?
Generally, we recommend that you exit/close your sessions yourself. However, there are situations when
you cannot close/end your session (e.g. browser crash). In such cases, you have up to one (1) minute
to reconnect otherwise at the end of a minute, all sessions are auto-terminated.

### Video collaboration
> type:tip
> Video collaboration will not work on Safari because Safari does not
> support WebRTC which is a requirement for this feature to work.

### What is video collaboration?
Video collaboration on Koding will allow you to interact live with your friend and colleagues. The
feature uses the camera and mic from your device to send and receive live audio/video with the 
users you are collaborating with. If you have ever used Skype or Facetime, then you already know
exactly how this works!

### How do I start a video collaboration session?
As a host, when you start a collaboration session, you can add video to it by clicking the camera
icon as shown in the image below. 

> type:tip
> Only the host can add video to the collaboration session.

![video collaboration 1](video-collab-1.png)

### What controls do I have during a video collaboration session?
If you are in the video session, you have the following handy controls:
1. Mute yourself: clicking this allows you to stop sending audio from you to the other participants in the session. This is handy when you are having a conversation that does not need to be heard by your session participants.
2. Stop video: clicking this allows you to stop sending your video (audio still works) to the other participants in the session. Handy when you've had a bad hair day :)
3. Mute session: clicking this will mute the other participants so that you will not hear them anymore. Handy when you have someone stop by your desk and you need to turn down the conversation from the collaboration session.
4. Leave video: clicking this will end **your** video session but you will **not** be dropping the collaboration session, just the video portion will end. This is handy when you are in a long collaboration session where you don't need to continue to hear/see the session participants but still need to be involved in the session activities.

![video collaboration 2](video-collab-2.png)
