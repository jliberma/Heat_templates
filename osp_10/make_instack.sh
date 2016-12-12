#! /usr/bin/env bash

jq . << EOF > ~/instackenv.json
{
  "nodes": [
    {
      "name": "overcloud-ctrl01",
      "capabilities": "profile:control",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 1p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    },
    {
      "name": "overcloud-ctrl02",
      "capabilities": "profile:control",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 2p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    },
    {
      "name": "overcloud-ctrl03",
      "capabilities": "profile:control",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 3p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    },
    {
      "name": "overcloud-compute01",
      "capabilities": "profile:compute",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 4p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    },
    {
      "name": "overcloud-compute02",
      "capabilities": "profile:compute",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 5p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    },
    {
      "name": "overcloud-ceph01",
      "capabilities": "profile:ceph-storage",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 6p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    },
    {
      "name": "overcloud-ceph02",
      "capabilities": "profile:ceph-storage",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 7p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    },
    {
      "name": "overcloud-ceph03",
      "capabilities": "profile:ceph-storage",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 8p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    },
    {
      "name": "overcloud-networker",
      "capabilities": "profile:networker",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 9p /tmp/nodes.txt)"
      ],
      "pm_user": "stack"
    }
  ]
}
EOF
