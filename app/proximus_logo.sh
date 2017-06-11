# Load the Proximus Animation into the persistent folder /date
# Source: GitHub repository : https://github.com/vidupont/ebu-medias

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

omxplayer $KIOSK_PROXIMUS_ANIM --aspect-mode fill
