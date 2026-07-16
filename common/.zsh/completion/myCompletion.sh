#!/bin/bash

_gh_workflow_names() {
   local -a workflows
   workflows=(${(f)"$(gh workflow list --limit 100 --json name -q '.[].name' 2>/dev/null)"})
   compadd -a workflows
 }
 
 compdef '_arguments "1: :_gh_workflow_names" "*::arg:->args"' gh-workflow-run
 
 # hook into gh workflow run / view / enable / disable / delete
 _gh_workflow_override() {
   if [[ $words[2] == workflow && $words[3] == (run|view|enable|disable|delete) && $CURRENT == 4 ]]; then
     _gh_workflow_names
     return
   fi
   _gh "$@"
   # _gh's body re-runs `compdef _gh gh`, clobbering this wrapper.
   # Reinstall ourselves immediately after delegating.
   compdef _gh_workflow_override gh
 }
 compdef _gh_workflow_override gh

