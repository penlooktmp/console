
test_main() {
	echo "BUILD"
	USER=`whoami`
	cd  /home/$USER/src/github.com/penlook/backend/
	chmod +x test.sh
	./test.sh
}

