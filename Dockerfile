FROM stackbrew/ubuntu:saucy
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

MAINTAINER Vincent Voyer <vincent@zeroload.net>
RUN apt-get -y update
RUN apt-get install -y -q software-properties-common wget
RUN add-apt-repository -y ppa:mozillateam/firefox-next
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -y update
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update -y
# fix https://code.google.com/p/chromium/issues/detail?id=318548
RUN mkdir -p /usr/share/desktop-directories
RUN apt-get install -y -q firefox google-chrome-beta openjdk-7-jre-headless nodejs
RUN apt-get install -y -q x11vnc xvfb
RUN npm install -g selenium-standalone@2.43.1-2.9.0
RUN apt-get install -y -q xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic
RUN useradd -d /home/chromeuser -m chromeuser
RUN mkdir -p /home/chromeuser/chrome
RUN chown chromeuser /home/chromeuser/chrome
RUN chgrp chromeuser /home/chromeuser/chrome
ADD ./scripts/ /home/root/scripts
EXPOSE 4444 5999
ENTRYPOINT ["sh", "/home/root/scripts/start.sh"]
