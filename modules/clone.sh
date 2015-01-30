#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

# Clone project from Github
clone_main() {
	clone_all
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
	git clone git@github.com:penlook/penlook.git --recursive
	cd penlook

	git submodule foreach git checkout master
	git submodule foreach git submodule update --init --recursive

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
	cd service
	go get -v ./...
	go get github.com/stretchr/testify/assert
	cd ..
}
