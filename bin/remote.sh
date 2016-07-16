#!/bin/sh

# Fail loudly
set -ex

# Override DNSMASQ_OPTS to replace these
DEFAULT_OPTS="--interface=eth0"

NONDEBUG_OPTS="--keep-in-foreground --user=root"
# Override DNSMASQ_DEBUG with "--no-daemon" to help debug
#DEBUG_OPTS="--no-daemon"

echo Firing up iptables for NAT routing...
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo Starting openvpn server...
openvpn --config server.openvpn &

echo Starting dnsmasq server...
dnsmasq ${DNSMASQ_DEBUG-$NONDEBUG_OPTS} ${DNSMASQ_OPTS-$DEFAULT_OPTS}
