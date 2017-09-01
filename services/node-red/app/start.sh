# @Author: Vincent Dupont <vincent>
# @Date:   2017-08-03T10:08:36+02:00
# @Email:  vidupont@gmail.com
# @Filename: start.sh
# @Last modified by:   vincent
# @Last modified time: 2017-09-01T11:50:55+02:00



#!/bin/bash

echo "Starting Node-Red service."

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Make the default flows available in the user library
mkdir -p ${root_nodered_data}/flows || true
mkdir -p ${root_nodered_data}/nodes || true

cp ${root_nodered}/app/flows/* ${root_nodered_data}/flows
#mv /SERVICES/node-red/kioskflows.json /data/node-red/user/

# Start app
#node-red --settings ${root_nodered}/app/settings.js &
