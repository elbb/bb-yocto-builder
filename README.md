<img src="https://raw.githubusercontent.com/elbb/bb-buildingblock/master/.assets/logo.png" height="200">

# (e)mbedded (l)inux (b)uilding (b)locks - containerized yocto builder environment

This building block provides a way to build your yocto project either locally with dobi or via ci/cd concourse pipeline. In both cases the image is build in a containerized environment.
It contains an example to build a poky/openembedded yocto image with systemd as system and service manager. It currently uses the long term support yocto release "dunfell".

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
The yocto build artefacts `images`, `licenses` and `rpm` are located in `./gen/yocto-deploy`.

Version informations are generated automatically from git history by using building block bb-gitversion (<https://github.com/elbb/bb-gitversion>).

#### Testing

```sh
./dobi.sh test
```
will run the yocto `core-image-minimal` for target `qemuarm` in a docker container. Login as `root` without password. To exit this test environment stop the qemu machine, via
```
poweroff
```

## How to use this building block to bootstrap your yocto project.

Clone this repository together with its submodules. \
`git clone --recursive https://github.com/elbb/bb-yocto-builder.git`

Poky and the openembedded layers are integrated as submodules in  directory `./yocto`. Use this directory to add additional needed layers.
If you add additional or modify layers, you have to adapt `./yocto-conf/bblayers.conf` accordingly.

`./yocto/version` is a small layer which includes a `os-release.bbappend` file which adds the implicit generated version information via `./dobi.sh` into the yocto image (`/etc/os-release`).

In `./yocto-conf` you find a preconfigured yocto `local.conf` + `bblayers.conf` you can use as starting point for your image configuration.

To start an interactive build shell, run \
```bash
./dobi.sh interactive
```
E.g. to build [`core-image-minimal`](https://wiki.yoctoproject.org/wiki/Image_Recipes#core-image-minimal) for target `qemuarm`, type:
```bash
MACHINE=qemuarm bitbake core-image-minimal
```

## Using concourse CI for a CI/CD build

The pipeline file must be uploaded to concourse CI via `fly`.
Enter the build users ssh private key into the file `ci/credentials.template.yaml` and rename it to `ci/credentials.yaml`.

**Note: `credentials.yaml` is ignored by `.gitignore` and will not be checked in.**

In further releases there will be a key value store to keep track of the users credentials.
Before setting the pipeline you might login first to your concourse instance `fly -t <target> login --concourse-url http://<concourse>:<port>`. See the [fly documentation](https://concourse-ci.org/fly.html) for more help.
Upload the pipeline file with fly:

    $ fly -t <target> set-pipeline -n -p bb-yocto-builder -l ci/config.yaml -l ci/credentials.yaml -c pipeline.yaml

After successfully uploading the pipeline to concourse CI login and unpause it. After that the pipeline should be triggered by new commits on the master branch (or new tags if enabled in `pipeline.yaml`).

# Troubleshooting

## Yocto build returns filesystem ERROR

```bash
ERROR: No space left on device or exceeds fs.inotify.max_user_watches?
```
Check `inotify.max_user_watches` with:
```bash
sysctl -n fs.inotify.max_user_watches
```
When this limit is not enough to monitor all files inside a directory, the limit must be increased for Listen to work properly.

You can set a new limit temporary with:

```bash
sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl -p
```

If you like to make your limit permanent, use:

```bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

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
