VERSION = 1.43
PN = pulseaudio-ctl

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
SKELDIR = $(PREFIX)/share/$(PN)
RM = rm
Q = @

all:
	$(Q)echo -e '\033[1;32mSetting version\033[0m'
	$(Q)sed -e 's/@VERSION@/'$(VERSION)'/' common/$(PN).in >common/$(PN)

install-bin:
	$(Q)echo -e '\033[1;32mInstalling main script, initd and config...\033[0m'
	install -Dm755 common/$(PN) "$(DESTDIR)$(BINDIR)/$(PN)"
	install -Dm644 common/$(PN).conf.skel "$(DESTDIR)$(SKELDIR)/config.skel"

uninstall:
	$(RM) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(Q)$(RM) -rf "$(DESTDIR)$(SKELDIR)"

install: install-bin
