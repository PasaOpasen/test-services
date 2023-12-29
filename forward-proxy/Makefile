
up:
	docker run --rm -d --name docker-forward-proxy -p 8051:80 soulteary/docker-nginx-forward-proxy

down:
	docker stop docker-forward-proxy

check:
	curl --proxy http://localhost:8051 https://www.baidu.com --include --verbose

restart: down up 
	sleep 1
	make check
