#!/bin/bash
source var.sh


backup_common(){
#TODO  handle the myzsh
	awk -F '-->' -v home="$HOME" -v comm="$COMMON_BKUP_DIR" \
		-v rsync='rsync -a --force "%s" "%s"\n' \
		-v echo='echo "[^_^] %s"\n' \
		-v line='=====================================' '
	BEGIN{ print  line"\n:: Starting Common Config Backup ::\n"line }
	/^#/||!NF{next} #skip comments and empty lines
	NF == 1 { to = comm"/" } #if there is no target dir
	NF == 2 { to = comm"/"$3 }
	{ from = home"/"$1
		sub(/\s*$/,"",from)
		sub(/\s*$/,"",to)
		printf echo , "Backingup "from" ..."
		printf rsync, from, to
	}
	' $RULE_COMMON 
	echo "[^_^] Common Part Done!"
}

backup_host(){

	print_sep
	echo "[^_^] Backing up Host specific configs"
	print_sep
	rsync -a --force --delete-after $LIVE_CFG_HOST  $HOST_BKUP_DIR/
	#cp ssh config and keep directory structure
	mkdir -p $HOST_BKUP_DIR/.ssh
	cp  $HOME/.ssh/config  $HOST_DOTFILES/.ssh/config	> /dev/null 2>&1
	echo "[^_^] Backing up HOME/bin... "
	rsync -a --safe-links --force --delete-after $HOME/bin  $HOST_BKUP_DIR/

	echo "[^_^] Host-spec Part Done!"
}
