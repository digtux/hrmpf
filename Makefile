GITVER := $(shell git describe --tags --dirty)
VERSION = 0.22
PREFIX ?= /usr/local
SBINDIR ?= $(PREFIX)/sbin
SHAREDIR ?= $(PREFIX)/share
DRACUTMODDIR ?= $(PREFIX)/lib/dracut/modules.d/01vmklive

SHIN    += $(shell find -type f -name '*.sh.in')
SCRIPTS += $(SHIN:.sh.in=.sh)

%.sh: %.sh.in
	 sed -e "s|@@MKLIVE_VERSION@@|$(VERSION) $(GITVER)|g" $^ > $@
	 chmod +x $@

all: $(SCRIPTS)

install: all
	install -d $(DESTDIR)$(SBINDIR)
	install -m755 mkimage.sh $(DESTDIR)$(SBINDIR)/void-mkimage
	install -m755 mklive.sh $(DESTDIR)$(SBINDIR)/void-mklive
	install -m755 mkrootfs.sh $(DESTDIR)$(SBINDIR)/void-mkrootfs
	install -m755 installer.sh $(DESTDIR)$(SBINDIR)/xb
	install -m755 xb $(DESTDIR)$(SBINDIR)/void-installer
	install -d $(DESTDIR)$(DRACUTMODDIR)
	install -m755 dracut/*.sh $(DESTDIR)$(DRACUTMODDIR)
	install -d $(DESTDIR)$(SHAREDIR)/void-mklive
	install -m644 grub/*.cfg* $(DESTDIR)$(SHAREDIR)/void-mklive
	install -m644 isolinux/*.cfg* $(DESTDIR)$(SHAREDIR)/void-mklive

clean:
	rm -v build-arm-images.sh  build-rootfs.sh  build-x86-images.sh  installer.sh  mkimage.sh  mklive.sh  mkrootfs.sh null-installer.sh


dist:
	@echo "Building distribution tarball for tag: v$(VERSION) ..."
	-@git archive --format=tar --prefix=void-mklive-$(VERSION)/ \
		v$(VERSION) | xz -9 > ~/void-mklive-$(VERSION).tar.xz

.PHONY: all clean install dist
