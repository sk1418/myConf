#!/bin/bash

##############################################
#
# the script backups some configuration files
# to current directory depending on the Hostname
#
##############################################

source var.sh

#===========================
# backup common config files 
#===========================
backup_common(){
	print_sep
	echo "backing up common configs"
	print_sep
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
	for f in ${COMMON_FILES[@]}
	do
		cp -f $HOME/$f $COMMON_DIR
	done
	echo "done!"
}


#======================
# host specific configurations
#======================
backup_host_config(){
	print_sep
	mkdir -p $MY_DOTFILES > /dev/null 2>&1
	print_sep
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
	#cp ssh config and keep directory structure
	mkdir -p $MY_DOTFILES/.ssh
	cp  $HOME/.ssh/config  $MY_DOTFILES/.ssh/config	> /dev/null 2>&1
	echo "done!"
}


#======================
# Arch config files
#======================
backup_arch_config(){
	print_sep
	echo "$ME - Arch configurations {/etc/confs, systemd modules}"
	print_sep
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
backup_cups_config(){
	print_sep
	echo "$ME  /etc/cups root password needed[sudo]"
	print_sep
	mkdir -p $HOST_DIR/cups > /dev/null 2>&1
	sudo cp -rf /etc/cups/* $HOST_DIR/cups/
	sudo chown -R $USER $HOST_DIR/cups
	echo "done!"
}


#======================
# /etc
#======================
backup_etc_config(){
	print_sep
	echo "$ME /etc "
	print_sep
	mkdir -p $HOST_DIR/etc > /dev/null 2>&1
	sudo cp /etc/mtab $HOST_DIR/etc/
	sudo cp /etc/fstab $HOST_DIR/etc/
	sudo chown -R $USER $HOST_DIR/etc
	echo "done!"
}

backup_common
backup_host_config
backup_arch_config
backup_etc_config
backup_cups_config

# vim:ts=2 sw=2
