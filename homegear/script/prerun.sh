#/bin/bash

USER=homegear

USER_ID=$(id -u $USER)
USER_GID=$(id -g $USER)

USER_ID=${HOST_USER_ID:=$USER_ID}
USER_GID=${HOST_USER_GID:=$USER_GID}

#sed -i -e "s/^${USER}:\([^:]*\):[0-9]*:[0-9]*/${USER}:\1:${USER_ID}:${USER_GID}/"  /etc/passwd
#sed -i -e "s/^${USER}:\([^:]*\):[0-9]*/${USER}:\1:${USER_GID}/" /etc/group
#touch /tmp/run-sh

mkdir -p /config/homegear /share/homegear/lib /share/homegear/log
chown $USER:$USER /config/homegear /share/homegear/lib /share/homegear/log
rm -rf /etc/homegear /var/lib/homegear /var/log/homegear
ln -nfs /config/homegear     /etc/homegear
ln -nfs /share/homegear/lib /var/lib/homegear
ln -nfs /share/homegear/log /var/log/homegear

tail -f /dev/zero
