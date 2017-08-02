# @Author: Vincent Dupont <vincent>
# @Date:   2017-06-09T19:18:51+02:00
# @Email:  vidupont@gmail.com
# @Filename: proximus_logo.sh
# @Last modified by:   vincent
# @Last modified time: 2017-08-02T16:38:38+02:00



# Load the Proximus Animation into the persistent folder /date
# Source: GitHub repository : https://github.com/vidupont/ebu-medias

# Check if Env variables are present
# Then Get the files from GitHub when needed

if [ "$KIOSK_DATA" == "" ]; then echo "No data directory set ... exiting."; exit 1;
  else echo "Data directory is set to $KIOSK_DATA."
fi


if [ "$KIOSK_MEDIAS" == "" ]; then echo "No Medias directory set ... exiting."; exit 1;
  else echo "Medias directory is set to $KIOSK_MEDIAS."
    if [ "$KIOSK_MEDIAS_GIT" == "" ]; then echo "No Medias Repository set ... exiting."; exit 1;
    else echo "Medias repository is set to $KIOSK_MEDIAS_GIT."
      if [ -f cd $KIOSK_MEDIAS ]; then
        echo "Proximus Medias already present ... updating."
        git pull $KIOSK_MEDIAS_GIT
      else
        echo "Proximus Medias not present ... getting them."
        git clone $KIOSK_MEDIAS_GIT
      fi
    fi
fi
