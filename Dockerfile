FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    mininet \
    bridge-utils \
    openvswitch-switch \
    openvswitch-testcontroller \
    traceroute \
    iperf3 \
    net-tools \
    iproute2 \
    iputils-ping \
    tcpdump \
    curl \
    python3 \
    python3-yaml \
    procps \
    nano \
    less \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=755 <<'EOF' /usr/local/bin/start
#!/bin/sh
mkdir -p /var/run/openvswitch /etc/openvswitch
[ -f /etc/openvswitch/conf.db ] || ovsdb-tool create /etc/openvswitch/conf.db /usr/share/openvswitch/vswitch.ovsschema
ovsdb-server --remote=punix:/var/run/openvswitch/db.sock --pidfile --detach -vconsole:off --log-file /etc/openvswitch/conf.db
ovs-vsctl --no-wait init
ovs-vswitchd --pidfile --detach -vconsole:off --log-file
exec "$@"
EOF

ENTRYPOINT ["/usr/local/bin/start"]
CMD ["bash"]
