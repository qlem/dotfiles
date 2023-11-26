#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# ghcup-env
[ -f "/home/qlem/.ghcup/env" ] && source "/home/qlem/.ghcup/env"

# local bin
export PATH=$PATH:~/.local/bin

# nvim
export PATH=$PATH:~/.local/neovim/bin

# github cli
export PATH=$PATH:~/.local/github-cli/bin

# Added by Toolbox App
export PATH="$PATH:/home/qlem/.local/share/JetBrains/Toolbox/scripts"

# node
export PATH=$PATH:/opt/node/bin

# mongo db tools
export PATH=$PATH:~/.local/mongodb-database-tools/bin

# Open man pages in vim
export MANPAGER="nvim +Man!"
export MANWIDTH=999

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
# export AWT_TOOLKIT="MToolkit"
# wmname LG3D

# Exec fish as interactive shell
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
    exec fish $LOGIN_OPTION
fi
