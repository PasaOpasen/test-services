
move-secrets:
	bash move-secrets.sh

up:
	mkdir -p output
	docker compose up -d 
	sleep 0.4
	docker exec vault-test sh -c 'sh /post_init/fill_values.sh | tee /out/init.txt'
	make move-secrets

down:
	docker compose down

restart: down up
