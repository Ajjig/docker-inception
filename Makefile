DB = ~/Desktop/inception/data
WP = ~/Desktop/inception/wordpress


all: init build

init:
	mkdir -p /home/ajjig/data/database
	mkdir -p  /homw/ajjig/data/wordpress

clean-containers:

	docker system prune -f

	rm -rf $(DB)/* $(WP)/*
	-docker rmi $(shell docker images -q | grep -v 1036)

fclean : clean
	@docker volume rm wp db

clean : down clean-containers

build:
	docker-compose -f ./srcs/docker-compose.yml up --build
down:
	docker-compose -f ./srcs/docker-compose.yml down

re: fclean all
