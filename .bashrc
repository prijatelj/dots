#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias lsuc='ls --color=no'
alias grep='grep --color=auto'

# add .local/bin for ipython and possibly any others.
PATH="$PATH:~/.local/bin"

# Set alias for generating a random password
alias randpass='~/.config/custom/scripts/randpass'

# Set alias for viewing tabular files with comma, tabs, or other delimiters
alias csvread='~/.config/custom/scripts/csvread'

# Set alias for creating another terminal at current working directory
alias xorg_cwd='~/.config/custom/scripts/xorg_cwd'

# Aliases for Firefox layout saving and restoring
alias ff_save='~/.config/custom/i3/firefox_save.sh'
alias ff_restore='~/.config/custom/i3/firefox_restore.sh'

# Notre Dame CRC ssh and scp alias examples that use a stored password.
# Highly recommended to have this password be unique to CRC and strong.
# Notre Dame CRC SSH aliases
alias crc_ssh='sshpass -f ~/.ssh/password_keys/nd_crc ssh'
alias crc1='crc_ssh dprijate@crcfe01.crc.nd.edu'
alias crc2='crc_ssh dprijate@crcfe02.crc.nd.edu'
alias crcib='crc_ssh dprijate@crcfeIB01.crc.nd.edu'

alias nd_vpn='openconnect-sso -s vpnaccess.nd.edu/nosplit'

# Notre Dame CRC SCP aliases
#alias crc1_cp='~/.config/custom/scripts/sshpass_scp.sh ~/.ssh/password_keys/nd_crc user@crcfe01.crc.nd.edu'

# Set manpath variable to include local man pages
#export MANPATH="$(manpath):$HOME/.local/share/man/"
export STARSHIP_CONFIG=~/.config/custom/starship.toml
eval $(starship init bash)
