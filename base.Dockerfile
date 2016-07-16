FROM alancnet/base

RUN apt-get update && \
    apt-get install -y openvpn bridge-utils net-tools iputils-ping dnsutils iptables

COPY static.key /
COPY bin/* /bin/