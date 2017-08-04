# @Author: Vincent Dupont <vincent>
# @Date:   2017-08-03T10:08:36+02:00
# @Email:  vidupont@gmail.com
# @Filename: start.sh
# @Last modified by:   vincent
# @Last modified time: 2017-08-04T23:49:00+02:00



#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Make the default flows available in the user library
mkdir -p /data/node-red/user/lib/flows || true
cp /SERVICES/node-red/app/flows/* /data/node-red/user/lib/flows/

# Start app
node-red --settings /SERVICES/node-red/app/settings.js &
