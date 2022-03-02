#====[ Gernal options ]==================================================# {{{1

export EDITOR=vim
export MY_ZSH_DIR="$HOME/.zsh"
export MY_LIB_DIR="$HOME/lib"
setopt brace_ccl      #brace expansion
limit coredumpsize 0  #disable coredumpsize
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'          #those characters would be considered as a part of a word
watch=(notme)    #report to me when people login/logout
setopt long_list_jobs       #show pid in bg job list
setopt prompt_subst         #prompt more dynamic, allow function in prompt

setopt NO_CASE_GLOB # Case insensitive globbing
setopt NUMERIC_GLOB_SORT # Be Reasonable!
setopt EXTENDED_GLOB # I don't know why I never set this before.
#disable the ctrl-s (suspend the output)
stty stop undef
#====[ History ]========================================================# {{{1
export HISTFILE=$MY_ZSH_DIR/.zsh_history
export HISTSIZE=10000         #history entry size
export SAVEHIST=10000         #the     size  of   saving history entries after logout

setopt inc_append_history     #the size of saving history entries after logout
setopt hist_ignore_dups       #ignore duplicated command in history
setopt extended_history       #add additional information (timestamp) in history
setopt hist_ignore_space    #add space before command, the command will not be added into history

#====[ Directories ]========================================================# {{{1
setopt AUTO_PUSHD           #make cd push the old directory to the dirstack, cd - <tab> could show the list
setopt PUSHD_IGNORE_DUPS    #don't push duplicated dirs
hash -d my="$HOME/MyStuff"  #cd ~xxx to enter the directory
export CDPATH=.:~:~/MyStuff

#====[ Corrections ]========================================================# {{{1
setopt correct_all #try to correct every word, this can be dangerous with some commands (e.g. mv)

#====[ Completion ]========================================================# {{{
setopt auto_list # Automatically list choices on an ambiguous completion.
setopt auto_menu
setopt complete_in_word     #stays where it is and completion is done from both ends e.g. /v/c/p/p => /var/cache/pacman/pkg
setopt always_to_end
setopt magic_equal_subst #complete identifier=path format 
autoload -U compinit
compinit

#completion cache settings
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $MY_ZSH_DIR/.zsh_cache


#completion menu with color
zmodload zsh/complist
export ZLSCOLORS="${LS_COLORS}"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" "ma=${${use_256color+1;7;38;5;143}:-1;7;33}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'


## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

zstyle ':completion:*' verbose yes
#zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# path completion
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

# case correction
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric


#completion group
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'

# cd ~ completion order
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _global_ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()

hosts=(
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts
#}}}


#====[ Color and Terminal ]========================================================# {{{
#set 256color for TERM
case "$TERM" in
  'xterm') TERM=xterm-256color;;
  'screen') TERM=screen-256color;;
  'Eterm') TERM=Eterm-256color;;
esac
export TERM

DIR_COLOR=$MY_LIB_DIR/dircolors/dircolors.ansi-universal
DIR_COLOR256=$MY_LIB_DIR/dircolors/dircolors.256dark

if [[ ("$TERM" = *256color || "$TERM" = screen* ) && -f $DIR_COLOR256 ]]; then
  #use prefefined colors
  eval $(dircolors -b $DIR_COLOR256)
  use_256color=1
  export TERMCAP=${TERMCAP/Co\#8/Co\#256}
  else
  [[ -f $DIR_COLOR ]] && eval $(dircolors -b $DIR_COLOR)
fi

autoload colors 
#colors
[[ $terminfo[colors] -ge 8 ]] && colors

#}}}

#====[ Prompt ]========================================================# {{{

#git prompt
source $MY_LIB_DIR/git-prompt/zshrc.sh
#
#zsh prompt
source $MY_ZSH_DIR/promptrc
#}}}

#====[ Functions ]==================================================# {{{
#display beijing time
function when {
  echo "北京时间: " $(TZ="Hongkong" date +"%F %H:%M:%S")
  echo "首尔时间: " $(TZ="Asia/Seoul" date +"%F %H:%M:%S")
}


# webcam
function webcam {
    mplayer -tv driver=v4l2:gain=1:width=640:height=480:device=/dev/video0 tv://
}

function webHere {
    py_ver=$(python -V 2>&1|grep -Po 'Python\s*\K\d')
    if [[ $py_ver = "2" ]]; then
        python -m SimpleHTTPServer
    elif [[ $py_ver = "3" ]];then
        python -m http.server
    fi
}
# check zsh Version
function is-at-least {
  local IFS=".-" min_cnt=0 ver_cnt=0 part min_ver version

  min_ver=(${=1})
  version=(${=2:-$ZSH_VERSION} 0)

  while (( $min_cnt <= ${#min_ver} )); do
    while [[ "$part" != <-> ]]; do
      (( ++ver_cnt > ${#version} )) && return 0
      part=${version[ver_cnt]##*[^0-9]}
    done

    while true; do
      (( ++min_cnt > ${#min_ver} )) && return 0
      [[ ${min_ver[min_cnt]} = <-> ]] && break
    done

    (( part > min_ver[min_cnt] )) && return 0
    (( part < min_ver[min_cnt] )) && return 1
    part=''
  done
}

# show a 256 color table
function 256tab {
  for k in `seq 0 1`;do 
    for j in `seq $((16+k*18)) 36 $((196+k*18))`;do 
      for i in `seq $j $((j+17))`; do 
        printf "\e[01;$1;38;5;%sm%4s" $i $i;
      done;echo;
    done;
  done
}


#calculator
function calc {
  echo "scale=2;$*"|bc|sed 's/\.0*$//'
}



#functions to set prompt pwd color
__PROMPT_PWD="$pfg_magenta%~$pR"
#change PWD color
function pwd_color_chpwd { [ $PWD = $OLDPWD ] || __PROMPT_PWD="$pU$pfg_cyan%~$pR" }
#change back before next command
function pwd_color_preexec { __PROMPT_PWD="$pfg_magenta%~$pR" }


#行编辑高亮模式 
# Ctrl+@ 设置标记，标记和光标点之间为 region
if (is-at-least 4.3); then
  zle_highlight=(region:bg=magenta
                 special:bold,fg=magenta
                 default:bold
                 isearch:underline
                 )
fi

# colorize command as blue if found in path or defined.
TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

recolor-cmd() {
  region_highlight=()
  colorize=true
  start_pos=0
  for arg in ${(z)BUFFER}; do
    ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
    ((end_pos=$start_pos+${#arg}))
    if $colorize; then
      colorize=false
      res=$(LC_ALL=C builtin type $arg 2>/dev/null)
      case $res in
        *'reserved word'*)   style="fg=magenta,bold";;
        *'alias for'*)       style="fg=cyan,bold";;
        *'shell builtin'*)   style="fg=yellow,bold";;
        *'shell function'*)  style='fg=green,bold';;
        *"$arg is"*)         
          [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
        *)                   style='none,bold';;
      esac
      region_highlight+=("$start_pos $end_pos $style")
    fi
    [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
    start_pos=$end_pos
  done
}

check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

zle -N self-insert check-cmd-self-insert
zle -N backward-delete-char check-cmd-backward-delete-char

# }}}

#====[ Title ]==================================================# {{{

case $TERM in
  xterm*|rxvt*)
    function title() { print -nP "\e]0;$1\a" } 
    ;;
  screen*)
    #only set screen title if it is in a local shell
    if [ -n $STY ] && (screen -ls |grep $STY &>/dev/null); then
      function title() 
      {
        #modify screen title
        print -nP "\ek$1\e\\"
        #modify window title bar
        #print -nPR $'\033]0;'$2$'\a'
      } 
  elif [ -n $TMUX ]; then       # actually in tmux !
    function title() {  print -nP "\e]2;$1\a" }
  else
    function title() {}
    fi
    ;;
  *) 
    function title() {} 
    ;;
esac     
screen_precmd() {
  #a bell, urgent notification trigger
  #echo -ne '\a'
  #title "`print -Pn "%~" | sed "s:\([~/][^/]*\)/.*/:\1...:"`" "$TERM $PWD"
  title "`print -Pn "%~" |sed "s:\([~/][^/]*\)/.*/:\1...:;s:\([^-]*-[^-]*\)-.*:\1:"`" "$TERM $PWD"
  echo -ne '\033[?17;0;127c'
}

screen_preexec() {
  local -a cmd; cmd=(${(z)1})
  case $cmd[1]:t in
    'ssh')          title "@""`echo $cmd[2]|sed 's:.*@::'`" "$TERM $cmd";;
    'sudo')         title "#"$cmd[2]:t "$TERM $cmd[3,-1]";;
    'for')          title "()"$cmd[7] "$TERM $cmd";;
    'svn'|'git')    title "$cmd[1,2]" "$TERM $cmd";;
    'ls'|'ll')      ;;
    *)              title $cmd[1]:t "$TERM $cmd[2,-1]";;
  esac
}

#this works with zsh 4.3.*, will remove the above ones when possible
typeset -ga preexec_functions precmd_functions chpwd_functions
precmd_functions+=screen_precmd
#precmd_functions+=git_branch_precmd
preexec_functions+=screen_preexec
#preexec_functions+=pwd_color_preexec
#chpwd_functions+=pwd_color_chpwd
#chpwd_functions+=hg_prompt_info
#chpwd_functions+=git_branch_chpwd

# 
#function title {
#  if [[ "$DISABLE_AUTO_TITLE" == "true" ]] || [[ "$EMACS" == *term* ]]; then
#    return
#  fi
#  if [[ "$TERM" == screen* ]]; then
#    #print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
#    precmd(){
#			# Restore tmux-title to 'zsh'
#			printf "\033kzsh\033\\"
#			# Restore urxvt-title to 'zsh'
#			print -Pn "\e]2;zsh:%~\a"
#		}
#		preexec(){
#			# set tmux-title to running program
#			printf "\033k$(echo "$1" | cut -d" " -f1)\033\\"
#			# set urxvt-title to running program
#			print -Pn "\e]2;zsh:$(echo "$1" | cut -d" " -f1)\a"
#                }
#  elif [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
#    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
#  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
#    print -Pn "\e]2;$2:q\a" #set window name
#    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
#  fi
#}
#
#ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
#ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"
#
##Appears when you have the prompt
#function omz_termsupport_precmd {
#  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
#}
#
##Appears at the beginning of (and during) of command execution
#function omz_termsupport_preexec {
#  emulate -L zsh
#  setopt extended_glob
#  local CMD=${1[(wr)^(*=*|sudo|ssh|rake|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
#  title "$CMD" "%100>...>${2:gs/%/%%}%<<"
#}
#
#autoload -U add-zsh-hook
#add-zsh-hook precmd  omz_termsupport_precmd
#add-zsh-hook preexec omz_termsupport_preexec
##}}}

#====[command line/key-bind]==================================================# {{{

setopt interactive_comments #allow add comment in interactive command. e.g. cmd #this is a test 

bindkey -e  # emacs key-bind

bindkey "\e[3~" delete-char  #set up delete : delete forward

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey \^U backward-kill-line

bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

#edit command in vi ctrl-x ctrl-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line

#ctrl-] to search next char in command line same as 'f' in vim
bindkey '^]' vi-find-next-char
#alt-] to search previous char in command line same as 'F' in vim
bindkey '\e]' vi-find-prev-char


#   pressing TAB in an empty command makes a cd command with completion list
function dumb-cd {
  if [[ -n $BUFFER ]] ; then # 如果该行有内容
    zle expand-or-complete # 执行 TAB 原来的功能
  else # 如果没有
    BUFFER="cd " # 填入 cd（空格）
    zle end-of-line # 这时光标在行首，移动到行末
    zle expand-or-complete # 执行 TAB 原来的功能
  fi 
}
zle -N dumb-cd
bindkey "\t" dumb-cd #将上面的功能绑定到 TAB 键


#adding sudo to command
function sudo-command-line {
  [[ -z $BUFFER ]] && zle up-history
  [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
  zle end-of-line #move to EOL
}
zle -N sudo-command-line
# [Esc] [Esc]
bindkey '\e\e' sudo-command-line

autoload -U url-quote-magic
zle -N self-insert url-quote-magic
#}}}

  

#====[ alias ]==================================================# {{{
#fast back to parents dir
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# disable autocorrect for some commands
for i in man mkdir mv cp;       alias $i="nocorrect $i"

alias find='noglob find'        # noglob for find

alias time='/usr/bin/time -p'
alias ls='ls -F'
alias l='ls -lhF --color=auto'
alias la='ls -ahF --color=auto'
alias ll='ls -lahF --color=auto'
alias grep='grep --color=auto'
alias wine='env LANG=zh_CN.UTF-8 wine'
alias cal='cal -m'

alias du='du -h'
alias free='free -m'
alias df='df -Th'
alias info='info --vi-keys'
alias port='netstat -ntlp'
#show top 10 of largest files/dirs
alias big='du -hxa | sort -rh | head -11'

#show port usage table
alias ports="netstat -tupln"

#[Esc][h] man 当前命令时，显示简短说明 
alias run-help >&/dev/null && unalias run-help
autoload run-help
#历史命令 top10
alias top10='print -l  ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

#screenfetch to print arch log and screenshot
alias archinfo='screenfetch -D "archlinux" -s'
alias bvim='vim -u ~/base.vimrc'
alias bvi='vim -u ~/base.vimrc'

alias vi='nvim'
alias gvim='nvim-qt'
alias activeServices='systemctl list-unit-files --state enabled'

#}}}

#====[ todo.txt ]==================================================# {{{
export PATH="$HOME/lib/todo.txt-cli:$PATH"
alias t='$HOME/lib/todo.txt-cli/todo.sh -d $HOME/.todo/todo.cfg'
compdef t="todo.sh"
# }}}

#====[ ag completion ]=============================================# {{{
source $MY_ZSH_DIR/completion/*
# }}}
#
#====[ fzf config]=============================================# {{{

#source the default key-bindings
source  /usr/share/fzf/key-bindings.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_OPTS='--height 70% --reverse --border'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"


fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}
#}}}
#
#====[ fasd fast jump conf ]=============================================# {{{
eval "$(fasd --init auto)"
alias v='f -e nvim'
alias o='a -e xdg-open'


#combine fasd and fzf "cd/z" command
source $MY_ZSH_DIR/fzf-fasd.zsh

#}}}
#====[ zsh-autosuggestions ]=============================================# {{{
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
#export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=25
#export ZSH_AUTOSUGGEST_USE_ASYNC=1
#FIXME do some cleanup
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[," copy-earlier-word

#}}}
mkdir -p /tmp/test
#environment variables
source $MY_ZSH_DIR/myZsh.zsh

#tab setting (4 spaces)
tabs -4

#CHANGES still in TESTING# {{{
setopt PUSHD_MINUS
setopt LISTPACKED
# }}}

### END OF FILE #################################################################
# vim: filetype=zsh fdm=marker autoindent expandtab shiftwidth=2 ts=2 
