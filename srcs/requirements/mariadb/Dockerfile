FROM debian:buster

RUN apt update

RUN apt install -y mariadb-server

WORKDIR /app

COPY . .

RUN service mysql start

RUN chmod +x tools/setup.sh && bash tools/FILE.sql

CMD ["mysql_safe"]
