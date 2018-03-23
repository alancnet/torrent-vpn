ssh root@$VPN_HOST docker stop torrentvpn_remote_1
sudo docker stop torrentvpn_local_1
ssh root@$VPN_HOST docker start torrentvpn_remote_1
sudo docker start torrentvpn_local_1
