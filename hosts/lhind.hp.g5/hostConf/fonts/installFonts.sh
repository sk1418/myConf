cd /usr/share/fonts
ln -sf /home/kent/fonts myFonts
cd myFonts

#此处需将windows\fonts\的simsun simhei symbol times等等字体复制到~/fonts里
mkfontscale
mkfontdir
fontconfig-voodoo -f -s zh_CN 
#这样作和把字体拷贝到/usr/share/fonts的一个目录下的效果是一样的。
#后面的两个mkfont命令是生成xpfonts目录下所包含的字体的索引信息。然后运行fc-cache命令更新字体缓存：
fc-cache
