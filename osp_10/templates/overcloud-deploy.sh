#!/bin/bash

exec openstack overcloud deploy \
        --templates /usr/share/openstack-tripleo-heat-templates \
        --ntp-server 10.16.255.1 \
        --control-flavor control --control-scale 3 \
        --compute-flavor compute --compute-scale 1 \
        --ceph-storage-flavor ceph-storage --ceph-storage-scale 3 \
        --neutron-tunnel-types vxlan --neutron-network-type vxlan \
        -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
        -e /home/stack/templates/network-environment.yaml \
        -e /home/stack/templates/HostnameMap.yaml \
        -e /home/stack/templates/ips-from-pool-all.yaml \
        -e /home/stack/templates/storage-environment.yaml \
        -e /home/stack/templates/enable-tls.yaml \
        -e /home/stack/templates/inject-trust-anchor.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/tls-endpoints-public-ip.yaml \
        -e /home/stack/templates/public_vip.yaml
