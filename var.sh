#========================================
# common variable and functions for 
# getConf and applyConf scripts
#========================================
#get current path
script_path="${BASH_SOURCE[0]}"
if ([ -L "${script_path}" ]) then
	while ([ -L "${script_path}" ]) 
	do 
		script_path=$(readlink "${script_path}")
	done
fi
pushd . > /dev/null
cd $(dirname ${script_path}) > /dev/null
script_path=$(pwd)

ROOT_DIR=$script_path
COMMON_DIR="$ROOT_DIR/common"

HOST_CONF_DIR=$HOME/hostConf

HOST_NAME=$(hostname)
HOST_BKUP_DIR="$ROOT_DIR/$HOST_NAME"
HOST_ETC="$HOST_BKUP_DIR/etc"
#ZSH_COMP="$HOME/.zsh/completion"
#COMMON_ZSH_COMP="$COMMON_DIR/.zsh/completion"

print_sep(){
	echo "----------------------------------------------"
}
print_step(){
	echo "file:> $1 "
}

# vim:sw=2 ts=2
