#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Open man pages in vim
export MANPAGER="vim -M +MANPAGER -"

# Exec fish as interactive shell
exec fish
