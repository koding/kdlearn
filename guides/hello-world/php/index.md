---
title: PHP
author: Team Koding
date: 2015-03-03
categories: [first program, hello world, php, koding]

series: hello-world
series-index: 6
template: series.toffee
---

# Hello world in PHP

## Introduction

PHP is a server-side scripting language designed for web development but also used as a general-purpose programming language. PHP code can be simply mixed with HTML code, or it can be used in combination with various templating engines and web frameworks.

## Implementation

The first thing you need to do is to create a file called `helloworld.php`, place it in your Web folder and paste the bellow snippet into it.

```
<html>
	<head>
	<title>Hello World</title>
	</head>
	<body>
        <?php
            echo "Hello World";
        ?>
    </body>
</html>
```

To run the above file in your Koding VM, follow a similar URL in your browser:

```
http://KODING_USERNAME.koding.io/helloworld.php
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

## Explanation

The first part until the initial `<?php` tag is just basic HTML code.

```
<?php

?>
```

You need to tell the server when the PHP will start and end. In PHP you use the tags `<?php` and `?>` to mark the start and end for the PHP code that the server must execute.

```
echo "Hello World";
```

`echo` outputs one or more strings. `echo` is not actually a function (it is a language construct). `echo` does not behave like a function, so it cannot always be used in the context of a function.

The last part after the closing `?>` tag if just basic HTML code.

And that's it!

You just wrote and ran your first Hello World in PHP.
