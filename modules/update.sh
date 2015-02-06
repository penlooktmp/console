#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Viet Nguyen <vietnt@penlook.com>

update_main() {
	echo "Start Update ..."
	USER=`whoami`
	cd /home/$USER/
	sudo rm -rf /home/$USER/*
	penlook clone
	echo "Complete !!!"
}
