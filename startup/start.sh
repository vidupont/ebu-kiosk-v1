# @Author: Vincent Dupont <vincent>
# @Date:   2017-06-09T19:18:51+02:00
# @Email:  vidupont@gmail.com
# @Filename: start.sh
# @Last modified by:   vincent
# @Last modified time: 2017-08-01T16:23:13+02:00



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

# Start the interface application
 # Proximus Animation Logo
 bash /STARTUP/proximus_logo.sh
