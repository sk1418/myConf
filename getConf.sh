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
	echo "Backing up common configs"
	print_sep
	mkdir -p $COMMON_DIR >/dev/null 2>&1
	COMMON_FILES=(.Xdefaults
	.Xresources
	.zshrc
	.screenrc
	.tmux.conf
	.vimrc
	.config/nvim/init.vim
	.config/nvim/ginit.vim
	.Xmodmap
	base.vimrc
	.ctags
	.todo
	.bcrc
	firefoxProxy.pac
	)
	COMMON_DOT_ZSH_FILES="$HOME/.zsh/completion"
	for f in ${COMMON_FILES[@]}
	do
		f_tr=""
		if [[ ! $f == ".todo" ]]; then #exclude directories
			f_tr=$(sed 's@/@%%@g' <<< "$f")
		fi
		print_step "$f_tr"

		#backup ~/.x/y/z -> COMMON/.x%%y%%z
		rsync -a --force --exclude="todo.txt" --exclude="$HOME/.zsh/myZsh.zsh" $HOME/$f $COMMON_DIR/$f_tr
	done

	DOT_ZSH_DIR="$HOME/.zsh"
	print_step "$DOT_ZSH_DIR excluding .zsh/.zsh-* and .zsh/.zsh_*"
	rsync -a --exclude="myZsh.zsh" --exclude=".zsh_*" --exclude=".zsh-*" $DOT_ZSH_DIR $COMMON_DIR

	echo "Common Part Done!"
}


#======================
# host specific configurations
#======================
backup_host_config(){
	print_sep
	echo "Backing up Host specific configs"
	print_sep
	rsync -a --force --delete-after $HOST_CONF_DIR  $HOST_BKUP_DIR/
	#cp ssh config and keep directory structure
	mkdir -p $HOST_BKUP_DIR/.ssh
	cp  $HOME/.ssh/config  $HOST_DOTFILES/.ssh/config	> /dev/null 2>&1
	echo "Backing up HOME/bin... "
	rsync -a --safe-links --force --delete-after $HOME/bin  $HOST_BKUP_DIR/

	echo "Host-spec Part Done!"
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
	mkdir -p $HOST_ETC > /dev/null 2>&1
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
		sudo rsync -a --copy-unsafe-links --force --delete-after $f $HOST_ETC/ 
	done
	sudo chown -R $USER $HOST_ETC
	echo "/etc Part Done!"
}

backup_common
backup_host_config
backup_etc_config
backup_cups_config

# vim:ts=2 sw=2
