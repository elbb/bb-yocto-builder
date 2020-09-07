<img src="https://raw.githubusercontent.com/elbb/bb-buildingblock/master/.assets/logo.png" height="200">

# (e)mbedded (l)inux (b)uilding (b)locks - containerized yocto builder environment

This building block provides a way to build your yocto project either locally with dobi or via ci/cd concourse pipeline.
It contains an example to build a "dunfell" poky/openembedded yocto image.

## dunfell poky/openembedded integration

We
```sh
git remote add poky https://git.yoctoproject.org/git/poky
git subtree add --prefix yocto/poky poky dunfell --squash
git remote add meta-openembedded https://github.com/openembedded/meta-openembedded.git
git subtree add --prefix yocto/meta-openembedded meta-openembedded dunfell --squash

./dobi.sh build-yocto-shell
MACHINE=qemuarm bitbake core-image-minimal

```

## using dobi for local build

dobi should only be used via the `dobi.sh` script, because there important variables are set and the right scripts are included.

By default three dobi resources are predefined (but not implemented):

```sh
./dobi.sh build  # build the buildingblock
./dobi.sh test   # run all tests
./dobi.sh deploy # deploy the buildingblock
```

These point to the resources defined in dobi.yaml.
The separation between meta.yaml and dobi.yaml is necessary to integrate the building block into another building block via dobi.

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
