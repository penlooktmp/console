#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Author : Loi Nguyen <loint@penlook.com>

auth_main() {
	echo -ne '\n\n\n' | ssh-keygen -t rsa -C @1
}
