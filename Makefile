DB = /home/ajjig/inception/data
WP = /home/ajjig/inception/wordpress


all: clean build

init:
	mkdir -p ~/inception/data
	mkdir -p ~/inception/wordpress

clean-containers:
	sudo docker system prune -f
	sudo rm -rf $(DB)/* $(WP)/*

fclean : init down clean-containers

clean : down clean-containers

build:
	sudo docker-compose -f ./srcs/docker-compose.yml up
down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

re: fclean all
