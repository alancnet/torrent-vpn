# Pull lean base image.
FROM debian:jessie

RUN apt-get update && apt-get install -y dnsmasq iptables openvpn net-tools iputils-ping dnsutils

# Install helpers
ADD bin/remote.sh /usr/bin/

COPY static.key /
COPY server.openvpn /

# Default dnsmasq argument is --help which is passed after pipwork wait
CMD remote.sh
