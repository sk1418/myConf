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
			file_tr="$file"
			if [[ "$file" =~ .*%%.* ]]; then
				file_tr=$(sed "s@%%@/@g" <<< "$file")
				echo "replace %% to /  File: $file_tr"
			fi
			rsync -a --safe-links "$HOME/$file_tr" "$BACKUP" > /dev/null 2>&1
			if [[ "$file" == ".todo" ]]; then
				file_tr=""
			fi
			rsync -a "$targetDir/$file" $HOME/$file_tr
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
	echo "appling hostConf directory"	
	print_sep
	rsync -a "$HOST_CONF_DIR" "$BACKUP" > /dev/null 2>&1
	rsync -av "$HOST_BKUP_DIR/hostConf" $HOME/
	print_sep
	echo "appling HOME/bin scripts"	
	print_sep
	rsync -a --safe-links "$HOME/bin" "$BACKUP" > /dev/null 2>&1
	rsync -av "$HOST_BKUP_DIR/bin" "$HOME/" 
}


#prepare backupdir
mkdir -p $BACKUP
apply_host_cfg
apply_common
print_sep
echo "Re-link hostConf config files"
print_sep
bash relink.sh
HOOK="post_hooks/${HOST_NAME}_hook.sh"
if [ -f $HOOK ]; then
	print_sep
	echo "[Post Hook] Found post-hook, executing : $HOOK"
	print_sep
	bash $HOOK
fi
echo ""
print_sep
echo "Old configurations were backuped on $BACKUP"
print_sep
echo ""

# vim:ts=2 sw=2
