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
export FZF_DEFAULT_COMMAND="find . -not -name '*.vdi' -type f"
export FZF_DEFAULT_OPTS="--color=fg:#cccccc,fg+:#ffffff,bg:#2d2d2d,bg+:#2d2d2d\
,hl:#99cc99,hl+:#99cc99,preview-fg:#999999,preview-bg:#2d2d2d,gutter:#2d2d2d\
,query:#ffffff,disabled:#999999,info:#ffcc66,border:#999999,prompt:#6699cc\
,pointer:#f2777a,marker:#cc99cc,spinner:#99cc99,header:#ffcc66 \
--preview='cat {}' \
--preview-window=right:60%:sharp:nohidden \
--multi"

# Fix Java applications in dwm
export AWT_TOOLKIT="MToolkit"
wmname LG3D

# Exec fish as interactive shell
exec fish
