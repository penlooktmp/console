#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

main="penlook"
touch $main
echo "" > $main

include() {
	cat ./modules/$1.sh >> $main
	echo $'\n'  >> $main
}

include "auth"
include "util"
include "build"
include "test"
include "start"
include "stop"
include "main"

sudo chmod +x $main
sudo cp -rf $main /usr/bin/$main