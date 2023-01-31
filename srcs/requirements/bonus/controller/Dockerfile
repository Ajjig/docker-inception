FROM debian:buster

RUN apt update

RUN apt install python3-pip -y

RUN yes | pip3 install requests

COPY . .

CMD ["python3", "controller.py"]