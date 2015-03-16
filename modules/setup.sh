
setup_main() {

	cd /usr/local/src/penlook/console/setup
	sudo chmod +x ./main.sh

	OS=$(tr -s ' \011' '\012' < /etc/issue | head -n 1)
	case "$OS" in
	"Ubuntu")
		setup_$OS $@
		;;
	"CentOS")
		setup_$OS $@
		;;
	*) echo "Current operation system is not supported !"
		;;
	esac
}

setup_Ubuntu() {
	if [ -d "/etc/koding" ]
	then
		./main.sh koding $@
	else
		./main.sh ubuntu $@
	fi
}

setup_CentOS() {
	./main.sh centos $@
}

