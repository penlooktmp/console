
build_main() {

	# Free memory before build project
	sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'

	USER=`whoami`
	ROOT="/home/$USER/src/github.com/penlook"
	if [ -d $ROOT ]
	then
		build_make $ROOT
	else
		echo "Can not build without source !"
	fi

}

build_make() {

	cd $1
	cd backend
	zephir build

	build_copy_ini
	build_restart_service

}

build_restart_service() {

	# For Centos
	[[ -e "/etc/init.d/php-fpm" ]] && sudo service php-fpm restart

	# For Ubuntu
	[[ -e "/etc/init.d/php5-fpm" ]] && sudo service php5-fpm restart

}

build_copy_ini() {

	# For Centos
	[[ -e "/etc/php.d/zzz-phalcon.ini" ]] && echo $'extension=phalcon.so \nextension=app.so' > "/etc/php.d/zzz-phalcon.ini"

	# For Ubuntu
	[[ -e "/etc/php5/cli/conf.d/90-phalcon.ini" ]] && echo $'extension=phalcon.so \nextension=app.so' > "/etc/php5/cli/conf.d/90-phalcon.ini"
	[[ -e "/etc/php5/fpm/conf.d/90-phalcon.ini" ]] && echo $'extension=phalcon.so \nextension=app.so' > "/etc/php5/fpm/conf.d/90-phalcon.ini"

}
