#!/bin/bash
source var.sh

#arg: rule file, should begin with 'host' or 'common'
backup_rule(){
	ruleFile="$1"
	if [[ $ruleFile =~ common[.]rule ]]; then
		target="$COMMON_CONF_DIR"
	elif [[ $ruleFile =~ host[.]rule ]]; then
		target="$HOST_BKUP_CONF_DIR"
	else 
		echo "error:: unknown rule file [$ruleFile]"
		exit 1
	fi

	awk -F '-->' -v home="$HOME" -v targetDir="$target" \
		-v rsync='rsync -a -L --force "%s" "%s"\n' \
		-v mkdir='mkdir -p "%s"\n' \
		-v echo='echo "[^_^] %s"\n' \
		' /^#/||!NF{next} #skip comments and empty lines
		{
			for (i=1;i<=NF;i++) { 
				sub(/\s*$/,"",$i)
				sub(/^\s*/,"",$i) 
			}
			from =  home "/" $1 
			to = targetDir"/" $NF 
			if($1~/[/]$/){
				printf mkdir, to
			}
			printf echo , "Backingup " from " ..."
			printf rsync, from, to
		}' $ruleFile |sh
}

backup_host(){
	confirm
	print_sep
	echo ":: Starting Host based Config Backup ::"
	backup_rule $RULE_HOST
	print_sep
	echo "[^_^] Host Part Done!"
}

backup_common(){
	confirm
	print_sep
	echo ":: Starting Common Config Backup ::"
	backup_rule $RULE_COMMON
	print_sep
	echo "[^_^] Common Part Done!"
}


confirm(){
	while true; do
		read -p "::: NOTE :::
		This should ONLY run on a not-yet backuped new host.
		The backuped config files will be overwritten by the current host's config
		any s-linked files will be followed	and copied, continue [y/n]?" yn
		case $yn in
			[Yy]* ) break;;
			[Nn]* ) exit;;
			* ) echo "Please answer y or n.";;
		esac
	done
}

case $1 in
	common ) backup_common break;;
	host ) backup_host break;;
	* ) echo -e "Illegal Argument\nUsage: $0 <common|host>"
esac
# vim:ts=2 sw=2
