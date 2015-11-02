
export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
export ORACLE_SID=XE
export JAVA_HOME=/usr/lib/jvm/default
export DEV_HOME=/home/kent/javaEnv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:$DEV_HOME/sapjco-linuxintel-2.1.8
#export M2_HOME=$DEV_HOME/maven
export M2_HOME=$DEV_HOME/maven3
export MAVEN_HOME=$DEV_HOME/maven3
export MAVEN_OPTS="-Djavax.net.ssl.trustStore=/home/kent/javaEnv/7p/7p-keystore -Djavax.net.ssl.trustStorePassword=changeit"
export JBOSS_HOME=$DEV_HOME/jboss-eap-5.1.2/jboss-eap-5.1/jboss-as
export TOMCAT_HOME=$DEV_HOME/tomcat5
export PATH=$PATH:/home/kent/javaEnv/maven3/bin:$ORACLE_HOME/bin:/home/kent/javaEnv/ant/bin:$HOME/bin
#export TERM=xterm-256color

#proxy setting
export http_proxy=http://localhost:8888
export https_proxy=https://localhost:8888
export ftp_proxy=https://localhost:8888
export no_proxy="localhost, 127.0.0.1, localdomain.com, 192.168.*.*, *.dlh.de, 57.*.*.*, lht.app.lufthansa.com"

export HTTP_PROXY=http://localhost:8888
export HTTPS_PROXY=https://localhost:8888
export FTP_PROXY=https://localhost:8888
export NO_PROXY="localhost, 127.0.0.1, localdomain.com, 192.168.0.*, *.dlh.de, 57.*.*.*, lht.app.lufthansa.com"

#only for EC project
export ANT_OPTS=-Dfile.encoding=iso-8859-1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
#gnu bc default config file
export BC_ENV_ARGS=$HOME/.bcrc
#add project into cd path
export CDPATH=$CDPATH:$HOME/Desktop/Projects
#--------------------------------
#| #platform spesific functions |
#--------------------------------
function wifiap {
	sudo bash $HOME/lib/wifiAP/create_ap --no-virt -n wlo1 LinuxRocks ilovevim
}
 

# keychain  https://wiki.archlinux.org/index.php/SSH_keys#Keychain
eval $(keychain --eval --quiet --agents ssh id_rsa)
