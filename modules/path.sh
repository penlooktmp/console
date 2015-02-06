#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

path_main() {
	USER=`whoami`
	ROOT="/home/$USER/src/github.com"
	cd $ROOT/penlook
	ROOT_PATH=`pwd`
	echo -e "\n cd $ROOT_PATH \n"
}