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

#common
COMMON_BKUP_DIR="$ROOT_DIR/common"
RULE_COMMON=$ROOT_DIR/rules/common.rule
SH_BKUP_COMMON="$ROOT_DIR/scripts/backupCommon.sh $RULE_COMMON"
echo "backup common script: $SH_BKUP_COMMON"

#host
HOST_NAME=$(hostname)
HOST_BKUP_DIR="$ROOT_DIR/hosts/$HOST_NAME"
HOST_BKUP_CONF_DIR=$HOST_BKUP_DIR/hostConf
HOST_BKUP_ETC_DIR="$HOST_BKUP_DIR/etc"

HOST_CONF_DIR=$HOME/hostConf #deprecated

#live config dir
LIVE_CFG_BASE=$HOME/myConfigBase
LIVE_CFG_COMMON=$LIVE_CFG_BASE/common
LIVE_CFG_HOST=$LIVE_CFG_BASE/hostConf

mkdir -p "$LIVE_CFG_HOST"
mkdir -p "$LIVE_CFG_COMMON"

#ZSH_COMP="$HOME/.zsh/completion"
#COMMON_ZSH_COMP="$COMMON_DIR/.zsh/completion"

print_sep(){
	echo "----------------------------------------------"
}
print_step(){
	echo "file:> $1 "
}

# vim:sw=2 ts=2
