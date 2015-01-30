#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Author : Loi Nguyen <loint@penlook.com>

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
	if [ -e "~/.ssh/id_rsa" ]
	then
		echo -ne '\n' | ssh-keygen -t rsa -C $1
		eval `ssh-agent -s`
		ssh-add ~/.ssh/id_rsa
	else
		echo "SSH Key is already exist"
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
		echo "using the below command to create new pair"
		echo "$ penlook auth @email"
	else
		echo
		cat ~/.ssh/id_rsa.pub
		echo
	fi
}

# Test authentication
auth_test() {
	echo "yes" | ssh -T git@github.com
}

# Clear current sshkey
auth_clear() {
	rm -rf ~/.ssh/*
}

# Option for authentication
auth_option() {
	echo
	echo "Usage: penlook auth <option>"
	echo "Options:"
    echo
    echo "  \$email  Generate new ssh key using email address"
    echo "  key     View current public key"
    echo "  clear   Clear current ssh key"
    echo "  test    Test authentication works properly"
    echo
}