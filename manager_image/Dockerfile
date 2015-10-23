FROM debian:latest
MAINTAINER Nathan Mitchell
RUN apt-get update && apt-get install -y python python-tornado python-pika python-pillow python-sqlalchemy git
EXPOSE 8888
RUN git clone https://github.com/thecsapprentice/phoenix-plumage-manager.git /var/rendermanager
ENTRYPOINT ["/usr/bin/python", "/var/rendermanager/server.py" ]
