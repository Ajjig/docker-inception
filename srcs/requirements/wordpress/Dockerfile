FROM debian:buster

RUN apt update

WORKDIR /app

COPY . .

RUN apt install -y php7.3 php7.3-mysql php7.3-fpm curl

EXPOSE 9000
####
RUN echo '[www]' > /etc/php/7.3/fpm/pool.d/www.conf
RUN echo 'user = www-data' >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo 'group = www-data' >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo 'listen = 127.0.0.1:9000' >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo 'pm = dynamic' >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo 'pm.start_servers = 6' >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo 'pm.max_children = 25' >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo 'pm.min_spare_servers = 2' >> /etc/php/7.3/fpm/pool.d/www.conf
RUN echo 'pm.max_spare_servers = 10' >> /etc/php/7.3/fpm/pool.d/www.conf
####
ENTRYPOINT [ "bash", "./tools/setup.sh" ]

# CMD ["php-fpm7.3", "--nodaemonize"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
