
test_main() {
	if [ ! -e $1 ]
	then
		if [ "$1" != "all" ]
		then
			test $1
		else
			test_all
		fi
	else
		test_option
	fi
}

test(){
	USER=`whoami`
	if [ -d /home/$USER/src/github.com/penlook/$1/unit-test.sh ]
	then
		cd  /home/$USER/src/github.com/penlook/$1/
		chmod +x test.sh
		./test.sh
	else
		echo "The configuration for " $1 " has not yet setup"
	fi
}

test_all(){
	test backed
	test frontend
	test service
	test server
	test admin
	test console
	test setup
}

test_option() {
	echo
	echo "Usage: penlook test <parameter>"
	echo "Parameters:"
    echo
    echo "  all     	Test all"
    echo "  backend 	Test backend"
    echo "  frontend 	Test frontend"
    echo "  service 	Test service"
    echo "  server 	Test server"
    echo "  admin 	Test admin"
    echo "  console 	Test console"
    echo "  setup 	Test setup"
    echo
}