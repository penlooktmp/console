#!/bin/bash
# +--------------------------------------------------------------------------+
# | Penlook Project                                                          |
# +--------------------------------------------------------------------------+
# | Copyright (c) 2015 Penlook Development Team                              |
# +--------------------------------------------------------------------------+
# |                                                                          |
# | This program is free software: you can redistribute it and/or modify     |
# | it under the terms of the GNU Affero General Public License as           |
# | published by the Free Software Foundation, either version 3 of the       |
# | License, or (at your option) any later version.                          |
# |                                                                          |
# | This program is distributed in the hope that it will be useful, but	     |
# | WITHOUT ANY WARRANTY; without even the implied warranty of               |
# | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            |
# | GNU Affero General Public License for more details.                      |
# |                                                                          |
# | You should have received a copy of the GNU Affero General Public License |
# | along with this program.  If not, see <http://www.gnu.org/licenses/>.    |
# |                                                                          |
# +--------------------------------------------------------------------------+
# |   Authors: Loi Nguyen  <loint@penlook.com>                               |
# |            Viet Nguyen <vietna@penlook.com>                              |
# +--------------------------------------------------------------------------+

# CLI Main
main() {

	if [ "$(id -u)" == "0" ]
	then
		echo "Can not use penlook cli under root permission !"
		exit 0
	fi

	if  [ `type -t $1_main`"" == 'function' ]
	then
		if [[ ! -e "~/.ssh/id_rsa" ]]
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

