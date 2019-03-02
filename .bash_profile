# startx for only tty1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
