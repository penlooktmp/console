#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

server_main() {
	echo "Master : 192.168.1.1 > running" 
	echo "Worker : 192.168.1.2 > stop"
	echo "Worker : 192.168.1.3 > running"
	echo "Worker : 192.168.1.4 > stop"
	echo "Worker : 192.168.1.5 > running"
}