# Load the Proximus Animation into the persistent folder /date
# Source: GitHub repository : https://github.com/vidupont/ebu-medias

# Get the Media files from GitHub
git clone https://github.com/vidupont/ebu-medias /data

if [ -f /data/Proximus_intro.mp4 ]; then
   omxplayer /data/Proximus_intro.mp4 --aspect-mode fill
else
   echo "Proximus Logo animation not loaded."
fi
