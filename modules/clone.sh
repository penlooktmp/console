#!/bin/bash
# +--------------------------------------------------------------------------+
# | Penlook Project                                                          |
# +--------------------------------------------------------------------------+
# | Copyright (c) 2015 Penlook Development Team                              |
# +--------------------------------------------------------------------------+
# |                                                                          |
# | This program is free software: you can redistribute it and/or modify     |
# | it under the terms of the GNU Affero General Public License as           |
# | published by the Free Software Foundation, either version 3 of the       |
# | License, or (at your option) any later version.                          |
# |                                                                          |
# | This program is distributed in the hope that it will be useful, but	     |
# | WITHOUT ANY WARRANTY; without even the implied warranty of               |
# | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            |
# | GNU Affero General Public License for more details.                      |
# |                                                                          |
# | You should have received a copy of the GNU Affero General Public License |
# | along with this program.  If not, see <http://www.gnu.org/licenses/>.    |
# |                                                                          |
# +--------------------------------------------------------------------------+
# |   Authors: Loi Nguyen  <loint@penlook.com>                               |
# |            Viet Nguyen <vietna@penlook.com>                              |
# +--------------------------------------------------------------------------+

# Clone project from Github
clone_main() {
	if [ ! -e $1 ] && [ "$1" != "*" ]
	then
		clone_one $1
	else
		clone_all
	fi
}

# Clone one submodule
clone_one() {
	git clone -b master git@github.com:penlook/$1.git --depth=1
	cd $1
	git submodule update --init --recursive --remote --depth=1
	git submodule sync --recursive
	git submodule status
	git submodule foreach git checkout master
}

# Clone all submodule and
# create project structure
clone_all() {
	USER=`whoami`
	export GOPATH="/home/$USER"
	ROOT="/home/$USER/src/github.com"
	mkdir -p $ROOT
	sudo rm -rf $ROOT/*

	cd $ROOT
	git clone -b master git@github.com:penlook/penlook.git --depth=1
	cd penlook

	git submodule update --init --recursive --remote --depth=1
	git submodule sync --recursive
	git submodule status
	git submodule foreach git checkout master

	clone_module_backend
	clone_module_service
}

# Configure for module backend
clone_module_backend() {
	# backend
	cd backend
	curl -sS https://getcomposer.org/installer | php
	php composer.phar update
	cd ..
}

# Configure for module service
clone_module_service() {
	# Exception
	TMP=`pwd`
	USER=`whoami`
	cd "/home/$USER/src/github.com"
	mkdir -p google
	cd google
	git clone git@github.com:penlook/cayley.git
	cd cayley
	git checkout master
	go get -v ./...
	go build
	cd $TMP

	cd service
	go get -v ./...
	go get github.com/stretchr/testify/assert
	cd ..
}
