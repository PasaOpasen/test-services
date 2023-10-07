
up:
	docker run --rm -d --name docker-forward-proxy -p 8080:80 soulteary/docker-nginx-forward-proxy

down:
	docker stop docker-forward-proxy

check:
	curl --proxy http://localhost:8080 https://www.baidu.com --include --verbose

