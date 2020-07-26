#!/bin/sh

userresources=$HOME/.config/rice/Xresources
usermodmap=$HOME/.config/rice/Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb \
        -DCOLOR_SCHEME="<$userresources.d/myth>" \
        -DFONTS="<$userresources.d/fonts>" \
        -DURXVT="<$userresources.d/urxvt>" \
        -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output DP-2 --auto --output DVI-I-1 --auto --right-of DP-2
picom -CGb --config $HOME/.config/rice/picom.conf
$HOME/.config/rice/fehbg.sh &
unclutter --timeout 2 &
i3 -c $HOME/.config/rice/i3/config

# Set initial volume via ALSA or Pulse Audio
#amixer -q sset Master,0 20
