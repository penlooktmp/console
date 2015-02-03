#!/bin/bash
# Copyright 2014 Penlook Development Team. All rights reserved.
# Use of this source code is governed by
# license that can be found in the LICENSE file.
# Author : Loi Nguyen <loint@penlook.com>

set -e

# Show version number of Cli
version_main() {
    echo "PENLOOK CLI 1.0.0"
}

# Show usage
usage_main() {
    echo
    version_main
    echo "Usage: penlook <option>"
}

# Show command document
help_main() {
    usage_main
    echo "Options:"
    echo
    echo "  auth    Server authentication"
    echo "  clone   Initialize project"
    echo "  update  Pull all repositories"
    echo "  build   Build all submodules"
    echo "  clean   Clean up project"
    echo "  test    Run unit and integration tests"
    echo "  deploy  Deploy directly to development server"
    echo "  server  Multiple cluster status"
    echo "  setup   Setup development environment"
    echo "  backup  Create backup source code and database"
    echo "  help    Support more command"
    echo "  version current version"
    echo
    echo "  For more information, see https://github.com/penlook/console"
    echo
}

# If project does not exist
# You need to clone it before using
# this option
require_project() {
    USER=`whoami`
    ROOT="/home/$USER/src/github.com"
    CONFIG="$ROOT/penlook/config"

    if [ ! -d "$CONFIG" ]
    then
        echo "You need to clone project before $1 it"
    else
        cd $CONFIG
        python ./build.py
    fi
}
