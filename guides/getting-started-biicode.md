---
author: drodri
date: 2014-08-01
categories: [C, C++]
---


## Building C / C++ applications with biicode

Building larger applications can be somewhat difficult and cumbersome to the newbie.
As soon as your application start to have several files, you will need to define
how to build them in Makefiles or using the [CMake build system][cmake].

We will be using in the following examples [biicode][biicode], which is a dependency manager
that allows to easily retrieve existing code and also manages to automatically generate
build files for your project.

You can install it running from your [terminal][terminal]:

```
http://apt.biicode.com/install.sh && chmod +x install.sh && ./install.sh
```

After it finish, you can run a helper command that install an updated version of CMake:
```
bii setup:cpp
```

Lets build an application that computes the SHA1 of a string. Usually you dont want to write
yourself such algorithm, but rather use an existing implementation.

The following commands will create a project and a "Hello world" file, which you can build and
run:

```
bii init cryptoproject
bii new myuser/crypto --hello=cpp
bii cpp:build
./bin/myuser_crypto_main
Hello world!
```

Now replace the contents of the "main.cpp" file inside the blocks/myuser/crypto folder with:

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

If you now try to build this example, it will fail. You can try to do so, and then check
your dependencies:
```
$ bii cpp:build
$ bii deps
```

The code depends on some external code, the Crypto++ library. This can be easily retrieved
with the "find" command

```
$ bii find
```

Now you can build and run it:
```
$ bii cpp:build
$ ./bin/myuser_crypto_main
F7FF9E8B7BB2E09B70935A5D785E0CC5D9D0ABF0
```


For further examples, you can have a look to the [biicode C/C++ documentation][biicodedocs] and the 
[examples][biicodeexamples]



[koding]: https://koding.com
[ace]: https://koding.com/Ace
[terminal]: https://koding.com/Terminal
[cmake]: http://www.cmake.org/
[biicode]: https://www.biicode.com/
[biicodedocs]: http://docs.biicode.com/c++.html
[biicodeexamples]: http://docs.biicode.com/c++/examples.html

