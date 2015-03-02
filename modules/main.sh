
# CLI Main
main() {

	if [[ "$(id -u)" == "0" ]]
	then
		echo "Can not use penlook cli under root permission !"
		exit 0
	fi

	if  [ `type -t $1_main`"" == 'function' ]
	then
		if [ ! -e "~/.ssh/id_rsa" ]
		then
			$1_main "${@:2}"
		else
			if [ "$1" != "auth" ] && [ "$1" != "help" ] && [ "$1" != "version" ]
			then
				echo "Please using below command to login"
				echo "\$ penlook auth your_email"
				echo
			else
				$1_main "${@:2}"
			fi
		fi
	else
		help_main
	fi
}

main $@

