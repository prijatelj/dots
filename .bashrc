#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# prettify the console prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\][\u\033[01;31m\]@\033[01;35m\]\h]\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\]\033[01;32m\] $git_branch\033[01;35m\]$git_dirty\n\$\[\033[00m\] '

# add .local/bin for ipython and possibly any others.
PATH="$PATH:~/.local/bin"

# Notre Dame CRC ssh and scp alias examples to achieve 'passwordless' useage.
# Notre Dame CRC SSH aliases
alias crc_ssh='sshpass -f .ssh/password_keys/nd_crc ssh'
alias crc1='crc_ssh username@crcfe01.crc.nd.edu'
alias crc2='crc_ssh username@crcfe02.crc.nd.edu'

# Notre Dame CRC SCP aliases
#alias crc1_cp='~/.config/rice/scripts/sshpass_scp.sh ~/.ssh/password_keys/nd_crc user@crcfe01.crc.nd.edu'
