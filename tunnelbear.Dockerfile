FROM torrent-vpn-base

RUN apt-get install -y transmission-daemon

COPY tunnelbear/* /

COPY /etc/transmission-daemon/* /etc/transmission-daemon/

EXPOSE 39091

VOLUME /var/lib/transmission-daemon

CMD tunnelbear.sh

USER root

