#!/bin/bash

##############################################
#
# the script backups some configuration files
# to current directory depending on the Hostname
#
##############################################

source var.sh

backup_host_bin(){
  echo "Backing up $HOME/bin... "
  rsync -a --safe-links --force --delete-after $HOME/bin  $HOST_BKUP_DIR/
  echo "$HOME/bin... DONE"
}

#======================
# CUPS config
#======================
backup_cups_config(){
  print_sep
  echo "$ME  /etc/cups root password needed[sudo]"
  print_sep
  mkdir -p $HOST_BKUP_DIR/cups > /dev/null 2>&1
  sudo cp -rf /etc/cups/* $HOST_BKUP_DIR/cups/
  sudo chown -R $USER $HOST_BKUP_DIR/cups
  echo "cups Part Done!"
}


#======================
# /etc
#======================
backup_etc_config(){
  print_sep
  echo "$ME /etc "
  print_sep
  mkdir -p $HOST_BKUP_ETC_DIR > /dev/null 2>&1
  ETC_FILES=(/etc/hostname
  /etc/hosts
  /etc/vconsole.conf
  /etc/locale.conf
  /etc/locale.gen
  /etc/pacman.conf
  /etc/mtab
  /etc/fstab
  /etc/grub.d
  /etc/X11
  /etc/modprobe.d
  )
  for f in ${ETC_FILES[@]}; do
    print_step "$f"
    sudo rsync -a --copy-unsafe-links --force --delete-after $f $HOST_BKUP_ETC_DIR/ 
  done
  sudo chown -R $USER $HOST_BKUP_ETC_DIR
  echo "/etc Part Done!"
}

backup_host_bin
backup_etc_config
backup_cups_config

# vim:ts=2 sw=2 et
