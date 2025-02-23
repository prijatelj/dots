[[ uwsm check may-start N 1 2 ]] && exec uwsm start hyprland.desktop

[[ -z $DISPLAY && $XDG_VTNR -ge 3 && $XDG_VTNR -le 4 ]] && exec startx

# source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
