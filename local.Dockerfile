FROM torrent-vpn-base

RUN apt-get install -y transmission-daemon

COPY client.openvpn /

COPY /etc/transmission-daemon/* /etc/transmission-daemon/

EXPOSE 39091

VOLUME /var/lib/transmission-daemon

CMD local.sh

USER root

