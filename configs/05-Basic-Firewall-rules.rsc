# jan/02/1970 01:16:36 by RouterOS 6.48.3
# software id = 163G-IHM8
#
# model = RB941-2nD
# serial number = D0550C180FEF
/ip firewall address-list
add address=192.168.88.2-192.168.88.254 list=allowed-to-router
/ip firewall filter
add action=accept chain=input comment="default configuration" \
    connection-state=established,related
add action=accept chain=input src-address-list=allowed-to-router
add action=accept chain=input protocol=icmp
add action=drop chain=input
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
