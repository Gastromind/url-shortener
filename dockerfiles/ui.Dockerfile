FROM ubuntu:20.04

RUN apt update && apt install python3-pip -y
RUN mkdir /var/log/pygmy

WORKDIR /pygmy
ADD ./requirements.txt /pygmy/requirements.txt
RUN pip3 install -r requirements.txt
ADD . /pygmy

EXPOSE 8000

CMD ["python3", "run.py"]
