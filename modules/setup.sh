
setup_main() {

	cd /usr/local/src/penlook/console/setup

	OS=$(tr -s ' \011' '\012' < /etc/issue | head -n 1)
	case "$OS" in
	"Ubuntu")
		setup_$OS
		;;
	"CentOS")
		setup_$OS
		;;
	*) echo "Current operation system is not supported !"
		;;
	esac
}

setup_Ubuntu() {
	if [ -d "/etc/koding" ]
	then
		python main.py koding
	else
		python main.py ubuntu
	fi
}

setup_CentOS() {
	python main.py centos
}

# Option for authentication
setup_option() {
	echo
	echo "Usage: penlook setup <parameter>"
	echo "Parameters:"
    echo
    echo "  ubuntu  Ubuntu"
    echo "  centos  Centos"
    echo "  coreos  CoreOS"
    echo
}

