DOCKER_ID_USER=ivoputzer
NAME=chromium
PORT=9222
all: clean build test
clean:
	docker ps -aqf name=$(NAME) | xargs docker rm
build:
	docker build --rm -t $(NAME) .
test:
	docker run --rm --security-opt seccomp=chromium.json -i $(NAME) --version | grep -a "61.0.3163.100"
pull:
	docker pull $(DOCKER_ID_USER)/$(NAME):latest
push: all
	docker tag $(NAME) $(DOCKER_ID_USER)/$(NAME)
	docker push $(DOCKER_ID_USER)/$(NAME)
	docker rmi $(DOCKER_ID_USER)/$(NAME)
