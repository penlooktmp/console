#!/bin/bash
# +--------------------------------------------------------------------------+
# | Penlook Project                                                          |
# +--------------------------------------------------------------------------+
# | Copyright (c) 2015 Penlook Development Team                              |
# +--------------------------------------------------------------------------+
# |                                                                          |
# | This program is free software: you can redistribute it and/or modify     |
# | it under the terms of the GNU Affero General Public License as           |
# | published by the Free Software Foundation, either version 3 of the       |
# | License, or (at your option) any later version.                          |
# |                                                                          |
# | This program is distributed in the hope that it will be useful, but      |
# | WITHOUT ANY WARRANTY; without even the implied warranty of               |
# | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            |
# | GNU Affero General Public License for more details.                      |
# |                                                                          |
# | You should have received a copy of the GNU Affero General Public License |
# | along with this program.  If not, see <http://www.gnu.org/licenses/>.    |
# |                                                                          |
# +--------------------------------------------------------------------------+
# |   Authors: Loi Nguyen  <loint@penlook.com>                               |
# |            Viet Nguyen <vietna@penlook.com>                              |
# +--------------------------------------------------------------------------+

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
    echo "  path    Penlook root directory"
    echo "  clone   Initialize project"
    echo "  update  Pull all repositories"
    echo "  config  Configure project"
    echo "  build   Build all submodules"
    echo "  clean   Clean up project"
    echo "  test    Run unit and integration tests"
    echo "  deploy  Deploy directly to development server"
    echo "  server  Server instances management"
    echo "  storage Storage management"
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
require() {

    if [ -e "$1" ]
    then
        echo "Missing path ! Which path do you want to check ?"
        exit
    fi

    USER=`whoami`
    ROOT="/home/$USER/src/github.com"
    FOLDER="$ROOT/penlook/$1"

    if [ ! -d "$FOLDER" ]
    then
        echo "You need to clone project first !"
    fi

    echo $FOLDER
}
