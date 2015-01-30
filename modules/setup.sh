#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

setup_main() {

	setup_check()
	setup_run()
}

# Check deploy component
setup_check() {
	USER=`whoami`
	ROOT="/home/$USER/src/github.com"

	if [ -d "$ROOT/penlook/setup" ]
	then
		ROOT_DEPLOY="$ROOT/penlook"
	else
		ROOT_DEPLOY="/tmp"
		cd $ROOT_DEPLOY
		penlook clone deploy
	fi
}

# Start setup
setup_run() {
	echo "START SETUP"
}

