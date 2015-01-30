#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Loi Nguyen <loint@penlook.com>

# CLI Main
main() {

	if [ ! -e $1 ]
	then
		# Remove first argumentin args
		$1_main "${@:2}"
	else
		help_main
	fi
}

main $@

