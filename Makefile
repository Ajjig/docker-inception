DB = ~/Desktop/inception/data
WP = ~/Desktop/inception/wordpress


all: init clean build

init:
	mkdir -p ~/Desktop/inception/data
	mkdir -p ~/Desktop/inception/wordpress

clean-containers:

	# clear containers nd cached
	docker system prune -f

	# remove volumes
	rm -rf $(DB)/* $(WP)/*
	# this removes all saved images
	-docker rmi $(shell docker images -q | grep -v 1036)

fclean : init down clean-containers
	@docker volume rm wp db

clean : down clean-containers

build:
	docker-compose -f ./srcs/docker-compose.yml up --build
down:
	docker-compose -f ./srcs/docker-compose.yml down

re: fclean all
