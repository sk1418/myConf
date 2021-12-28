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

RULE_COMMON=$ROOT_DIR/rules/common.rule
RULE_HOST=$ROOT_DIR/rules/host.rule

#common
COMMON_CONF_DIR="$ROOT_DIR/common"

#host
HOST_NAME=$(hostname)
HOST_BKUP_DIR="$ROOT_DIR/hosts/$HOST_NAME"
HOST_BKUP_CONF_DIR=$HOST_BKUP_DIR/hostConf
HOST_BKUP_ETC_DIR="$HOST_BKUP_DIR/etc"

HOST_CONF_DIR=$HOME/hostConf #deprecated


print_sep(){
	echo "----------------------------------------------"
}
print_step(){
	echo "file:> $1 "
}

# vim:sw=2 ts=2
