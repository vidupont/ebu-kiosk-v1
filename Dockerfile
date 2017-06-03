# ------------------------------------------------------------------------------
# Proximus EBU Kiosk - Docker Template v1.0
#
# 03/06/2017 - Vincent Dupont (vidupont@gmail.com)
#
# Base Image :
#  - resin/raspberrypi3-debian : latest
#
# Dependencies:
# - Python
#
# Packages:
#
# Info: Resin Base Images : https://docs.resin.io/runtime/resin-base-images/
# ------------------------------------------------------------------------------

# Base Image from Resin repository

FROM resin/raspberrypi3-debian:latest

# Install Python
RUN apt-get update && apt-get install -y python
RUN apt-get install -y python-pip python-all python-dev python-xlib
RUN apt-get install -y python-setuptools python-pygame python-opengl python-enchant
RUN apt-get install -y python-gst0.10 python-enchant python-dev python-numpy

# Install Kivy dependencies
RUN apt-get install -y libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev
RUN apt-get install -y pkg-config mesa-common-dev libgl1-mesa-dev libgles2-mesa-dev
RUN apt-get install -y ibgstreamer1.0-dev gstreamer1.0-plugins-good gstreamer1.0-omx gstreamer1.0-alsa
RUN apt-get install -y build-essential libmtdev-dev xclip

# Install git-core
RUN apt-get install -y git

# Default Working Directory
WORKDIR /

# PIP dependencies
COPY ./python-deps.txt /python-deps.txt
RUN pip install -r /python-deps.txt

# Install Kivy
RUN pip install git+https://github.com/kivy/kivy.git@master


# Copy all other files into the root directory of the container
COPY . /

# Enable Systemd
ENV INITSYSTEM on

# RUN the Main Application
# CMD ["python","/kivy/kivycatalog/main.py"]
