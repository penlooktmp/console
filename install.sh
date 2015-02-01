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
	include "setup"
	include "test"
	include "main"

	sudo chmod +x $main
	sudo cp -rf $main /usr/bin/$main
	echo "Install complete !"
	penlook
}

# Before install we need to copy the package
# which includes all necessary modules
prepare_local() {
	CURRENT=`pwd`
	console="/usr/local/src"
	mkdir -p $console
	sudo rm -rf $console/*
	sudo chmod a+w $console && cd $console
	mkdir -p console
	cd console
	cp -rf $CURRENT/* ./
}

# Before install we need to clone the package
# which includes all necessary modules
prepare_remote() {
	penlook="/usr/local/src/penlook"
	sudo mkdir -p $penlook
	sudo rm -rf $penlook/*
	sudo chmod a+w $penlook && cd $penlook
	git clone https://github.com/penlook/console.git
	cd console
	git submodule foreach git checkout master
	git submodule update --init --recursive
	git submodule foreach git checkout master
}

# Enable for debug mode
# Using debug as parameter
if [ ! -e $1 ] && [ $1 == "debug" ]
then
	prepare_local
	install
else
	prepare_remote
	install
fi

