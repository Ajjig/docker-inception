FROM debian:buster

WORKDIR /app

RUN yes | apt-get update

RUN yes | apt-get install openssl

RUN yes | apt install nginx

EXPOSE 443

COPY . .

<<<<<<< HEAD
=======
RUN bash tools/setup.sh

COPY tools/default /etc/nginx/sites-available/default

>>>>>>> dev
CMD ["nginx", "-g", "daemon off;"]
