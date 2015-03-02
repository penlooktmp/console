install:
	chmod +x all.sh
	./all.sh
test:
	if [ -f "/usr/bin/penlook" ]; then bash penlook; true; else echo "Installation error"; false; fi