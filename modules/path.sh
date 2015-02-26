
path_main() {
	USER=`whoami`
	ROOT="/home/$USER/src/github.com"
	cd $ROOT/penlook
	ROOT_PATH=`pwd`
	echo -e "\n cd $ROOT_PATH \n"
}