install:
	chmod +x all.sh
	./all.sh
test:
	if [ -f "/usr/bin/penlook" ]; then penlook; true; else echo "Installaion error"; false; fi