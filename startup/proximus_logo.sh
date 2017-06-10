# Load the Proximus Animation into the persistent folder /date
# Source: GitHub repository : https://github.com/vidupont/ebu-medias

# Get the Media files from GitHub
cd /data

if [ -f /data/Proximus_intro.mp4 ]; then
   git pull https://github.com/vidupont/ebu-medias
else
   git clone https://github.com/vidupont/ebu-medias
fi

omxplayer /data/Proximus_intro.mp4 --aspect-mode fill
