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

# Server authentication
auth_main() {
	if [ -e $1 ]
	then
		auth_option
	else
		if [ $1 == "key" ] || [ $1 == "test" ] || [ $1 == "clear" ]
		then
			auth_$1
		else
			auth_generatekey $1
		fi
	fi
}

# Generate new SSH key and view it
auth_generatekey() {
	USER=`whoami`
	if [ -e "/home/$USER/.ssh/id_rsa" ]
	then
		echo "SSH Key is already exist"
	else
		echo -ne '\n' | ssh-keygen -t rsa -C $1
		eval `ssh-agent -s`
		ssh-add ~/.ssh/id_rsa
	fi

	echo -ne "Please copy below public key and paste into Github server \n"
	auth_key

}

# View current ssh key
# If does not exist, create new pair
auth_key() {
	if [ -e "~/.ssh/id_rsa.pub" ]
	then
		echo "SSH Key does not exists"
		echo "using the below command to create new pair and test it"
		echo "$ penlook auth @email"
		echo "$ penlook auth test"

	else
		echo
		cat ~/.ssh/id_rsa.pub
		echo
	fi
}

# Test authentication
# Remove default ssh client configuaration
# Send request to github server to compare key pair
auth_test() {
	SSH_CONFIG="/etc/ssh/ssh_config"
	[[ -e $SSH_CONFIG ]] && [[ sudo chmod +w $SSH_CONFIG ]] && echo "" > $SSH_CONFIG

	echo
	echo "yes" | ssh -T git@github.com
	echo
}

# Clear current sshkey
auth_clear() {
	rm -rf ~/.ssh/*
	USER=`whoami`
	echo
	echo "Removed all ssh key for $USER"
	echo
}

# Option for authentication
auth_option() {
	echo
	echo "Usage: penlook auth <parameter>"
	echo "Parameters:"
    echo
    echo "  \$email  Generate new ssh key using email address"
    echo "  key     View current public key"
    echo "  clear   Clear current ssh key"
    echo "  test    Test authentication works properly"
    echo
}