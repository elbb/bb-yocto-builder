<img src="https://raw.githubusercontent.com/elbb/bb-buildingblock/master/.assets/logo.png" height="200">

# (e)mbedded (l)inux (b)uilding (b)locks - containerized yocto builder environment

This building block provides a way to build your yocto project either locally with dobi or via ci/cd concourse pipeline. In both cases the image is build in a containerized environment.
It contains an example to build a poky/openembedded yocto image with systemd as system and service manager. It uses the long term support release "dunfell".

## how to use this building block to bootstrap your yocto project.

Clone this repository together with its submodules. \
`git clone --recursive https://github.com/elbb/bb-yocto-builder.git`

Poky and the openembedded layers are integrated as submodules in  directory `./yocto`. Use this directory to add additional needed layers.
If you add additional or modify layers, you have to adapt `./yocto-conf/bblayers.conf` accordingly.

`./yocto/version` is a small layer which includes a `os-release.bbappend` file which adds the implicit generated version information via `./dobi.sh` into the yocto image.

In `./yocto-conf` you find a preconfigured yocto `local.conf` + `bblayers.conf` you can use as starting point for your image configuration.


To start an interactive build shell, run \
```bash
./dobi.sh build-yocto-shell-interactive
```
E.g. to build [`core-image-minimal`](https://wiki.yoctoproject.org/wiki/Image_Recipes#core-image-minimal) for target `qemuarm`, type:
```bash
MACHINE=qemuarm bitbake core-image-minimal
```

## Using dobi for local build

### Prerequisites

* [dobi](https://github.com/dnephin/dobi)
* [docker](https://docs.docker.com/install)
* [qemu-user-static](https://github.com/multiarch/qemu-user-static#getting-started)

dobi should only be used via the `dobi.sh` script, because there important variables are set and the right scripts are included.

The following dobi resources are available:

```sh

./dobi.sh version      #generate version informations (auto called by dobi.sh)
./dobi.sh build        #build yocto image core-image-minimal for target qemuarm
./dobi.sh interactive  #start interactive yocto build shell
./dobi.sh test         #run yocto core-image-minimal for target qemuarm interactively

```

Version informations are generated automatically from git history by using building block bb-gitversion (<https://github.com/elbb/bb-gitversion>).

# What is embedded linux building blocks

embedded linux building blocks is a project to create reusable and
adoptable blueprints for highly recurrent issues in building an internet
connected embedded linux system.

# License

Licensed under either of

* Apache License, Version 2.0, (./LICENSE-APACHE or <http://www.apache.org/licenses/LICENSE-2.0>)
* MIT license (./LICENSE-MIT or <http://opensource.org/licenses/MIT>)

at your option.

# Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms or
conditions.

Copyright (c) 2020 conplement AG
