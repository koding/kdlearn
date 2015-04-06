---
title: Setting up a Tornado webserver
author: Team Koding
date: 2015-02-26
categories: [frameworks platforms, tornado,python]
template: page.toffee
---

# Setting up a Tornado webserver

## Getting started

Before you can start the Tornado install process, you'll need to update all of the apt-get packages:

```
sudo apt-get update
```

Then make sure you have `pip` installed on your VM. You can install it using the [Koding Package Manager (kpm)](http://learn.koding.com/guides/getting-started-kpm/) like so:

```
kpm install pip
```

## Installing

You can install Tornado using the bellow command:

```
pip install tornado
```

## Usage

To test if you can run a Tornado webserver correctly, create a `goodbyetolocalhost.py` file. Then insert the bellow code snippet:

```
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")

application = tornado.web.Application([
    (r"/", MainHandler),
])

if __name__ == "__main__":
    application.listen(8888, '0.0.0.0')
    tornado.ioloop.IOLoop.instance().start()
```

You can run that script like so:

```
python goodbyetolocalhost.py
```

You will now be able to access the Tornado webserver by following a similar URL:

```
http://KODING_USERNAME.koding.io:8888
```

Find out more about your VM hostname [here](http://learn.koding.com/faq/vm-hostname/).

If you can't reach your project via the browser you have to make sure it listens to 0.0.0.0:8888. You can check this, using the `netstat` command in another terminal window and the bellow command:

```
sudo netstat -tnlp
```

And that's it!

If you encounter any issues or have any questions please drop an email [here](mailto:support@koding.com).
