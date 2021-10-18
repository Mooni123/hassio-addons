# Taken from https://github.com/Homegear/Homegear-Docker/blob/master/rpi-stable/Dockerfile
ARG BUILD_FROM
ARG BUILD_ARCH

#FROM $BUILD_FROM
FROM debian:buster-slim
MAINTAINER peterhaaf (peterhaaf@github)

RUN /bin/sh -c apt-get update && apt-get -y install apt-transport-https apt-utils wget ca-certificates gnupg libzip4 libavahi-client3 libavahi-client-dev insserv locales lsb-release 

COPY script/installNightly.sh /installNightly.sh

RUN /bin/sh -c touch /tmp/HOMEGEAR_STATIC_INSTALLATION;     touch /.dockerenv;     sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen;     locale-gen;     wget https://apt.homegear.eu/Release.key && apt-key add Release.key && rm Release.key;     echo 'deb https://apt.homegear.eu/Debian/ buster/' >> /etc/apt/sources.list.d/homegear.list;     chmod +x /installNightly.sh;     /installNightly.sh;     rm /installNightly.sh;     cp -a /etc/homegear /etc/homegear.config;     cp -a /var/lib/homegear /var/lib/homegear.data;     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8


COPY script/run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/bin/bash", "-c", "/run.sh"]

EXPOSE 2003 2002 2003 2004 443 80

