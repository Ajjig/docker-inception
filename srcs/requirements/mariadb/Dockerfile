FROM debian:buster

RUN apt update

RUN apt install -y mariadb-server

WORKDIR /app

EXPOSE 3306

COPY . .

RUN cat conf/conf >> /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && bash tools/setup.sh

CMD ["mysqld_safe"]
