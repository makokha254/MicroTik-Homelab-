# jan/02/1970 00:15:05 by RouterOS 6.48.3
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
/interface bridge port
add bridge=bridge1 interface=ether2
/ip address
add address=192.168.88.1/24 interface=bridge1 network=192.168.88.0
