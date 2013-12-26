#!/bin/bash

##############################################
#
# the script backups some configuration files
# to current directory depending on the Hostname
#
##############################################

#get current path
script_path="${BASH_SOURCE[0]}"
if ([ -L "${script_path}" ]) then
  while ([ -L "${script_path}" ]) do script_path=$(readlink "${script_path}"); done
fi
pushd . > /dev/null
cd $(dirname ${script_path}) > /dev/null
script_path=$(pwd)

ME=$(hostname)

ROOT_DIR=$script_path
COMMON_DIR="$ROOT_DIR/common"
HOST_DIR="$ROOT_DIR/$ME"
MY_DOTFILES="$HOST_DIR/dotfiles"
MY_Arch="$HOST_DIR/arch"

PRINT_SEP(){
  echo "----------------------------------------------"
}
#===========================
# backup common config files 
#===========================
BACKUP_COMMON(){
  PRINT_SEP
  echo "backing up common configs"
  PRINT_SEP
  mkdir -p $COMMON_DIR >/dev/null 2>&1
  COMMON_FILES=(.Xdefaults
								.Xresources
								.zshrc
								.screenrc
								.tmux.conf
								.vimrc
								.Xmodmap
								.profile
								base.vimrc
								.ctags)
  for f in ${COMMON_FILES[@]}; do
    cp -f $HOME/$f $COMMON_DIR
  done
  echo "done!"
}


#======================
# host specific configurations
#======================
BACKUP_HOST_CONFIG(){
  PRINT_SEP
  mkdir -p $MY_DOTFILES > /dev/null 2>&1
  PRINT_SEP
  HOST_FILES=(.bashrc
							.xinitrc 
							.hgrc
							.hgignore
							.gitconfig
							.gitignore)
  for f in ${HOST_FILES[@]}; do
    cp -f $HOME/$f $MY_DOTFILES/.
  done
  rsync -arv --exclude=".zsh_*"  $HOME/.zsh $MY_DOTFILES/
# rsync -arv $HOME/.vim $MY_DOTFILES/ #don't sync .vim/backups for privcy reason
  echo "done!"
}


#======================
# Arch config files
#======================
BACKUP_ARCH_CONFIG(){
  PRINT_SEP
  echo "$ME - Arch configurations {/etc/confs, systemd modules}"
  PRINT_SEP
  mkdir -p $MY_Arch > /dev/null 2>&1
  mkdir -p "$MY_Arch/systemd/confs" > /dev/null 2>&1


	ARCH_FILES=(/etc/hostname
							/etc/hosts
							/etc/vconsole.conf
							/etc/locale.conf
							/etc/locale.gen
							)

  for f in ${ARCH_FILES[@]}; do
    cp -f $f  "$MY_Arch/systemd/confs/" > /dev/null 2>&1
  done
  sudo rsync -arv /etc/modules-load.d "$MY_Arch/systemd/" 
  sudo chown -R $USER "$MY_Arch/systemd"
  echo "done!"
}

#======================
# CUPS config
#======================
BACKUP_CUPS_CONFIG(){
  PRINT_SEP
  echo "$ME  /etc/cups root password needed[sudo]"
  PRINT_SEP
  mkdir -p $HOST_DIR/cups > /dev/null 2>&1
  sudo cp -rf /etc/cups/* $HOST_DIR/cups/
  sudo chown -R $USER $HOST_DIR/cups
  echo "done!"
}


BACKUP_COMMON
BACKUP_HOST_CONFIG
BACKUP_ARCH_CONFIG
BACKUP_CUPS_CONFIG

# vim:ts=2 sw=2
