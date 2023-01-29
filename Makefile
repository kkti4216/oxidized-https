up:
	docker-compose up -d
	./enable_ipv6_docker.sh

down:
	./disable_ipv6_docker.sh
	docker-compose down

updown:
	./disable_ipv6_docker.sh
	docker-compose down
	./enable_ipv6_docker.sh
	docker-compose up -d
