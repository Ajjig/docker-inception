FROM debian:buster

RUN apt update

WORKDIR /app

COPY . .

RUN apt install -y php7.3 php7.3-mysql php7.3-fpm curl

EXPOSE 9000

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp && chmod 755 /usr/local/bin/wp
ENTRYPOINT [ "bash", "tools/setup.sh"]

CMD ["php-fpm7.3", "--nodaemonize"]
