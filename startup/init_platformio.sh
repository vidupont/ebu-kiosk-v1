# Initialise the platformio agent, do it once the ENV is set

# Starts the PlatformIO agent if enabled

if [ "$PLATFORMIO_AGENT"="1" ]; then
  echo "Starting the platfform IO agent."
  pio remote agent start -d $KIOSK_DATA &
fi
