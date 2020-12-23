#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# rbenv ruby version fix
eval "$(rbenv init -)"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

