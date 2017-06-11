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

# Start the interface application
 # Proximus Animation Logo
 bash /STARTUP/proximus_logo.sh
