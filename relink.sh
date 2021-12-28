#!/bin/bash
source var.sh
# common

#awk -F '-->' -v home="/tmp/test/myHome" -v comm="$COMMON_CONF_DIR" \
	#-v lns='ln -svf "%s" "%s"\n' \
	#-v echo='echo "[^_^] %s"\n' \
	#-v line='=====================================' '
	#BEGIN{ print  line"\n:: Update Common Config Links ::\n"line }
	#/^#/||!NF{next} #skip comments and empty lines
	#{target =  home"/"$1 }
	#NF == 1 { conf = comm"/"$1 } #if there is no target dir
	#NF == 2 { conf = comm"/"$2 }
	#$1 ~ /.*[/]$/{ conf = conf "*" } #add .../* to the ln command
	#{
		#sub(/\s*$/,"",conf)
		#sub(/\s*$/,"",target)
		#printf lns, conf , target
	#}
#' $RULE_COMMON 
#echo "[^_^] Done!"

ln -svf "$COMMON_CONF_DIR/.zshrc" "$HOME/.zshrc"
ln -svf "$COMMON_CONF_DIR/.Xdefaults" "$HOME/.Xdefaults"
ln -svf "$COMMON_CONF_DIR/.Xresources" "$HOME/.Xresources"
ln -svf "$COMMON_CONF_DIR/.screenrc" "$HOME/.screenrc"
ln -svf "$COMMON_CONF_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -svf "$COMMON_CONF_DIR/.vimrc" "$HOME/.vimrc"
ln -svf "$COMMON_CONF_DIR/.ideavimrc" "$HOME/.ideavimrc"
ln -svf "$COMMON_CONF_DIR/.Xmodmap" "$HOME/.Xmodmap"
ln -svf "$COMMON_CONF_DIR/base.vimrc" "$HOME/base.vimrc"
ln -svf $COMMON_CONF_DIR/.todo/* "$HOME/.todo/"
ln -svf $COMMON_CONF_DIR/.zsh/* "$HOME/.zsh/"
ln -svf "$COMMON_CONF_DIR/.bcrc" "$HOME/.bcrc"
ln -svf "$COMMON_CONF_DIR/firefoxProxy.pac" "$HOME/firefoxProxy.pac"
ln -svf "$COMMON_CONF_DIR/.config%%nvim%%init.vim" "$HOME/.config/nvim/init.vim"
ln -svf "$COMMON_CONF_DIR/.config%%nvim%%ginit.vim" "$HOME/.config/nvim/ginit.vim"


# hosts

# home/hostConf
ln -svf $HOST_BKUP_CONF_DIR/my.Xresources $HOST_CONF_DIR/my.Xresources
ln -svf $HOST_BKUP_CONF_DIR/my.Xdefaults $HOST_CONF_DIR/my.Xdefaults

#home
ln -svf $HOST_BKUP_CONF_DIR/myZsh.zsh $HOME/.zsh/myZsh.zsh
ln -svf $HOST_BKUP_CONF_DIR/my.gitconfig $HOME/.gitconfig
ln -svf $HOST_BKUP_CONF_DIR/my.gitignore $HOME/.gitignore
ln -svf $HOST_BKUP_CONF_DIR/my.profile $HOME/.profile
ln -svf $HOST_BKUP_CONF_DIR/my.xinitrc $HOME/.xinitrc 
ln -svf $HOST_BKUP_CONF_DIR/my.bashrc $HOME/.bashrc
ln -svf $HOST_BKUP_CONF_DIR/my.bash_profile $HOME/.bash_profile
ln -svf $HOST_BKUP_CONF_DIR/fonts/* $HOME/fonts/

#post hooks
HOOK="post_hooks/${HOST_NAME}_hook.sh"
if [ -f $HOOK ]; then
	print_sep
	echo "[Post Hook] Found post-hook, executing : $HOOK"
	print_sep
	bash $HOOK
fi
# vim:ts=2 sw=2
