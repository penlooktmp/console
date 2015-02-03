#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

config_main() {
	CONFIG=$(require "config")
	cd $CONFIG
	python ./build.py
}
