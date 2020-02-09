#!/bin/sh

./mklive.sh \
	-T "NullOS" \
	-C "loglevel=6 printk.time=1 consoleblank=0 net.ifnames=0" \
	-r http://alpha.de.repo.voidlinux.org/current \
	-r http://alpha.de.repo.voidlinux.org/current/nonfree \
	-S 1024 \
	-s "xz -Xbcj x86" \
	-B extra/memtest86+-5.01.iso \
	-B extra/grub2.iso \
	-p "$(grep -h '^[^#].' install.packages)" \
	-A "gawk tnftp inetutils-hostname libressl-netcat dash git vim-common curl" \
  -o /out/something.iso
