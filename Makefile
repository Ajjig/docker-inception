

clean-images:
	docker rmi $(docker images | grep -v buster | grep -v REPOSITORY | awk '{print $ 1}')

clean-container:
	yes | docker system prune

fclean : clean-containers clean-images

clean : clean-containers
