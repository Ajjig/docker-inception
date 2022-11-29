FROM debian:buster

WORKDIR /app

RUN yes | apt-get update

RUN yes | apt-get install openssl

RUN yes | apt install nginx

EXPOSE 443

COPY . .

RUN bash tools/setup.sh

COPY conf/default /etc/nginx/sites-enabled/default


CMD ["nginx", "-g", "daemon off;"]
