#!/bin/bash
vpn=$((dig +short $VPN_HOST && echo $VPN_HOST) | head -n 1)
gateway=$(tokens=($(route | grep -e '^default')); echo ${tokens[1]})
echo "vpn: $vpn; gateway: $gateway"
route del default
route add $vpn gw $gateway
route add -net 192.168.0.0/16 gw $gateway dev eth0

export VPN_HOST=$vpn; 
cat client.openvpn | envsubst > runtime.openvpn
openvpn --config runtime.openvpn &
transmission-daemon --foreground --config-dir /etc/transmission-daemon
