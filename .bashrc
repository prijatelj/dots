#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias lsuc='ls --color=no'
alias grep='grep --color=auto'

# prettify the console prompt
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # If remote ssh session use a different color scheme
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]{\u\033[01;35m\]@\033[01;33m\]\h}\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\]\033[01;32m\] $git_branch\033[01;35m\]$git_dirty\n\$\[\033[00m\] '
else
    # Default colorscheme
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\][\u\033[01;31m\]@\033[01;35m\]\h]\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\]\033[01;32m\] $git_branch\033[01;35m\]$git_dirty\n\$\[\033[00m\] '
fi

# add .local/bin for ipython and possibly any others.
PATH="$PATH:~/.local/bin"

# Set alias for generating a random password
alias randpass='~/.config/rice/scripts/randpass.sh'

# Set alias for viewing tabular files with comma, tabs, or other delimiters
alias csvread='~/.config/rice/scripts/csvread.sh'

# Notre Dame CRC ssh and scp alias examples that use a stored password.
# Highly recommended to have this password be unique to CRC and strong.
# Notre Dame CRC SSH aliases
alias crc_ssh='sshpass -f ~/.ssh/password_keys/nd_crc ssh'
alias crc1='crc_ssh username@crcfe01.crc.nd.edu'
alias crc2='crc_ssh username@crcfe02.crc.nd.edu'

alias nd_vpn='openconnect-sso -s vpnaccess.nd.edu/nosplit'

# Notre Dame CRC SCP aliases
#alias crc1_cp='~/.config/rice/scripts/sshpass_scp.sh ~/.ssh/password_keys/nd_crc user@crcfe01.crc.nd.edu'

# Set manpath variable to include local man pages
#export MANPATH="$(manpath):$HOME/.local/share/man/"
