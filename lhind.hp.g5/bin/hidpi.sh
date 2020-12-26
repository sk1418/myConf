#!/bin/bash
#Gnome
#gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"
#gsettings set org.gnome.desktop.interface scaling-factor 2

#xfce
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 2
#####
#export GDK_DPI_SCALE=0.5
#xfconf-query -c xfwm4 -p /general/theme -s Default-xhdpi
