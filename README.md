closure-gun [![NPM version][npm-image]][npm-url]
====

This gets around the long startup time of [Google Closure Compiler](https://developers.google.com/closure/compiler/) using [Nailgun](http://www.martiansoftware.com/nailgun/), which runs a single java process in the background and keeps all of the classes loaded.

## Installation:

* Required: Maven (`mvn`) and C++ Compiler (`gcc` or `clang`)
* Supported environment: OS X and Linux

```sh
$ npm install closure-gun
```

## Usage:

```sh
$ closure-gun --js script.js --js_output_file script.min.js
```

#### closure-gun (fork fast-closure-compiler2) vs. fast-closure-compiler:

Folked because the original [fast-closure-compiler](https://github.com/evanw/fast-closure-compiler) is not maintained.

The advantages are:

* Support latest Closure Compiler and Nailgun
* Support OS X 10.9+ (tested 10.10/10.11)
* Support Linux environment in addition to OS X
* Expose `closure-gun` as global command instead of `closure`


## License:

[The MIT License (MIT)](http://denji.mit-license.org/)

## Author:

* Teppei Sato <teppeis@gmail.com>
* Denis Denisov <denji@users.noreply.github.com>

[npm-image]: https://img.shields.io/npm/v/closure-gun.svg
[npm-url]: https://npmjs.org/package/closure-gun
