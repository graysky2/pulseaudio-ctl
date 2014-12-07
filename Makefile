VERSION = 1.48
PN = pulseaudio-ctl

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1
SKELDIR = $(PREFIX)/share/$(PN)
RM = rm
Q = @

all:
	$(Q)echo -e '\033[1;32mSetting version\033[0m'
	$(Q)sed -e 's/@VERSION@/'$(VERSION)'/' common/$(PN).in >common/$(PN)

clean:
	$(RM) -f common/$(PN)

install-bin:
	$(Q)echo -e '\033[1;32mInstalling main script, initd and config...\033[0m'
	install -Dm755 common/$(PN) "$(DESTDIR)$(BINDIR)/$(PN)"
	install -Dm644 common/config.skel "$(DESTDIR)$(SKELDIR)/config.skel"

install-man:
	$(Q)echo -e '\033[1;32mInstalling manpage...\033[0m'
	install -Dm644 doc/$(PN).1 "$(DESTDIR)$(MANDIR)/$(PN).1"
	gzip -9 "$(DESTDIR)$(MANDIR)/$(PN).1"

uninstall:
	$(RM) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(RM) "$(DESTDIR)$(MANDIR)/$(PN).1.gz"
	$(RM) -rf "$(DESTDIR)$(SKELDIR)"

install: install-bin install-man

.PHONY: clean install-bin install-man uninstall
