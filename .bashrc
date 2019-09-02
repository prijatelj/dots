#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# prettify the console prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\][\u\033[01;31m\]@\033[01;35m\]\h]\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\]\033[01;32m\] $git_branch\033[01;35m\]$git_dirty\n\$\[\033[00m\] '


# alias ipython='~/.local/bin/ipython'
