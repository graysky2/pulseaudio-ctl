VERSION = 1.60
PN = pulseaudio-ctl

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1
SKELDIR = $(PREFIX)/share/$(PN)
ZSHDIR = $(PREFIX)/share/zsh/site-functions
RM = rm
Q = @

all: common/$(PN) doc/$(PN).1.gz

common/$(PN): common/$(PN).in
	$(Q)echo -e '\033[1;32mSetting version\033[0m'
	$(Q)sed -e 's/@VERSION@/'$(VERSION)'/' common/$(PN).in >common/$(PN)
	$(Q)sed -i common/$(PN) -e 's|@SKELDIR@|'$(SKELDIR)'|'

doc/$(PN).1.gz: doc/$(PN).1
	$(Q)echo -e '\033[1;32mCompressing manpage\033[0m'
	gzip -9 -c doc/$(PN).1 > doc/$(PN).1.gz

clean:
	$(RM) -f common/$(PN)
	$(RM) -f doc/$(PN).1.gz

install-bin:
	$(Q)echo -e '\033[1;32mInstalling main script, initd and config...\033[0m'
	install -Dm755 common/$(PN) "$(DESTDIR)$(BINDIR)/$(PN)"
	install -Dm644 common/config.skel "$(DESTDIR)$(SKELDIR)/config.skel"
	install -p -dm755 "$(DESTDIR)$(ZSHDIR)"
	install -Dm644 common/zsh-completion "$(DESTDIR)$(ZSHDIR)/_pulseaudio-ctl"

install-man:
	$(Q)echo -e '\033[1;32mInstalling manpage...\033[0m'
	install -Dm644 doc/$(PN).1.gz "$(DESTDIR)$(MANDIR)/$(PN).1.gz"

uninstall:
	$(RM) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(RM) "$(DESTDIR)$(MANDIR)/$(PN).1.gz"
	$(RM) -rf "$(DESTDIR)$(SKELDIR)"
	$(RM) "$(DESTDIR)$(ZSHDIR)/_pulseaudio-ctl"

install: all install-bin install-man

.PHONY: all clean install-bin install-man uninstall
