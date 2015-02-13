#!/bin/bash
#
# Penlook Project
#
# Copyright (c) 2015 Penlook Development Team
#
# --------------------------------------------------------------------
#
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public License
# as published by the Free Software Foundation, either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public
# License along with this program.
# If not, see <http://www.gnu.org/licenses/>.
#
# --------------------------------------------------------------------
#
# Authors:
#     Loi Nguyen       <loint@penlook.com>
#     Viet Nguyen      <vietna@penlook.com>

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
	include "path"
	include "update"
	include "build"
	include "config"
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
}

# Before install we need to copy the package
# which includes all necessary modules
prepare_local() {
	CURRENT=`pwd`
	penlook="/usr/local/src/penlook"
	sudo mkdir -p $penlook
	sudo rm -rf $penlook/*
	sudo chmod a+w $penlook && cd $penlook
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
	git clone -b master https://github.com/penlook/console.git --depth=1
	cd console
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

