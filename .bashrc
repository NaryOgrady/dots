#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# user alias
alias ls='ls --color=auto'
alias py='python'

# soruce external scripts
source /usr/share/nvm/init-nvm.sh

# PS1='[\u@\h \W]\$ '

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \[\e[96m\]\w \[\e[34m\]\$(parse_git_branch)\[\e[00m\]$ "
