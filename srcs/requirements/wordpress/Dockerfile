FROM debian:buster

RUN apt update

RUN apt install -y php7.4 php-mysqli php-fpm wget

RUN wget 'https://wordpress.org/latest.zip' && unzip latest.zip && rm -rf latest.zip

RUN mkdir -p /var/www/html/ && cp -r wordpress/* /var/www/html/
