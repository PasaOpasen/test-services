
up:
	mkdir -p output
	docker compose up -d 
	sleep 0.4
	docker exec vault-test sh -c 'sh /post_init/fill_values.sh | tee /out/init.txt'

down:
	docker compose down

restart: down up
