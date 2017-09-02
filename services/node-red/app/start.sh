# @Author: Vincent Dupont <vincent>
# @Date:   2017-08-03T10:08:36+02:00
# @Email:  vidupont@gmail.com
# @Filename: start.sh
# @Last modified by:   vincent
# @Last modified time: 2017-09-02T14:56:14+02:00



#!/bin/bash

echo "Starting Node-Red service."

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Make the default flows available in the user library
mkdir -p ${root_nodered_data}/flows || true
mkdir -p ${root_nodered_data}/nodes || true

cp ${root_nodered}/app/flows/* ${root_nodered_data}/flows

# Start app
${root_app}/node_modules/node-red/bin/node-red-pi --settings ${root_nodered}/app/settings.js &
