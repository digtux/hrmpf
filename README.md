[![Build Status](https://ci.digtux.com/api/badges/digtux/hrmpf/status.svg)](https://ci.digtux.com/digtux/hrmpf)


     _                    __ 
    | |_  _ _ _ __  _ __ / _|
    | ' \| '_| '  \| '_ \  _|
    |_||_|_| |_|_|_| .__/_|
                   |_|       

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

