

clean-images:
	docker rm -f $(docker ps -aq) ;  docker rmi -f $(docker images -q)
clean-container:
	yes | docker system prune

fclean : clean-containers clean-images

clean : clean-containers
