#!/bin/bash

# Penlook Project
#
# Copyright (c) 2015 Penlook Development Team
#
# --------------------------------------------------------------------
#
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public License
# as published by the Free Software Foundation, either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public
# License along with this program.
# If not, see <http://www.gnu.org/licenses/>.
#
# --------------------------------------------------------------------
#
# Authors:
#     Loi Nguyen       <loint@penlook.com>
#     Viet Nguyen      <vietna@penlook.com>

build_main() {

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

}








