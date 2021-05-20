# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.1] Q2 2021

- added kas (https://github.com/siemens/kas)
- fix race determining gitversion in ci/pipeline.yaml
- add docker user/password for all docker images used for concourse ci

## [0.1.0] Q4 2020

Initial Version

### Added

- dobi environment template for local builds
- license informations (MIT and Apache V 2.0)
- changelog template
- automated versioning (using elbb/bb-gitversion 0.7.0 + meta-elbb)
- concourse environment for ci/cd builds
- yocto-builder docker image
- dobi jobs to interactively build, build qemu-arm target, run qemu-arm target
- added `default.env`, `local.env.template` and doku how to use it -> enables setting default and local environment variables for `dobi` targets
- added email notification on error/success in concourse pipeline
