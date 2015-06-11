---
title: Is there a Terminal command to open files in Editor? 
importance: 2
---

The `kdopen` command does just that! 

First you need to install `kdopen` using our `kpm` [package manager](http://learn.koding.com/guides/getting-started-kpm/). Type the following command in Terminal to set up the required components for `kdopen`:
```
kpm install kdbin
```
> type:tip
> If kpm itself is not installed, you can install it using the command 
> `curl -sSL learn.koding.com/kpm.sh | sh`

Once `kdbin` is installed, you can now type the following command in Terminal
to open a file in the Koding Editor:
```
kdopen <filename>
```

`kdopen` supports wildcards so if you type:
```
kdopen *.html
```
it will open each file with the extension .html (in the current directory) in its own tab on the Editor.

If you are opening a file that does not exist, `kdopen` will create the file first
and then open it up. The file will be created in the current directory.

<center>
<iframe width="650" height="445" src="https://www.youtube.com/embed/sns_0UZhxi8" frameborder="0" allowfullscreen></iframe>
</center>
