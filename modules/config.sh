
config_main() {
	CONFIG=$(require "config")
	cd $CONFIG
	python ./build.py
}
