#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

setup_main() {

	if [ -e $1 ]
	then
		setup_option
	else
		ROOT="/usr/local/src/console"
		setup_run $ROOT $1
	fi
}

setup_run() {
	echo "START SETUP"
	ls -la $1
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

