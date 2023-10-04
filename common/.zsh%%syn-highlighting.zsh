#!/bin/zsh
LIB_DIR=$HOME/lib
SYNTAX_HL=$LIB_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f $SYNTAX_HL ] && source $SYNTAX_HL
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets line)
ZSH_HIGHLIGHT_STYLES[line]='bold'

