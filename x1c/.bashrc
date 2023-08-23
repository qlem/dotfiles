#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
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

# open man pages in vim
export MANPAGER="nvim +Man!"
export MANWIDTH=999

# exec fish as interactive shell
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
    exec fish $LOGIN_OPTION
fi
