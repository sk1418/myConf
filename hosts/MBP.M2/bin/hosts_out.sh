#!/bin/bash

sudo bash <<EOF 
export BREW=/opt/homebrew
export PATH=$BREW/bin:$BREW/opt/gawk/libexec/gnubin:$BREW/opt/gnu-sed/bin:$PATH
gsed -i "/gleeze\.com/d" /etc/hosts
EOF

dscacheutil -flushcache
