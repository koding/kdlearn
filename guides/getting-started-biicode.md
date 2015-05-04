---
author: drodri
username: drodri
categories: [first program, C/C++]
---

# Building C / C++ applications with biicode

Building larger applications can be somewhat difficult and cumbersome to the newbie.
As soon as your application start to have several files, you will need to define
how to build them in Makefiles or using the [CMake build system][cmake].

We will be using in the following examples [biicode][biicode], which is a dependency manager
that allows to easily retrieve existing code and also manages to automatically generate
build files for your project.

## Install biicode

You can install it running from your [terminal][terminal]:
```
$ wget http://apt.biicode.com/install.sh && chmod +x install.sh && ./install.sh
```

After it finishes, you can run a helper command that install an updated version of CMake:
```
$ bii setup:cpp
```

## Build you application

Lets build an application that computes the SHA1 of a string. Usually you don't want to write
yourself such algorithm, but rather use an existing implementation.

### Create a project

Create a simple project:

```
$ bii init mycppcrypto -L
$ cd my_cpp_project
```

Now you are inside a new block called "mycppcrypto". Let's place some code in!

Create a new *main.cpp* file and place the code below:

```
#include "cryptopp/cryptopp/sha.h"
#include "cryptopp/cryptopp/filters.h"
#include "cryptopp/cryptopp/hex.h"
#include <iostream>
#include <string>

int main() {
	CryptoPP::SHA1 sha1;
	std::string source = "Hello";
	std::string hash = "";
	CryptoPP::StringSource(source, true, new CryptoPP::HashFilter(sha1,
							new CryptoPP::HexEncoder(new CryptoPP::StringSink(hash))));
	std::cout << hash << std::endl;
}
```
### Manage your dependencies

If you now try to build this example, it will fail. You can try to do so, and then check
your dependencies with **bii deps**:

```
$ bii build
$ ... #ERROR
$ bii deps
  user/mycppcrypto depends on:
       system:
          iostream
          string
       unresolved:
          cryptopp/cryptopp/filters.h
          cryptopp/cryptopp/hex.h
          cryptopp/cryptopp/sha.h
```

The code depends on some external code, the Crypto++ library. With **bii find** command biicode will easily retrieve dependencies:

```
$ bii find
...
INFO: All dependencies resolved
Find resolved new dependencies:
        cryptopp/cryptopp: 8
INFO: Saving files from: cryptopp/cryptopp
```
### Build the project

Now you can build and run it:

```
$ bii build
$ ./bin/myuser_crypto_main
F7FF9E8B7BB2E09B70935A5D785E0CC5D9D0ABF0
```
That is the encryption code for the "hello" string!

For further examples, you can have a look to the [biicode C/C++ documentation][biicodedocs] and the
[examples][biicodeexamples].

Got any doubts using biicode in your projects? Do not hesitate to [contact us][contact-us] or visit our [forum][forum]. We're available at [Stackoverflow tag][stackoverflow] too.



[koding]: https://koding.com
[ace]: https://koding.com/Ace
[terminal]: https://koding.com/Terminal
[cmake]: http://www.cmake.org/
[biicode]: https://www.biicode.com/
[biicodedocs]: http://docs.biicode.com/c++.html
[biicodeexamples]: http://docs.biicode.com/c++/examples.html
[stackoverflow]: http://stackoverflow.com/questions/tagged/biicode
[contact-us]: http://web.biicode.com/contact-us/
[forum]: http://forum.biicode.com/