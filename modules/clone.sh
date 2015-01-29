#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

clone_main() {

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

	# backend
	cd backend
	curl -sS https://getcomposer.org/installer | php
	php composer.phar update
	cd ..

	# service
	cd service
	go get -v ./...
	go get github.com/stretchr/testify/assert
	cd ..

}