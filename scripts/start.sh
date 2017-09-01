# @Author: Vincent Dupont <vincent>
# @Date:   2017-06-09T19:18:51+02:00
# @Email:  vidupont@gmail.com
# @Filename: start.sh
# @Last modified by:   vincent
# @Last modified time: 2017-09-01T11:22:09+02:00



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
#echo "Local Display"

#echo "Audio Device information:"
#amixer

# Turn off the Screen Saver
#xset s off

# Cache the Git Repositories
bash ${root_scripts}/update_repositories.sh



# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
umount /dev/shm && mount -t tmpfs shm /dev/shm

# Start Node-Red Service
#bash ${root_nodered}/app/start.sh

# Start the interface application
# Proximus Animation Logo
bash ${root_scripts}/proximus_logo.sh

# using local electron module instead of the global electron lets you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X istance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs

#echo "Starting ElectronJS."
#rm /tmp/.X0-lock &>/dev/null || true
#startx /usr/src/app/node_modules/electron/dist/electron /usr/src/app/ --enable-logging
