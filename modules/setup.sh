#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

setup_main() {
	USER=`whoami`
	ROOT="/home/$USER/src/github.com"

	if [ -d "$ROOT/penlook/setup" ]
	then
		ROOT_SETUP="$ROOT/penlook"
	else
		ROOT_SETUP="/tmp"
		cd $ROOT_SETUP
		penlook clone deploy
	fi

	deploy_run $ROOT_SETUP
}

setup_run() {
	echo "START SETUP"
}


