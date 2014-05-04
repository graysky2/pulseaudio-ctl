# Pulseaudio-ctl
Simple bash script to allow for control of pulseaudio without alsautils. Simply map the following to keyboard shortcuts in your DE or WM. Xfce4 allows for this under Settings > Keyboard > Application Shortcuts.

	/usr/bin/pulseaudio-ctl mute        ==>  Toggle status of mute
	/usr/bin/pulseaudio-ctl mute-input  ==>  Toggle status of mute for mic
	/usr/bin/pulseaudio-ctl up          ==>  Increase vol by 5 %
	/usr/bin/pulseaudio-ctl down        ==>  Decrease vol by 5 %
	/usr/bin/pulseaudio-ctl set 40      ==>  Set vol to 40%
	/usr/bin/pulseaudio-ctl atmost 30   ==>  Set vol to 30% if current higher than that

## Configuration
There is only one configurable option: `UPPER_THRESHOLD`, which should be tuned in file `config`, placed in `XDG_CONFIG_HOME` which usually is ~/.config/ in directory pulseaudio-ctl. So usually full path will be ~/.config/pulseaudio-ctl/config

Example:
```bash
# let us increase volume up to 150%
export UPPER_THRESHOLD=150
```

If config file isn't present script uses default value 100.

One-liner for make it work with config
```bash
(export TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config/}/pulseaudio-ctl"; mkdir -p "$TARGET_DIR"; echo 'export UPPER_THRESHOLD=150' >> "${TARGET_DIR}/config")
```

## Links
AUR package: https://aur.archlinux.org/packages/pulseaudio-ctl
