#!/bin/bash
#apply the configuration files in myConf to real system
#original conf file will be backuped to ~/myConfBackup 


source var.sh

#dir variables
BACKUP="$HOME/myConfBackup"

__backup_and_apply(){
	targetDir="$1"
	for file in $(ls -a $targetDir)
	do
		if [[ -f "$targetDir/$file" ]]
		then
			echo "appling $file ..."
			mv "$HOME/$file" "$BACKUP" > /dev/null 2>&1
			cp "$targetDir/$file" $HOME
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
apply_common
apply_host_cfg
echo "old configurations were backuped on $BACKUP"

# vim:ts=2 sw=2
