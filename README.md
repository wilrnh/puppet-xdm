# xdm

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with xdm](#setup)
    * [What xdm affects](#what-xdm-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with xdm](#beginning-with-xdm)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module to manage the installation and configuration of XDM - the X Display Manager.

## Module Description

xdm manages a collection of X servers, which may be on the local host or remote machines. It provides services similar to those provided by init, getty, and login on character-based terminals: prompting for login name and password, authenticating the user, and running a session. xdm supports XDMCP (X Display Manager Control Protocol) and can also be used to run a chooser process which presents the user with a menu of possible hosts that offer XDMCP display management.

This module manages the installation and configuration of XDM.

## Setup

### What xdm affects

- XDM package
- XDM service

### Beginning with xdm

To get started with this module, simply include it in your manifest:

```puppet
include ::xdm
```

## Usage

## Reference

### Public Classes

`xdm`: Initializes the module

### Parameters

##### ::xdm

`package_ensure`: Passed directly on to Puppet's `package` type `ensure` parameter. Defaults to `present`.

`service_ensure`: Passed directly on to Puppet's `service` type `ensure` parameter. Defaults to `running`.

`xdm_config_append`: Array of lines to append to xdm-config file. Defaults to empty array.

## Limitations

This module is currently only tested on Ubuntu 14.04 (Trusty.)

## Development

Pull requests are always awesome.
