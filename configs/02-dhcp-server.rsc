# jan/02/1970 00:29:39 by RouterOS 6.48.3
# software id = 163G-IHM8
#
# model = RB941-2nD
# serial number = D0550C180FEF
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge1 lease-time=30m \
    name=dhcp1
/ip dhcp-server network
add address=192.168.88.0/24 dns-server=8.8.8.8 gateway=192.168.88.1
