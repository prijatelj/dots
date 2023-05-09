#!/bin/sh

userresources=$HOME/.config/custom/Xresources
usermodmap=$HOME/.config/custom/Xmodmap
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
        -DTHEME="<$userresources.d/theme>" \
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

# Add .config/custom/scripts for personal custom scripts.
export PATH="~/.config/custom/scripts:$PATH"

#xrandr --output DP-2 --auto --output DVI-I-1 --auto --right-of DP-2
picom -CGb --config $HOME/.config/custom/picom.conf
$HOME/.config/custom/fehbg.sh &
unclutter --timeout 2 &

# Set the initial screen brightness
brightnessctl s 1

# Set initial volume via ALSA
amixer -q sset Master 20% unmute

i3 -c $HOME/.config/custom/i3/config
