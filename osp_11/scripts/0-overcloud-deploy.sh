#!/bin/bash

exec openstack overcloud deploy \
        --templates /usr/share/openstack-tripleo-heat-templates \
        --libvirt-type qemu \
        --timeout 90 \
        --ntp-server 10.16.255.1 \
        --control-flavor control --control-scale 3 \
        --compute-flavor compute --compute-scale 2 \
        --ceph-storage-flavor ceph-storage --ceph-storage-scale 3 \
        -e /home/stack/templates/timezone.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/tls-endpoints-public-ip.yaml \
        -e /home/stack/templates/public_vip.yaml \
        -e /home/stack/templates/enable-tls.yaml \
        -e /home/stack/templates/inject-trust-anchor.yaml \
        -e /home/stack/templates/ceph-key.yaml \
        -e /home/stack/templates/network-environment.yaml \
        -e /home/stack/templates/ceilometer.yaml \
        -e /home/stack/templates/environments/storage-environment.yaml
