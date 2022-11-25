
all: clean build

clean-images:
	docker rm -f $(docker ps -aq) ;  docker rmi -f $(docker images -q)

clean-containers:
	docker system prune -f
	sudo rm -rf srcs/data/* srcs/wordpress/*

fclean : down clean-containers clean-images

clean : down clean-containers

build:
	docker-compose -f ./srcs/docker-compose.yml up
down:
	docker-compose -f ./srcs/docker-compose.yml down

re: fclean all
