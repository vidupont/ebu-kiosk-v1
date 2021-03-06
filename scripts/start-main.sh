# @Author: Vincent Dupont <vincent>
# @Date:   2017-06-09T19:18:51+02:00
# @Email:  vidupont@gmail.com
# @Filename: start.sh
# @Last modified by:   vincent
# @Last modified time: 2017-09-07T19:23:31+02:00



#!/bin/bash
#
# Dupont Vincent - 11/06/2017
#
# Main start script to intialise and run the application
# All the parameters come from the ENV injected via Resin.IO Portal
# Do not use static variable into the Docker, consider dynamic behaviour of
# Environment Variables and Device variables

echo "** Starting Main Script **"

# Set DISPLAY var
DISPLAY=:0.0

# Display some information about the Environment
echo "List of USB Devices detected:"
lsusb
#echo "Local Display"

#echo "Audio Device information:"
#amixer

# !!! Turn off the Screen Saver - to be fixed !!!

if [ "$KIOSK_SCREENSAVER" == "0" ]; then
  echo "Setting Screensaver off."
  xset s off
  xset -dpms
  xset s noblank
else
  echo "Setting Screensaver on."


fi



# Cache the Git Repositories
bash ${root_scripts}/update_repositories.sh



# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
umount /dev/shm && mount -t tmpfs shm /dev/shm

# Start Node-Red Service

if [ "$RED_BACKEND" == "1" ]; then
  echo "Starting NodeRed Backend"
  bash ${root_nodered}/app/start.sh
else
  echo "NodeRed Backend disabled."
fi

# Start the interface application
# Proximus Animation Logo
bash ${root_scripts}/proximus_logo.sh

# Check which Session to be started, based on ENV "KIOSK_MODE"

# if KIOSK_MODE not set to "admin" then ...
# Start the X Session with limited app frontend
# if KIOSK_MODE is set to "browser", chromium is started with URL bar
# Chromium command flags : https://peter.sh/experiments/chromium-command-line-switches/
rm /tmp/.X0-lock &>/dev/null || true

echo "Starting Kiosk Front-End:"

case $KIOSK_MODE in
  admin|ADMIN) ;;

  kiosk|KIOSK)
  FRONTEND="/usr/bin/google-chrome --disable-infobars --no-sandbox --no-first-run \
      --ignore-gpu-blacklist \
      --enable-accelerated-2d-canvas \
      --enable-gpu-rasterization \
      --enable-gpu-compositing \
      --enable-native-gpu-memory-buffers \
      --enable-gpu-memory-buffer-compositor-resources \
      --enable-gpu-memory-buffer-video-frames \
      --cast-initial-screen-height=$KIOSK_HEIGHT \
      --cast-initial-screen-width=$KIOSK_WIDTH \
      --window-position=$KIOSK_X,$KIOSK_Y \
      --window-size=$KIOSK_WIDTH,$KIOSK_HEIGHT \
      --kiosk
      $KIOSK_URL"

    echo "-- Kiosk mode:"
    echo " $FRONTEND"
    startx $FRONTEND
    ;;

  browser|BROWSER)
    FRONTEND="/usr/bin/google-chrome --disable-infobars --no-sandbox --no-first-run \
        --ignore-gpu-blacklist \
        --enable-accelerated-2d-canvas \
        --enable-gpu-rasterization \
        --enable-gpu-compositing \
        --enable-native-gpu-memory-buffers \
        --enable-gpu-memory-buffer-compositor-resources \
        --enable-gpu-memory-buffer-video-frames \
        --cast-initial-screen-height=$KIOSK_HEIGHT \
        --cast-initial-screen-width=$KIOSK_WIDTH \
        --window-position=$KIOSK_X,$KIOSK_Y \
        --window-size=$KIOSK_WIDTH,$KIOSK_HEIGHT"

     echo "-- Browser mode:"
     echo " $FRONTEND"
     startx $FRONTEND
     ;;

  default)
  FRONTEND="/usr/bin/google-chrome --disable-infobars --no-sandbox --no-first-run \
      --cast-initial-screen-height=$KIOSK_HEIGHT \
      --cast-initial-screen-width=$KIOSK_WIDTH \
      --window-position=$KIOSK_X,$KIOSK_Y \
      --window-size=$KIOSK_WIDTH,$KIOSK_HEIGHT"

   echo "-- Browser default mode:"
   echo " $FRONTEND"
   startx $FRONTEND
   ;;

  electron)
    FRONTEND="$root_app/node_modules/electron/dist/electron $root_app --enable-logging"
    echo "-- ElectronJS mode:"
    echo " $FRONTEND"
    startx $FRONTEND
    ;;

  test)
    echo "-- Test mode:"
    startx /usr/bin/chromium-browser --disable-infobars --no-sandbox --no-first-run \
    --window-position=$KIOSK_X,$KIOSK_Y \
    --window-size=$KIOSK_WIDTH,$KIOSK_HEIGHT \
    --kiosk $KIOSK_URL
    ;;

  bash)
    echo "-- Shell Mode:"
    startx xterm
   ;;
  *)
     echo "-- Kiosk Mode not set or incorrect."
  ;;
esac
