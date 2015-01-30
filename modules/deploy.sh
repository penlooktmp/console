#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

deploy_main() {
	USER=`whoami`
	ROOT="/home/$USER/src/github.com"

	if [ -d "$ROOT/penlook/deploy" ]
	then
		ROOT_DEPLOY="$ROOT/penlook"
	else
		ROOT_DEPLOY="/tmp"
		cd $ROOT_DEPLOY
		penlook clone deploy
	fi

	deploy_run $ROOT_DEPLOY
}

deploy_run() {
	echo "START DEPLOY"
}

