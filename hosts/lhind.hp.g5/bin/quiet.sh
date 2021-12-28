#!/bin/bash
# https://gist.github.com/liejuntao001/ea69affcc497ee0cc580018001e931f2
echo "########## INFO ########"
grep . -r /sys/firmware/acpi/interrupts/ | ag -v "  0"
echo "########################"


echo "########## Disable gpe69 ########"
echo "The script must be run as root"
echo "########################"

sudo su - <<EOF
echo "disable" >  /sys/firmware/acpi/interrupts/gpe69
EOF

echo "########################"

