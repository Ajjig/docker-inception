FROM debian:buster

RUN apt update

RUN apt install -y mariadb-server

WORKDIR /app

COPY . .

RUN service mysql start && bash tools/setup.sh

CMD ["mysqld_safe"]
