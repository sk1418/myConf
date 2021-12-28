#!/bin/sh
source $HOME/.zsh/myZsh.zsh
env LD_PRELOAD=/usr/lib/libcurl.so.3 /usr/bin/slack --disable-gpu %U
