FROM render_base:blender
MAINTAINER Nathan Mitchell
RUN apt-get update && apt-get install -y python python-tornado python-pika python-requests git
RUN git clone https://github.com/thecsapprentice/phoenix-plumage-client.git /var/rendernode
ENTRYPOINT ["/usr/bin/python", "/var/rendernode/RenderNode.py"]
