#Docker-compose makefile

build:
	docker-compose -f ./srcs/docker-compose.yml build
up:
	docker-compose -f ./srcs/docker-compose.yml up -d
down:
	docker-compose -f ./srcs/docker-compose.yml down
restart:
	docker-compose -f ./srcs/docker-compose.yml down
	docker-compose -f ./srcs/docker-compose.yml up -d
logs:
	docker-compose -f ./srcs/docker-compose.yml logs -f
clean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker system prune -a -f
	docker volume prune -f
	docker volume rm $$(docker volume ls -q) || true
	docker rmi -f $(docker images -a -q) || true
	docker rm -f $(docker ps -a -q) || true
launch: build up

.PHONY: build up down restart logs clean launch