FROM ubuntu:20.04

RUN apt update && apt install python3-pip libpq-dev python-dev -y
RUN mkdir /var/log/pygmy

WORKDIR /pygmy
ADD ./requirements.txt /pygmy/requirements.txt
RUN pip3 install -r requirements.txt
ADD . /pygmy

EXPOSE 9119

CMD ["gunicorn", "-b 0.0.0.0:9119", "-w 1", "pygmy.rest.wsgi:app"]
