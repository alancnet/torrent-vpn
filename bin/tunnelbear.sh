#!/bin/bash
remote=$(cat "$VPN_CONFIG" | grep "^remote " | grep -o "\S*\.\S*")
echo 8.8.8.8>hosts
echo 8.8.4.4>>hosts
hosts=0
echo "remote: $remote"
dig +short $remote>>hosts
echo "Hosts to allow:"
cat hosts

gateway=$(tokens=($(route | grep -e '^default')); echo ${tokens[1]})
route del default
cat hosts | while read ip
do
  echo "Allowing ip: $ip; gateway: $gateway"
  route add $ip gw $gateway
done
route add -net 192.168.0.0/16 gw $gateway dev eth0

echo "Added routes for $hosts hosts"

falseGateway=$(echo $gateway | sed -e "s/[0-9]*$/187/")
route add default gw $falseGateway

export VPN_HOST=$vpn;
openvpn \
  --config "$VPN_CONFIG" \
  --auth-user-pass /tunnelbear.up &
transmission-daemon --foreground --config-dir /etc/transmission-daemon

