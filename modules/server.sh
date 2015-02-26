
server_main() {
	SERVER=$(require "console/server")
	cd $SERVER
	./main.rb instance $@
}

storage_main() {
	SERVER=$(require "console/server")
	cd $SERVER
	./main.rb storage $@
}
