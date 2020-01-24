[![Build Status](https://ci.digtux.com/api/badges/digtux/hrmpf/status.svg)](https://ci.digtux.com/digtux/hrmpf)






# building void ISO in docker

**this is very alpha**

`docker run --privileged=true -v ./out:/out -it digtux/hrmpf-install:master-ee9e4d9a  ./mkhrmpf.sh`

## high level
There are three Dockerfiles currently

* `.base` to make a really simple one with bash basically
* `.mklive` uses base to install the mklive deps (like squasfs, e2fsprogs etc)
* `.install` to **WIP** to download all the packages we will install finally with `mkhrmpf.sh`


## local reproduce

```
docker build -f ./Dockerfile.base    . -t base
docker build -f ./Dockerfile.mklive  . -t mklive
docker build -f ./Dockerfile.install . -t install
# make a dir to store the produced ISO image
mkdir out
docker run --privileged=true -v `pwd -P`/out:/out -it install ./mkhrmpf.sh
```

in theory u don't need any other image than base (or upstream `voidlinux/voidlinux`)
....they're just there for a little cache and building in the cloud ATM




```
     _                    __
    | |_  _ _ _ __  _ __ / _|
    | ' \| '_| '  \| '_ \  _|
    |_||_|_| |_|_|_| .__/_|
                   |_|
```

Welcome to the hrmpf rescue system, built on Void Linux.
This project is based on void-mklive.

#### Dependencies

* xbps>=0.45
* GNU bash

#### Features

* Loads of console standard tools, with a focus on:
   * system rescue
   * maintainance
   * diagnosis
   * networking
   * security
   * ad-hoc setups
   * tiny bits of entertainment if you have to wait for something

* Missing software easily installable via XBPS.

* Non-Linux extra images (only via ISOLINUX):
   * memtest86+
   * iPXE
   * FreeDOS
   * MHDD32 hard disk analysis
   * Bare GRUB 2

* ISO image can be burned on CD or written raw on USB stick.

* Load to RAM option, also bootable as MEMDISK.

* A plain Bash as default shell without annoying fancy configuration.

#### Minimum requirements

* x86-64/EM64T CPU
* 160 MB RAM

#### Usage

To build your own:

    % make
    % ./mkhrmpf.sh
    % linux32 ./mkhrmpf.sh

Download pre-built images at
<https://github.com/leahneukirchen/hrmpf/releases>.

