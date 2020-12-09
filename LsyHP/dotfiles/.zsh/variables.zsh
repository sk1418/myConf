
export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
export ORACLE_SID=XE
export JAVA_HOME=/usr/lib/jvm/default
export DEV_HOME=/home/kent/javaEnv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:$DEV_HOME/sapjco-linuxintel-2.1.8
#export M2_HOME=$DEV_HOME/maven
export M2_HOME=$DEV_HOME/maven3
export MAVEN_HOME=$DEV_HOME/maven3
export MAVEN_OPTS=
export JBOSS_HOME=$DEV_HOME/jboss-eap-5.1.2/jboss-eap-5.1/jboss-as
export TOMCAT_HOME=$DEV_HOME/tomcat5
export PATH=$PATH:/home/kent/javaEnv/maven3/bin:$ORACLE_HOME/bin:/home/kent/javaEnv/ant/bin:$HOME/bin:/home/kent/.npm_modules/bin:/home/kent/Desktop/Projects/Aviatar/openshift/
#export TERM=xterm-256color

#proxy setting
export http_proxy=http://localhost:8888
export https_proxy=http://localhost:8888
export ftp_proxy=http://localhost:8888
export no_proxy="localhost, 127.0.0.1, localdomain.com, 192.168.*.*, .dlh.de, 57.*.*.*, lht.app.lufthansa.com"

export HTTP_PROXY=http://localhost:8888
export HTTPS_PROXY=http://localhost:8888
export FTP_PROXY=http://localhost:8888
export NO_PROXY="localhost, 127.0.0.1, localdomain.com, 192.168.0.*, .dlh.de, 57.*.*.*, lht.app.lufthansa.com"

#only for EC project
export ANT_OPTS=-Dfile.encoding=iso-8859-1
_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
#_JAVA_OPTIONS="$_JAVA_OPTIONS -Dhttp.proxyHost=localhost -Dhttp.proxyPort=8888 -Dhttps.proxyHost=localhost -Dhttps.proxyPort=8888"
#_JAVA_OPTIONS="$_JAVA_OPTIONS -Dhttp.nonProxyHosts='localhost|lht.app.lufthansa.com|caculon.ham.dlh.de'"
_JAVA_OPTIONS="$_JAVA_OPTIONS -Djavax.net.ssl.trustStore=$JAVA_HOME/lib/security/cacerts -Djavax.net.ssl.trustStorePassword=changeit"
export _JAVA_OPTIONS
#gnu bc default config file
export BC_ENV_ARGS=$HOME/.bcrc
#add project into cd path
export CDPATH=$CDPATH:$HOME/Desktop/Projects

#freetds, used by pymssql lib to aviatar panda db connection
export TDSVER=7.0
#--------------------------------
#| #platform spesific functions |
#--------------------------------
function wifiap {
	sudo bash $HOME/lib/wifiAP/create_ap --no-virt -n wlo1 LinuxRocks ilovevim
}
 
# git merge origin BMJE-xxxx
function mjrM {
	git merge  --no-commit "origin/BMJE-$1" 
	if [[ "$?" == "0" ]]; then 
		mjrCiCodefreeze "$1"
		echo "========================="
		echo "merge and commit done in one shot! ^_^"
	else
		echo "========================="
		echo "Not yet committed.. :-( "
	fi
}

function mjrCiCodefreeze {
	git ci -am "[BMJE-$1] merged into codefreeze"
}


## import export mjr IdeaProject's settings
export STORE=/home/kent/Desktop/Projects/mje/intellijSettings
export MJR_HOME=/home/kent/IdeaProjects/m-jobcontrol-rotables


function exportMjr {
	echo "=================================================="
	echo "= Export Mjr settings to $STORE "
	echo "=================================================="
	find  $MJR_HOME -name '*.iml'|xargs -I{} rsync -ah {} $STORE
	rsync -avh  $MJR_HOME/.idea $STORE
	echo "= DONE"
	echo "=================================================="
}

function importMjr {
	echo "=================================================="
	echo "= Import Mjr settings to $STORE "
	echo "=================================================="
	find $STORE -name '*.iml'|awk -F'[/.]' -v target="$MJR_HOME" '{print "rsync -ah " $0, target"/"($(NF-1)~/-/?$(NF-1):"")}'|sh
	rsync -avh  $STORE/.idea $MJR_HOME
	echo "= DONE"
	echo "=================================================="
}

# keychain  https://wiki.archlinux.org/index.php/SSH_keys#Keychain
eval $(keychain --eval --quiet --agents ssh id_rsa)
