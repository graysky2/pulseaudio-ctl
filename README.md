# Pulseaudio-ctl
Simple bash script to allow for control of pulseaudio without alsautils. Simply map the following to keyboard shortcuts in your DE or WM. Xfce4 allows for this under Settings > Keyboard > Application Shortcuts.

	/usr/bin/pulseaudio-ctl mute        ==>  Toggle status of mute
	/usr/bin/pulseaudio-ctl mute-input  ==>  Toggle status of mute for mic
	/usr/bin/pulseaudio-ctl up          ==>  Increase vol by 5 %
	/usr/bin/pulseaudio-ctl down        ==>  Decrease vol by 5 %
	/usr/bin/pulseaudio-ctl set 40      ==>  Set vol to 40%
	/usr/bin/pulseaudio-ctl atmost 30   ==>  Set vol to 30% if current higher than that

## Links
AUR package: https://aur.archlinux.org/packages/pulseaudio-ctl
