# startx for only tty1 thru tty3 and when not ssh remote
[[ -z $DISPLAY && $XDG_VTNR -le 3 && -z "$SSH_CLIENT" && -z "$SSH_TTY" ]] && exec startx

# source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
