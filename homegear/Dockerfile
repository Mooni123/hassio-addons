# Taken from https://github.com/Homegear/Homegear-Docker/blob/master/rpi-stable/Dockerfile
ARG BUILD_FROM
ARG BUILD_ARCH

#FROM $BUILD_FROM
FROM homegear/homegear:nightly

COPY script/prerun.sh /
RUN chmod +x /prerun.sh

ENTRYPOINT ["/bin/bash", "-c", "/prerun.sh; /start.sh"]

EXPOSE 2003 2002 2003 2004 

