#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

# Make an empty file and append content
# Include all modules in one file
# Set excutable permission for file
# Copy it to /usr/bin/penlook and ready to run
install() {

	main="penlook"
	touch $main
	echo "" > $main

	include() {
		cat ./modules/$1.sh >> $main
		echo $'\n'  >> $main
	}

	include "util"
	include "auth"
	include "clone"
	include "build"
	include "deploy"
	include "test"
	include "start"
	include "stop"
	include "clean"
	include "server"
	include "test"
	include "main"

	sudo chmod +x $main
	sudo cp -rf $main /usr/bin/$main
	echo "Install complete !"
}

# Before install we need to clone the package
# which includes all necessary modules
prepare() {
	cd /tmp
	sudo rm -rf console
	git clone https://github.com/penlook/console.git
	cd console
}

# After installing, remove all temporary files
# in /tmp/console
cleanup() {
	rm -rf /tmp/console
	penlook
}

if [ ! -e $1 ] && [ $1 == "debug" ]
then
	install
else
	prepare
	install
	cleanup
fi

