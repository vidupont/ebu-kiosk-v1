# @Author: Vincent Dupont <vincent>
# @Date:   2017-06-09T19:18:51+02:00
# @Email:  vidupont@gmail.com
# @Filename: start.sh
# @Last modified by:   vincent
# @Last modified time: 2017-08-04T17:45:26+02:00



#!/bin/bash
#
# Dupont Vincent - 11/06/2017
#
# Main start script to intialise and run the application
# All the parameters come from the ENV injected via Resin.IO Portal
# Do not use static variable into the Docker, consider dynamic behaviour of
# Environment Variables and Device variables


# Display some information about the Environment
echo "List of USB Devices detected:"
lsusb
#echo "Audio Device information:"
#amixer

# Turn off the Screen Saver - Temporary workaround
# xset s off

# Cache the Git Repositories
bash /STARTUP/update_repositories.sh

# Start the interface application
# Proximus Animation Logo
bash /STARTUP/proximus_logo.sh

# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
umount /dev/shm && mount -t tmpfs shm /dev/shm

# using local electron module instead of the global electron lets you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X istance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs

rm /tmp/.X0-lock &>/dev/null || true
startx /usr/src/app/node_modules/electron/dist/electron /usr/src/app/ --enable-logging
