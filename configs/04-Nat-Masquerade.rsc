# jan/02/1970 00:09:30 by RouterOS 6.48.3
# software id = 163G-IHM8
#
# model = RB941-2nD
# serial number = D0550C180FEF
/interface bridge
add name=bridge1
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.88.2-192.168.88.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge1 lease-time=30m \
    name=dhcp1
/interface bridge port
add bridge=bridge1 interface=ether2
/ip address
add address=192.168.88.1/24 interface=bridge1 network=192.168.88.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.88.0/24 dns-server=8.8.8.8 gateway=192.168.88.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
