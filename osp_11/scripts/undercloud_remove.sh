#!/usr/env bash
# from: https://access.redhat.com/solutions/2210421
# this script uninstalls an undercloud without reinstalling
# the underlying host

# services
declare -a services=(
neutron-dhcp-agent.service
neutron-openvswitch-agent.service
neutron-ovs-cleanup.service
neutron-server.service
openstack-ironic-inspector-dnsmasq.service
openstack-nova-compute.service
openstack-nova-conductor.service
openstack-nova-scheduler.service
openstack-swift-account-reaper.service
openstack-swift-account.service
openstack-swift-container-updater.service
openstack-swift-container.service
openstack-swift-object-updater.service
openstack-swift-object.service
openstack-swift-proxy.service
openstack-zaqar.service
openstack-zaqar@1.service
keepalived)

# files
declare -a files=(
/home/stack/.instack
/home/stack/stackrc
/home/stack/undercloud-passwords.conf
/root/stackrc
/root/tripleo-undercloud-passwords
/var/lib/ironic-inspector
/var/lib/mysql
/var/lib/rabbitmq
/var/opt/undercloud-stack
)

# directories
declare -a dirs=(
/etc/ceilometer
/etc/heat
/etc/glance 
/etc/horizon 
/etc/ironic
/etc/ironic-inspector
/etc/keystone
/etc/neutron 
/etc/nova 
/etc/swift 
/etc/haproxy
)

# packages
declare -a pkgs=(
rabbitmq-server 
mariadb
haproxy
openvswitch
keepalived 
$(rpm -qa | grep openstack)
$(rpm -qa | grep neutron)
$(rpm -qa | grep swift)
)

source ~/stackrc
env | grep OS_

# delete swift containers
for i in $(swift list); do swift delete $i; done

# stop openstack services
for i in ${services[*]}; do sudo systemctl stop $i; done
for i in ${services[*]}; do sudo systemctl status $i; done

# remove files and directories
for i in ${files[*]}; do sudo rm -rf $i; done
for i in ${dirs[*]}; do sudo rm -rf $i; done

# remove pkgs
for i in ${pkgs[*]}; do sudo yum remove -y $i; done

# restore networking
mv  /etc/os-net-config/config.json  /etc/os-net-config/config.json.orig
mv /etc/sysconfig/network-scripts/ifcfg-br-ctlplane /etc/sysconfig/network-scripts/orig.ifcfg-br-ctlplane

