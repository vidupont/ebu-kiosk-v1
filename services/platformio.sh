# @Author: Vincent Dupont <vincent>
# @Date:   2017-06-09T19:18:51+02:00
# @Email:  vidupont@gmail.com
# @Filename: platformio.sh
# @Last modified by:   vincent
# @Last modified time: 2017-08-02T16:10:30+02:00

# Initialise the platformio agent, do it once the ENV is set
# Starts the PlatformIO agent if enabled

if [ "$PLATFORMIO_AGENT" == "1" ]; then
  echo "Starting the platfform IO agent."
  pio remote agent start -d /SERVICES &
fi
