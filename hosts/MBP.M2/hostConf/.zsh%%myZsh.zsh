export JAVA_HOME=/Library/Java/JavaVirtualMachines/default
export DEV_HOME=$HOME/devEnv
export M2_HOME=$DEV_HOME/maven3
export MAVEN_HOME=$DEV_HOME/maven3
export MAVEN_OPTS=
export TOMCAT_HOME=$DEV_HOME/tomcat5
export PYTHON2_BIN=$HOME/.pyenv/shims
export PATH=$PATH:$DEV_HOME/maven3/bin:$HOME/bin:$DEV_HOME/.npm_modules/bin:$DEV_HOME/Desktop/Projects/Aviatar/openshift/:$PYTHON2_BIN
#export TERM=xterm-256color
##### podman
#export DOCKER_HOST='unix:///var/folders/pt/07m3hc_s21900q5yz2t5d_8h0000gp/T/podman/podman-machine-default-api.sock'
#export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/user/504/podman/podman.sock
export TESTCONTAINERS_RYUK_CONTAINER_PRIVILEGED=true


alias docker=podman
alias df='df -h'
alias akserver='ssh kent@akcloud.gleeze.com  -p 9222 "/AK-Server-Storage/scripts/st.py"'
alias python='/opt/homebrew/bin/python3'
alias ncalc='numi-cli'

#proxy setting
#export JAVA_TOOL_OPTIONS
#gnu bc default config file
export BC_ENV_ARGS=$HOME/.bcrc
#add project into cd path
export CDPATH=$CDPATH:$HOME/Desktop/Projects

export EDITOR=nvim

#freetds, used by pymssql lib to aviatar panda db connection
export TDSVER=7.0

# keychain  https://wiki.archlinux.org/index.php/SSH_keys#Keychain
#eval $(keychain --eval --quiet --agents ssh id_rsa)
#
#
if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
then
    precmd()
    {
        # output on which level (%L) this shell is running on.
        # append the current directory (%~), substitute home directories with a tilde.
        # "\a" bell (man 1 echo)
        # "print" must be used here; echo cannot handle prompt expansions (%L)
        print -Pn "\e]0; %~\a"
    }

    preexec()
    {
        # output current executed command with parameters
        echo -en "\e]0; ${1}\a"
    }
fi

