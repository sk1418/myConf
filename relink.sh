#!/bin/bash
source var.sh
ln -svf $HOST_CONF_DIR/myZsh.zsh $HOME/.zsh/myZsh.zsh
ln -svf $HOST_CONF_DIR/my.gitconfig $HOME/.gitconfig
ln -svf $HOST_CONF_DIR/my.gitignore $HOME/.gitignore
ln -svf $HOST_CONF_DIR/my.profile $HOME/.profile
ln -svf $HOST_CONF_DIR/my.xinitrc $HOME/.xinitrc 
ln -svf $HOST_CONF_DIR/my.bashrc $HOME/.bashrc
ln -svf $HOST_CONF_DIR/my.bash_profile $HOME/.bash_profile
ln -svf $HOST_CONF_DIR/fonts/* $HOME/fonts/
