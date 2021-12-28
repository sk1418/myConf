#!/bin/bash
common_rule_file="$1"
# handle the myzsh
awk -F '-->' -v home="$HOME" -v comm="$COMMON_DIR" \
	-v rsync='rsync -a --force "%s" "%s"\n' \
	-v echo='echo "[^_^] %s"\n' \
	-v line='=====================================' '
BEGIN{print  line"\n:: Starting Common Config Backup ::\n"line}
/^#/||!NF{next} #skip comments and empty lines
NF == 1 { to = comm"/" } #if there is no target dir
NF == 2 { to = comm"/"$3 }
{ from = home"/"$1
	sub(/\s*$/,"",from)
	sub(/\s*$/,"",to)
	printf echo , "Backingup "from" ..."
	printf rsync, from, to
}
END{ print line}
' $common_rule_file

# vim:ts=2 sw=2
