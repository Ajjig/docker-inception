FROM debian:buster

RUN apt-get update

RUN apt-get install -y mariadb-server

WORKDIR /app

EXPOSE 3306

COPY . .

RUN cat conf/conf > /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start ; mysql -u root < ./tools/FILE.sql

CMD ["mysqld_safe"]
