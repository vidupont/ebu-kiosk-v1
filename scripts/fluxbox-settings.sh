# @Author: Vincent Dupont <vincent>
# @Date:   2017-09-16T10:50:45+02:00
# @Email:  vidupont@gmail.com
# @Filename: fluxbox-settings.sh
# @Last modified by:   vincent
# @Last modified time: 2017-09-16T10:51:05+02:00


# Set Xorg and FLUXBOX preferences
RUN mkdir ~/.fluxbox
RUN echo "xset s off" > ~/.fluxbox/startup && echo "xserver-command=X -s 0 dpms" >> ~/.fluxbox/startup
RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
  && echo "" >> /etc/X11/xinit/xserverrc \
  && echo 'exec /usr/bin/X -s 0 dpms -nocursor -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc
