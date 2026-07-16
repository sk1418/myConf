#!/bin/zsh
#source in the zshrc

export FZF_DEFAULT_OPTS='--tmux --height 70% --reverse --border --walker-skip=.git,target,node_modules,.idea'
export FZF_DEFAULT_COMMAND='fd --type f'
# solarized dark
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:#073642,bg:#002b36,spinner:#2aa198,hl:#268bd2"\
" --color=fg:#839496,header:#268bd2,info:#b58900,pointer:#2aa198"\
" --color=marker:#2aa198,fg+:#eee8d5,prompt:#b58900,hl+:#268bd2"


fzf_switch_support="--bind 'ctrl-d:reload(fd --type d),ctrl-f:reload(eval "$FZF_DEFAULT_COMMAND")'"
      
if command -v bat &> /dev/null; then
  show_file_or_dir_preview="if [ -d {} ]; then tree -C {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
  export FZF_CTRL_T_OPTS="$fzf_switch_support --preview '$show_file_or_dir_preview'"
else
  export FZF_CTRL_T_OPTS="$fzf_switch_support --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
fi


#support switch dir/file
alias fzf2="fzf $fzf_switch_support"

#alt-c
export FZF_ALT_C_COMMAND=""
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

#ctrl-space open git branches under a git repo directory
_fzf-git-branches() {
   local branch
   branch=$(
     git branch -a --sort=-committerdate --sort=-HEAD --no-color 2>/dev/null \
     | sed 's|^[* ] ||; s|remotes/origin/||' \
     | awk '!seen[$0]++' \
     | fzf --border-label '🌲 Branches ' \
       --tiebreak begin \
       --color hl:underline,hl+:underline \
       --no-hscroll \
   ) || return
   
   LBUFFER="$LBUFFER $branch"
   zle reset-prompt
 }
 zle -N _fzf-git-branches
 bindkey '^@' _fzf-git-branches   # ^@ = Ctrl-Space


# fkill with processes in fzf
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

#List PRs under a git repo, requires gh-cli
pr(){
  fzf --tmux 80%,100%,border-native --ansi \
    --info inline --reverse --header-lines 4 \
    --preview 'GH_FORCE_TTY=$FZF_PREVIEW_COLUMNS gh pr view --comments {1}' \
    --preview-window up:border-down \
    --with-shell 'bash -c' \
    --bind 'start:preview(echo Loading pull requests ...)+reload:GH_FORCE_TTY=95% gh pr list --limit=1000' \
    --bind 'load:transform:(( FZF_TOTAL_COUNT )) || echo become:echo No pull requests' \
    --bind 'ctrl-o:execute-silent:gh pr view --web {1}' \
    --bind 'ctrl-v:execute:gh pr view {1} | sed "s/\r//g" | view - +"setf markdown"' \
    --bind 'enter:become:gh pr checkout {1}' \
    --footer 'Press Enter to checkout / CTRL-O to open in browser / CTRL-V to open in editor' "$@"
}

# vim: ft=sh ts=2 sw=2 et ai
