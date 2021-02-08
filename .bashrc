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
export NNN_BMS="r:/;h:$HOME;p:$HOME/projects;a:$HOME/projects/aos-app"
export NNN_PLUG='i:-_head --lines=30 $nnn'
export NNN_COLORS="4123"
export NNN_FCOLORS='0a03040200050608090b0d01'

# fzf
color00='#2d2d2d'
color01='#393939'
color02='#515151'
color03='#999999'
color04='#b4b7b4'
color05='#cccccc'
color06='#e0e0e0'
color07='#ffffff'
color08='#f2777a'
color09='#f99157'
color0A='#ffcc66'
color0B='#99cc99'
color0C='#66cccc'
color0D='#6699cc'
color0E='#cc99cc'
color0F='#a3685a'
colors="--color=fg:$color04,fg+:$color06,bg:$color00,bg+:$color01\
,hl:$color0D,hl+:$color0D,info:$color0A,prompt:$color0A,pointer:$color0C\
,marker:$color0C,spinner:$color0C,header:$color0D"
alias fzf="fzf --color=$colors"

# Fix Java applications in dwm
export AWT_TOOLKIT="MToolkit"
wmname LG3D

# Exec fish as interactive shell
exec fish
