if uwsm check may-start 1 2; then
	exec uwsm start hyprland-uwsm.desktop
fi

[[ -z $DISPLAY && $XDG_VTNR -ge 3 && $XDG_VTNR -le 4 ]] && exec startx

# source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
