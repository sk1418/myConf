#!/bin/bash
NAME="$(xinput list --name-only|grep -i touchpad)"
#get status
ENABLED=$(xinput list-props "$NAME"|awk -F':' '/Device Enabled/{print $2}')


if [ $ENABLED -eq 1 ]; then
	INFO="Touchpad Disabled"
	xinput disable "$(xinput list --name-only|grep -i touchpad)"
	echo "Touchpad Disabled"
	notify-send "$INFO" "OFF" -i input-touchpad -t 4000 >/dev/null 2>&1
else
	INFO="Touchpad Enabled"
	xinput enable "$(xinput list --name-only|grep -i touchpad)"
	echo "Touchpad Enabled"
	notify-send "$INFO" "ON" -i input-touchpad -t 4000 >/dev/null 2>&1
fi
