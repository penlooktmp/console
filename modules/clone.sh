
# Clone project from Github
clone_main() {
	if [ ! -e $1 ] && [ "$1" != "*" ]
	then
		clone_one $1
	else
		clone_all
	fi
}

# Clone one submodule
clone_one() {
	git clone -b master git@github.com:penlook/$1.git --depth=1
	cd $1
	git submodule update --init --recursive --remote --depth=1
	git submodule sync --recursive
	git submodule status
	git submodule foreach git checkout master
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
	git clone -b master git@github.com:penlook/penlook.git --depth=1
	cd penlook

	git submodule update --init --recursive --remote --depth=1
	git submodule sync --recursive
	git submodule status
	git submodule foreach git checkout master

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
	# Exception
	TMP=`pwd`
	USER=`whoami`
	cd "/home/$USER/src/github.com"
	mkdir -p google
	cd google
	wget https://github.com/penlook/cayley/archive/master.zip -O cayley.zip
	unzip cayley.zip
	rm -rf cayley.zip
	mv cayley-master cayley
	cd cayley
	go get -v ./...
	go build
	cd $TMP

	cd service
	go get -v ./...
	go get github.com/stretchr/testify/assert
	cd ..
}
