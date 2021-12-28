#LC_CTYPE="zh_CN.utf8"
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XIM="fcitx"
export DEPENDS="fcitx"
#echo "$(date)profile executed!" >> profile_out
#export XMODIFIERS=@im=ibus
#export GTK_IM_MODULE="ibus"

#Tune Capslock key (xcape is required)
# press and release: ESC
# press and hold: Ctrl
/usr/bin/setxkbmap -option 'ctrl:nocaps'
/usr/bin/xcape -e 'Control_L=Escape' -t 100
#export QT_IM_MODULE="ibus"
