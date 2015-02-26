
update_main() {
	echo "Start Update ..."
	USER=`whoami`
	cd /home/$USER/
	sudo rm -rf /home/$USER/*
	penlook clone
	echo "Complete !!!"
}
