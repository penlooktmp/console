
test_main() {
	if [ ! -e $1 ]
	then
		USER=`whoami`
		if [ -d /home/$USER/src/github.com/penlook/$1 ]
		then
			test_$1
		else
			echo "The configuration has not yet setup"
		fi
	else
		test_backend
	fi
}

test_backend(){
	USER=`whoami`
	cd  /home/$USER/src/github.com/penlook/backend/
	chmod +x test.sh
	./test.sh
}