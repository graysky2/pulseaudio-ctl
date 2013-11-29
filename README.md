# Pulseaudio-ctl
Simple bash script to allow for control of pulseaudio without alsautils. Simply map the following to keyboard shortcuts in your DE or WM. Xfce4 allows for this under Settings > Keyboard > Application Shortcuts.

	/usr/bin/pulseaudio-ctl mute  ==>  Toggle status of mute
	/usr/bin/pulseaudio-ctl up    ==>  Increase vol by 5 %
	/usr/bin/pulseaudio-ctl down  ==>  Decrease vol by 5 %

## Links
AUR package: https://aur.archlinux.org/packages/pulseaudio-ctl

## for awesome window manager volume control with status mode

in your rc.lua

	-- volume
	require("farhavens-puleaudio")

	tb_volume = widget({ type = "textbox", name = "tb_volume", align = "right" })
	tb_volume:buttons({
	  button({ }, 4, function () volume("up", tb_volume) end),
	  button({ }, 5, function () volume("down", tb_volume) end),
	  button({ }, 1, function () volume("mute", tb_volume) end)
	})

	add tb_volume to your widgets

	-- volume keys
	awful.key({ }, "XF86AudioRaiseVolume",function () volume("up", tb_volume) end),
	awful.key({ }, "XF86AudioLowerVolume",function  () volume("down", tb_volume) end),
	awful.key({ }, "XF86AudioMute",function  () volume("mute", tb_volume) end),

	-- other keys
	awful.key({ modkey,           }, "F7",function () volume("up", tb_volume) end),
	awful.key({ modkey,           }, "F6",function  () volume("down", tb_volume) end),
	awful.key({ modkey,           }, "F5",function  () volume("mute", tb_volume) end),



