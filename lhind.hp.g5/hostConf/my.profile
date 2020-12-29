#LC_CTYPE="zh_CN.utf8"
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XIM="fcitx"
export DEPENDS="fcitx"

#echo "$(date)profile executed!" >> profile_out

#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5

# 4k setup
export QT_AUTO_SCREEN_SCALE_FACTOR=0 
export QT_SCALE_FACTOR=2

#Tune Capslock key (xcape is required)
# press and release: ESC
# press and hold: Ctrl
/usr/bin/setxkbmap -option 'ctrl:nocaps'
/usr/bin/xcape -e 'Control_L=Escape' -t 100
