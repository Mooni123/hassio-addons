# Taken from https://github.com/Homegear/Homegear-Docker/blob/master/rpi-stable/Dockerfile
ARG BUILD_FROM
ARG BUILD_ARCH

#FROM $BUILD_FROM
FROM debian:buster-slim
MAINTAINER peterhaaf (peterhaaf@github)


RUN apt-get update && apt-get -y install apt-transport-https wget ca-certificates apt-utils gnupg libzip4 libavahi-client3 libavahi-client-dev insserv locales lsb-release procps
RUN \
    touch /tmp/HOMEGEAR_STATIC_INSTALLATION; \
    touch /.dockerenv; \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen; \
    locale-gen; \
    wget https://apt.homegear.eu/Release.key && apt-key add Release.key && rm Release.key; \
    echo 'deb https://apt.homegear.eu/Debian/ buster/' >> /etc/apt/sources.list.d/homegear.list; \
    apt-get update && apt-get -y install libhomegear-node homegear homegear-management homegear-webssh homegear-adminui homegear-ui homegear-nodes-core homegear-nodes-extra homegear-homematicbidcos homegear-homematicwired homegear-insteon homegear-max homegear-philipshue homegear-sonos homegear-kodi homegear-ipcam homegear-beckhoff homegear-knx homegear-enocean homegear-intertechno homegear-rsl homegear-rs2w homegear-mbus homegear-zwave homegear-zigbee homegear-ccu homegear-easyled homegear-easyled2 homegear-easycam homegear-influxdb; \
    rm -f /etc/homegear/dh1024.pem; \
    rm -f /etc/homegear/homegear.crt; \
    rm -f /etc/homegear/homegear.key; \
    cp -a /etc/homegear /etc/homegear.config; \
    cp -a /var/lib/homegear /var/lib/homegear.data; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY script/run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/bin/bash", "-c", "/run.sh"]

EXPOSE 2001 2002 2003 2004
