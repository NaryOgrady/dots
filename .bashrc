#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# user alias
alias ls='ls --color=auto'
alias py='python'
alias vim='nvim'

# PS1='[\u@\h \W]\$ '

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \[\e[96m\]\w \[\e[34m\]\$(parse_git_branch)\[\e[00m\]$ "

export VISUAL=nvim
export PAGER=more
export JAVA_HOME=/usr/lib/jvm/default

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load ruby version manger
eval "$(rbenv init -)"
