DB = /home/ajjig/inception/data
WP = /home/ajjig/inception/wordpress


all: clean build

init:
	mkdir -p ~/inception/data
	mkdir -p ~/inception/wordpress

clean-containers:

	# clear containers nd cached
	sudo docker system prune -f

	# remove volumes
	sudo rm -rf $(DB)/* $(WP)/*
	# this removes all saved images
	-sudo docker rmi  docker rmi $(shell docker images -q | grep -v 1036

fclean : init down clean-containers

clean : down clean-containers

build:
	sudo docker-compose -f ./srcs/docker-compose.yml up
down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

re: fclean all
