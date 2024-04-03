
export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
export ORACLE_SID=XE
export JAVA_HOME=/usr/lib/jvm/default
export DEV_HOME=/home/kent/javaEnv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:$DEV_HOME/sapjco-linuxintel-2.1.8
#export M2_HOME=$DEV_HOME/maven
export M2_HOME=$DEV_HOME/maven3
export MAVEN_HOME=$DEV_HOME/maven3
export MAVEN_OPTS=
export TOMCAT_HOME=$DEV_HOME/tomcat5
export PATH=$PATH:/home/kent/javaEnv/maven3/bin:$ORACLE_HOME/bin:/home/kent/javaEnv/ant/bin:$HOME/bin:/home/kent/.npm_modules/bin:/home/kent/Desktop/Projects/Aviatar/openshift/
#export TERM=xterm-256color

#only for EC project
export ANT_OPTS=-Dfile.encoding=iso-8859-1
#export JAVA_TOOL_OPTIONS
#gnu bc default config file
export BC_ENV_ARGS=$HOME/.bcrc
#add project into cd path
export CDPATH=$CDPATH:$HOME/Desktop/Projects


#freetds, used by pymssql lib to aviatar panda db connection
export TDSVER=7.0
#--------------------------------
#| #platform spesific functions |
#--------------------------------
 
function git_prompt {
    gp="$(git_super_status) "
    if [[ "$gp" == " " ]]; then
        gp=""
    fi
    echo "$gp"
}

export PROMPT='%{$bg[cyan]%}%{$fg_bold[black]%}%M%{$reset_color%} %{$fg_bold[red]%}%*% %{$fg_bold[yellow]%} %/
%{$fg[green]%}%n%B$ $(git_super_status) '

. "/home/kent/.acme.sh/acme.sh.env"
# keychain  https://wiki.archlinux.org/index.php/SSH_keys#Keychain
#eval $(keychain --eval --quiet --agents ssh id_rsa)
