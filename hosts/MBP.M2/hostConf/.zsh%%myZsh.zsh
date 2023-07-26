
export JAVA_HOME=/Library/Java/JavaVirtualMachines/default
export DEV_HOME=$HOME/devEnv
export M2_HOME=$DEV_HOME/maven3
export MAVEN_HOME=$DEV_HOME/maven3
export MAVEN_OPTS=
export TOMCAT_HOME=$DEV_HOME/tomcat5
export PYTHON2_BIN=$HOME/.pyenv/shims
export PATH=$PATH:$DEV_HOME/maven3/bin:$HOME/bin:$DEV_HOME/.npm_modules/bin:$DEV_HOME/Desktop/Projects/Aviatar/openshift/:$PYTHON2_BIN
#export TERM=xterm-256color

#proxy setting
#export JAVA_TOOL_OPTIONS
#gnu bc default config file
export BC_ENV_ARGS=$HOME/.bcrc
#add project into cd path
export CDPATH=$CDPATH:$HOME/Desktop/Projects


#freetds, used by pymssql lib to aviatar panda db connection
export TDSVER=7.0

# keychain  https://wiki.archlinux.org/index.php/SSH_keys#Keychain
#eval $(keychain --eval --quiet --agents ssh id_rsa)
