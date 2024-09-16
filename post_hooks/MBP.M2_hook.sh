#!/bin/bash
source var.sh
ln -svf $HOST_BKUP_DIR/karabiner-rules/* $HOME/.config/karabiner/assets/complex_modifications
mkdir -p $HOME/bin
ln -svf $HOST_BKUP_DIR/bin/* $HOME/bin/


