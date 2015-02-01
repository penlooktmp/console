#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

setup_main() {
	OS=$(tr -s ' \011' '\012' < /etc/issue | head -n 1)
	case "$OS" in

	"Ubuntu")
		setup_$OS
		;;
	"CentOS")
		setup_$OS
		;;
	*) echo "Current operation system is not supported !"
		;;
	esac
}

setup_Ubuntu() {
	echo 'not yet implemented !'
	exit
}

setup_CentOS() {
	cd setup
	sudo python centos.py
}

# Option for authentication
setup_option() {
	echo
	echo "Usage: penlook setup <parameter>"
	echo "Parameters:"
    echo
    echo "  ubuntu  Ubuntu"
    echo "  centos  Centos"
    echo "  coreos  CoreOS"
    echo
}

