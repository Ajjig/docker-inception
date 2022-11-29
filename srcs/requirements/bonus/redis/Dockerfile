FROM debian:buster

WORKDIR /redis

ARG conf_path=/etc/redis/redis.conf

COPY . .

RUN apt update

RUN apt install redis-server && \
	sed 's///' --in-place ${conf_path}

EXPOSE 6379

CMD [ "redis-server", "--protected-mode no" ]