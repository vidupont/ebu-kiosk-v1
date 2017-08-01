# @Author: Vincent Dupont <vincent>
# @Date:   2017-06-09T19:18:51+02:00
# @Email:  vidupont@gmail.com
# @Filename: proximus_logo.sh
# @Last modified by:   vincent
# @Last modified time: 2017-08-01T16:15:20+02:00



# Load the Proximus Animation into the persistent folder /date
# Source: GitHub repository : https://github.com/vidupont/ebu-medias

# Check if Env variables are present

if [ "$KIOSK_MEDIAS" == "" ]; then echo "No Medias directory set ... exiting."; exit 1;
  else echo "Medias directory is set to $KIOSK_MEDIAS."
fi

if [ "$KIOSK_MEDIAS_GIT" == "" ]; then echo "No Medias Repository set ... exiting."; exit 1;
  else echo "Medias repository is set to $KIOSK_MEDIAS_GIT."
fi

if [ "$KIOSK_PROXIMUS_ANIM" == "" ]; then echo "No Animation ... exiting."; exit 1;
  else echo "Proximus Animation video is set to $KIOSK_PROXIMUS_ANIM."
fi

# Get the Media files from GitHub

if [ -f $KIOSK_PROXIMUS_ANIM ]; then
   echo "Proximus Medias already present ... updating."
   cd $KIOSK_MEDIAS
   git pull $KIOSK_MEDIAS_GIT
else
   echo "Proximus Medias not present ... getting them."
   cd $KIOSK_DATA
   git clone $KIOSK_MEDIAS_GIT
fi

if [ "$KIOSK_PROXIMUS_PLAY"="1" ]; then
  echo "Playing Proximus animation."
  omxplayer $KIOSK_PROXIMUS_ANIM --aspect-mode fill --no-osd --no-keys
fi
