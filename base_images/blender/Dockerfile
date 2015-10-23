FROM debian:jessie
MAINTAINER Nathan Mitchell
LABEL description="Base image for blender. Uses custom patch with OpenVDB levelset rendering support."

RUN apt-get update && apt-get install -y \
git \
scons \
g++ \
make \
python3 \
python3-dev \
libjpeg-dev \
libz-dev \
libgl1-mesa-dev \
libglu1-mesa-dev \
libavformat-dev \
libswscale-dev \
libfftw3-dev \
libfreetype6-dev \
libboost1.55-dev \
libavdevice-dev \
libtiff5-dev \
libsdl1.2-dev \
libilmbase-dev \
libopenexr-dev \
autoconf \
libtool \
libopenal-dev \
libxi-dev \
libspnav-dev \
libtbb-dev \
liblog4cplus-dev \
libboost-system1.55-dev \
libpython3.4-dev \
libjemalloc-dev \
libboost-iostreams1.55-dev \
doxygen \
libboost-filesystem1.55 \
libboost-thread1.55 \
libboost-locale1.55 \
libopenimageio-dev \
libopencolorio-dev \
libyaml-cpp0.3-dev \
libtinyxml-dev

COPY build_blender.sh /build_blender.sh

ENV LD_LIBRARY_PATH=/usr/local/lib

RUN chmod +x /build_blender.sh && /bin/bash /build_blender.sh && ln -s /blender_experimental/install/linux/blender /usr/bin/blender
