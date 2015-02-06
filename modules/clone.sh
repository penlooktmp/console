#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

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
	git clone git@github.com:penlook/$1.git --recursive
	cd $1
	git submodule foreach git checkout master
	git submodule foreach git submodule update --init --recursive
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

	git submodule update --init --recursive && git submodule foreach "(git checkout master; git pull origin master; cd ..;)" --recursive

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
