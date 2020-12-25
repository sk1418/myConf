#export JAVA_HOME=/opt/java
export JAVA_HOME=/usr/lib/jvm/default
export DEV_HOME=/home/kent/devEnv
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:$DEV_HOME/sapjco-linuxintel-2.1.8
#export M2_HOME=$DEV_HOME/maven
export M2_HOME=$DEV_HOME/maven3
export MAVEN_HOME=$DEV_HOME/maven3
export TOMCAT_HOME=$DEV_HOME/tomcat5
export PATH=$PATH:$DEV_HOME/maven3/bin:$HOME/bin
#export TERM=xterm-256color

export JAVA_TOOL_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
#sogou-qimpanel &

# keychain  https://wiki.archlinux.org/index.php/SSH_keys#Keychain
eval $(keychain --eval --quiet --agents ssh id_rsa)

#keyphrase of borg.. plain text here ^_^
export BORG_PASSPHRASE="kent"
