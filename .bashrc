#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Open man pages in vim
export MANPAGER="vim -M +MANPAGER -"

# nnn settings
export EDITOR="vim"
export NNN_BMS="r:/;h:$HOME;p:$HOME/projects"
export NNN_PLUG='i:-_head --lines=30 $nnn'
export NNN_COLORS="4625"

# Fix Java applications in dwm
export AWT_TOOLKIT="MToolkit"
wmname LG3D

# Exec fish as interactive shell
exec fish
