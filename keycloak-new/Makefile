
up:
	mkdir -p data
	sudo chown 1001:1001 -R data
	docker compose up -d 

down:
	docker compose down

restart: down up


reset:
	sudo rm -rf data


cert:
	mkdir -p cert
	sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout cert/tls.key -out cert/tls.crt
	sudo chown 1001:1001 -R cert

