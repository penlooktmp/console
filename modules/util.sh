#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Author : Loi Nguyen <loint@penlook.com>

set -e

version_main() {
    echo "PENLOOK CLI 1.0.0"
}

usage_main() {
    version_main
    echo
    echo "Usage: penlook [ clone | update | build | test | deploy | backup ]"
    echo
}

help_main() {
    usage_main
    echo
    echo
    echo "  PENLOOK CLI"
    echo
    echo "  clone   Initialize project"
    echo "  update  Pull all repositories"
    echo "  build   Build all submodules"
    echo "  test    Run unit and integration tests"
    echo "  deploy  Deploy directly to development server"
    echo "  backup  Create backup source code and database"
    echo
    echo "  For more information, see https://github.com/penlook/console"
    echo
    echo
}
