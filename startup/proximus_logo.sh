# @Author: Vincent Dupont <vincent>
# @Date:   2017-06-09T19:18:51+02:00
# @Email:  vidupont@gmail.com
# @Filename: proximus_logo.sh
# @Last modified by:   vincent
# @Last modified time: 2017-08-10T11:07:48+02:00



# Load the Proximus Animation into the persistent folder /date
# Source: GitHub repository : https://github.com/vidupont/ebu-medias

echo "Proximus Animation intro."

# Check if Env variables are present
if [ "$KIOSK_PROXIMUS_ANIM" = "" ]; then echo "No Animation ... exiting."; exit 1;
  else echo "Proximus Animation video is set to $KIOSK_PROXIMUS_ANIM."
fi

# Get the Media files from GitHub

if [ -f $KIOSK_PROXIMUS_ANIM ]; then
 if [ "$KIOSK_PROXIMUS_PLAY" = "1" ]; then
  echo "Playing Proximus animation."
  omxplayer $KIOSK_PROXIMUS_ANIM --aspect-mode fill --no-osd --no-keys
 fi
fi
