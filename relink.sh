#!/bin/bash
source var.sh

relink_rule(){
  ruleFile="$1"
  if [[ $ruleFile =~ common[.]rule ]]; then
    bkDir="$COMMON_CONF_DIR"
  elif [[ $ruleFile =~ host[.]rule ]]; then
    bkDir="$HOST_BKUP_CONF_DIR"
  else 
    echo "error:: unknown rule file [$ruleFile]"
    exit 1
  fi

  awk -F '-->' -v home="$HOME" -v bkDir="$bkDir" \
    -v lnsf='test -f "%s" && ln -svf "%s" "%s"\n' \
    -v lnsd='ln -svf "%s"* "%s"\n' \
    -v echo='echo "[^_^] %s"\n' \
      '/^#/ || !NF{ next }    #skip comments and empty lines
      {
        for (i=1;i<=NF;i++) { sub(/\s*$/,"",$i); sub(/^\s*/,"",$i) }
          target =  home "/" $1 
          conf = bkDir "/" $NF 
          if($1 ~ /.*[/]$/)
            printf lnsd, conf , target
          else
            printf lnsf, conf, conf , target
          }
        ' $ruleFile |sh
}

do_relink(){
  print_sep
  echo ":: Update Common Config Links ::"
  relink_rule $RULE_COMMON
  print_sep
  echo "[^_^] Common Part Done!"
  print_sep
  echo ":: Update Host Config Links ::"
  relink_rule $RULE_HOST
  print_sep
  echo "[^_^] Host Part Done!"
  print_sep
}

do_relink

##post hooks
HOOK="post_hooks/${HOST_NAME}_hook.sh"
if [ -f $HOOK ]; then
  echo "[Post Hook] Found post-hook, executing : $HOOK"
  print_sep
  bash $HOOK
fi

## vim:ts=2 sw=2 et
