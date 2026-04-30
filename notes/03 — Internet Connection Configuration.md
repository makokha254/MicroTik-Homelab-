# 03 — Internet Connection Configuration (DHCP Client)

**Date:** 30th April 2026
**Duration:** 10 minutes
**Difficulty:** Beginner

---

## Goal

Configure the MikroTik router to obtain an IP address automatically from the ISP modem by setting up a DHCP client on the WAN interface (ether1), so that the router can later provide internet access to LAN devices.

---

## What I Did

First checked the current interface status to confirm which port to use:

```routeros
/interface print
```

Then added a DHCP client on the WAN interface:

```routeros
/ip dhcp-client add interface=ether1 disabled=no
```

Verified the DHCP client was created:

```routeros
/ip dhcp-client print
```

---

## What Broke

Nothing broke during this session. However, the DHCP client showed as `I` (Invalid) with no IP address assigned — this was expected because no ISP modem was physically connected to ether1 at the time of configuration.

---

## How I Fixed It

No fix required. The `I` (Invalid) flag simply means the interface has no active link — the DHCP client is correctly configured and will automatically request an IP address as soon as the ISP modem is plugged into ether1.

---

## What I Learned

- **ether1 is the WAN port — the interface that connects to the ISP modem.** All other interfaces (ether2, ether3) face the internal network. The DHCP client must be placed on ether1 specifically because that is where the internet connection enters the router.

- **`disabled=no` must be explicitly stated when creating services in MikroTik.** Most services are inactive by default and won't run until enabled, either at creation using `disabled=no` or afterward using a separate `/enable` command. Omitting it risks creating a service that silently does nothing.

- **Reading `/interface print` before configuring is essential.** The output shows which interfaces are running (`R`), which are slaves (`S`), and which are disabled (`X`). Assigning the DHCP client to the wrong interface — for example ether3 which had a laptop connected — would have caused the configuration to fail silently.

- **`USE-PEER-DNS yes` and `ADD-DEFAULT-ROUTE yes` are automatic advantages.** Once connected to the ISP, the router will accept DNS servers and a default gateway route automatically — no manual configuration needed on the WAN side.

---

## Verification

Commands used to confirm the configuration was created correctly:

```routeros
/ip dhcp-client print
```

**Output:**

```
[admin@MikroTik] > /ip dhcp-client print
Flags: X - disabled, I - invalid, D - dynamic
 #   INTERFACE   USE-PEER-DNS   ADD-DEFAULT-ROUTE   STATUS    ADDRESS
 0 I ether1      yes            yes
```

DHCP client confirmed on ether1. Status is blank and flag shows `I` (Invalid) — expected behaviour with no ISP modem connected. Client will move to `bound` status and display an assigned IP address once a live modem is plugged into ether1.

---

## Next Session

Now that the WAN interface is configured to receive an IP from the ISP, the next step is setting up NAT/Masquerade so that devices on the LAN (192.168.88.0/24) can reach the internet through the router's WAN interface.

---

## References

- [MikroTik First Time Configuration — DHCP Client](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/First+Time+Configuration#FirstTimeConfiguration-OptionA:DHCP(MostCommon))
- [MikroTik DHCP Client Documentation](https://wiki.mikrotik.com/wiki/Manual:IP/DHCP_Client)
