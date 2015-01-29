#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Author : Loi Nguyen <loint@penlook.com>

main="penlook"
touch $main
echo "" > $main

include() {
	cat $1 >> ./modules/$main.sh
}

include "auth"
include "util"
include "build"
include "test"
include "start"
include "stop"

sudo chmod +x $main
sudo cp -rf $main /usr/bin/$main
cat /usr/bin/penlook