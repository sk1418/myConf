
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

ME=$(hostname)
ROOT_DIR=$script_path
COMMON_DIR="$ROOT_DIR/common"
HOST_DIR="$ROOT_DIR/$ME"
MY_DOTFILES="$HOST_DIR/dotfiles"
MY_Arch="$HOST_DIR/arch"

print_sep(){
	echo "----------------------------------------------"
}

# vim:sw=2 ts=2
