#!/bin/bash
#apply the configuration files in myConf to real system
#original conf file will be backuped to ~/myConfBackup 


source var.sh

#dir variables
BACKUP="$HOME/myConfBackup"

__backup_and_apply(){
	targetDir="$1"
	for file in $(ls -a $targetDir); do
		if [[ $file =~ ^[.][.]?$ ]]; then
			#skip the '../' and './'
			continue
		else
			echo "appling $file ..."
			rsync -a "$HOME/$file" "$BACKUP" > /dev/null 2>&1
			rsync -a "$targetDir/$file" $HOME
		fi
	done

}

apply_common(){
	print_sep
	echo "appling common config files"	
	print_sep
	__backup_and_apply $COMMON_DIR
	print_sep
}

apply_host_cfg(){
	print_sep
	echo "appling host-specific config files"	
	print_sep
	__backup_and_apply "$HOST_DIR/dotfiles"
	print_sep
}


#prepare backupdir
mkdir -p $BACKUP
#backup and apply "common" at last, for the .zsh/completion (not clean solution, work-around)
apply_host_cfg
apply_common
echo "old configurations were backuped on $BACKUP"

# vim:ts=2 sw=2
