#!/bin/sh
ls -1|xargs -n 5 |awk '$0="convert +append " $0 sprintf(" %03d",NR) ".jpg"'|sh
