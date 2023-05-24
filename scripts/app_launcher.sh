#!/bin/bash

if [[ $1 == "audio" ]]; then
  kitty ncpamixer
elif [[ $1 == "joplin" ]]; then
  kitty joplin
elif [[ $1 == "ranger" ]]; then
  kitty ranger
elif [[ $1 == "config" ]]; then
  code ~/work/dots
fi
