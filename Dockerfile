# ------------------------------------------------------------------------------
# Proximus EBU Kiosk - Docker Template v1.0
#
# 03/06/2017 - Vincent Dupont (vidupont@gmail.com)
#
# Base Image :
#  - resin/%%RESIN_MACHINE_NAME%%-node:6 : NodeJs Image
#
# Dependencies:
# -
#
# Packages:
#
# Info: Resin Base Images : https://docs.resin.io/runtime/resin-base-images/
# ------------------------------------------------------------------------------

# Base Image from Resin repository

FROM resin/%%RESIN_MACHINE_NAME%%-node:6

RUN apt-get update && apt-get install -y \
  apt-utils \
  clang \
  xserver-xorg-core \
  xserver-xorg-input-all \
  xserver-xorg-video-fbdev \
  xorg \
  libdbus-1-dev \
  libgtk2.0-dev \
  libnotify-dev \
  libgnome-keyring-dev \
  libgconf2-dev \
  libasound2-dev \
  libcap-dev \
  libcups2-dev \
  libxtst-dev \
  libxss1 \
  libnss3-dev \
  fluxbox \
  libsmbclient \
  libssh-4 \
  fbset \
  libexpat-dev && rm -rf /var/lib/apt/lists/*

  # Set Xorg and FLUXBOX preferences
  RUN mkdir ~/.fluxbox
  RUN echo "xset s off" > ~/.fluxbox/startup && echo "xserver-command=X -s 0 dpms" >> ~/.fluxbox/startup
  RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
    && echo "" >> /etc/X11/xinit/xserverrc \
    && echo 'exec /usr/bin/X -s 0 dpms -nocursor -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc

# Default Working Directory
WORKDIR /usr/src/app




# Copy all other files into the root directory of the container
COPY ./app/package.json ./

# Install npm modules for the application
RUN JOBS=MAX npm install --unsafe-perm --production \
	&& npm cache clean && node_modules/.bin/electron-rebuild

# Perform last upgrade before running
#RUN apt-get upgrade

COPY ./app ./

# Enable Systemd
ENV INITSYSTEM on


# PlatformIO Authentication & start Agent
RUN pio remote agent start -d /data &


# RUN the Main Application
# CMD ["python","/kivy/kivycatalog/main.py"]
CMD ["bash", "/usr/src/app/start.sh"]
