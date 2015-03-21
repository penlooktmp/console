
test_main() {
	echo "BUILD"
	USER=`whoami`
	cd  /home/$USER/src/github.com/penlook/
	chmod +x test.sh
	./test.sh
}

