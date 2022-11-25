#Docker-compose makefile
all:
	@echo "On first run, use make volume and sudo make setup"
build:
	docker-compose -f ./srcs/docker-compose.yml build
up:
	docker-compose -f ./srcs/docker-compose.yml up -d
down:
	docker-compose -f ./srcs/docker-compose.yml down
restart:
	docker-compose -f ./srcs/docker-compose.yml down
	docker-compose -f ./srcs/docker-compose.yml up -d
clean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker system prune -a -f
	docker volume prune -f
	docker volume rm $$(docker volume ls -q) || true
	docker rmi -f $(docker images -a -q) || true
	docker rm -f $(docker ps -a -q) || true
launch: build up
volume: 
	@mkdir -p ~/vol/mariadb
	@mkdir -p ~/vol/wordpress
setup:
	@sudo grep -qxF "127.0.0.1 rponsonn.42.fr" /etc/hosts || echo "127.0.0.1 rponsonn.42.fr" >> /etc/hosts
.PHONY: all build up down restart clean launch volume setup