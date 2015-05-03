---
title: Emmet support in the Koding IDE/Editor
author: Team Koding
categories: [koding features, IDE, koding]
template: page.toffee
---
### What is Emmet?
Emmet (formerly Zen Coding) is a web-developer’s toolkit that can greatly improve HTML & CSS workflow.
Using Emmet, you can type CSS-like expression that dynamically expand to produce valid HTML/CSS syntax thereby
saving you tons of typing time.

### How do I use Emmet?
Follow these steps to get a quick taste of Emmet:
1. Make sure Emmet support is turned on in the [Editor/IDE settings](http://learn.koding.com/guides/ide-introduction/)
1. Open up a new file in the Koding Editor/IDE
2. Save the file as a `.html` file by pressing `Cmd+s` or `Ctrl+s`
3. In the first line of the file, type in:
```
html>head>title>body
```
and hit the `tab` key. Your abbreviated emmet syntax should automatically expand into:
```html
<head>
    <body>
        <head>
            <title>
            </title>
        </head>
    </body>
</html>
```
...that was easy!

You can also do crazy things like:
```
ul#nav>li.item$*4>a{Item $}
```
which then expands into:
```html
<ul id="nav">
    <li class="item1"><a href="">Item 1</a></li>
    <li class="item2"><a href="">Item 2</a></li>
    <li class="item3"><a href="">Item 3</a></li>
    <li class="item4"><a href="">Item 4</a></li>
</ul>
```
As you can see, once you master the emmet syntax, your productivity is vastly improved.

> type:tip
> A full list of Emmet shortcuts is available [here](http://docs.emmet.io/cheat-sheet/) and
> the full documentation is available [here](http://docs.emmet.io/).
