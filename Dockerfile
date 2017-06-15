# Dockerfile
#
# docker run -i --tty --rm helje5/rpi-swift:3.1.1
#
FROM ioft/armhf-ubuntu:16.04

LABEL maintainer "Helge Heß <me@helgehess.eu>"

ARG TARBALL=swift-3.1.1-armv7l-ubuntu-16.04.tar.gz

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# Funny: libcurl3 provies libcurl.so.4 :-)
RUN apt-get install -y \
  git           \
  libedit2      \
  libpython2.7 libcurl3 libxml2 libicu55 \
  libc6-dev

ADD $TARBALL /usr/

RUN bash -c "echo '/usr/lib/swift/linux' > /etc/ld.so.conf.d/swift.conf;\
             echo '/usr/lib/swift/clang/lib/linux' >> /etc/ld.so.conf.d/swift.conf;\
             echo '/usr/lib/swift/pm' >> /etc/ld.so.conf.d/swift.conf;\
             ldconfig"

RUN useradd --create-home --shell /bin/bash swift

USER swift
WORKDIR /home/swift
