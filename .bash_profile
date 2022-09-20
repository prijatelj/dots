# startx for only tty1 and tty3
[[ -z $DISPLAY && $XDG_VTNR -le 3 ]] && exec startx

# source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
