# 02 — DHCP Server Configuration

**Date:** 30th April 2026
**Duration:** (10 minutes)
**Difficulty:** Beginner

---

## Goal

Configure a DHCP server on the MikroTik router so that devices connecting to bridge1 are automatically assigned IP addresses in the 192.168.88.2–192.168.88.254 range, without requiring manual IP configuration on each device.

---

## What I Did

Used the MikroTik interactive DHCP setup wizard via CLI:

```routeros
/ip dhcp-server setup
```

Followed the prompts:

```
Select interface to run DHCP server on
dhcp server interface: bridge1

Select network for DHCP addresses
dhcp address space: 192.168.88.0/24

Select gateway for given network
gateway for dhcp network: 192.168.88.1

Select pool of ip addresses given out by DHCP server
addresses to give out: 192.168.88.2-192.168.88.254

Select DNS servers
dns servers: 8.8.8.8

Select lease time
lease time: 30m
```

---

## What Broke

Attempted to access the DHCP setup using incorrect syntax with a slash separator:

```routeros
/ip dhcp-server/ setup
/ip dhcp-server /
```

Both returned the error:

```
expected command name (line 1 column 15)
expected command name (line 1 column 16)
```

---

## How I Fixed It

Realised that in MikroTik CLI, the path separator is a space, not a forward slash. The slash is only used at the very beginning to denote the root path. The correct command has no slash between `dhcp-server` and `setup`:

```routeros
/ip dhcp-server setup
```

**Rule learned:** In MikroTik CLI, navigate menus with spaces, not slashes. The opening `/` just means "start from root." Everything after that is space-separated.

---

## What I Learned

- **MikroTik CLI uses spaces as path separators, not slashes.** `/ip dhcp-server setup` is correct. `/ip dhcp-server/ setup` is not. This is different from Linux file paths and is a common mistake for beginners.

- **The `setup` wizard is the fastest way to configure DHCP.** It creates the pool, network, and server in one interactive flow instead of requiring three separate commands. Useful for first-time setup — but knowing the manual commands behind it matters for troubleshooting.

- **The gateway and DNS server are configured at the network level, not the server level.** The DHCP server (`dhcp1`) handles address assignment. The DHCP network entry (`192.168.88.0/24`) carries the gateway and DNS information sent to clients. These are two separate things.

---

## Verification

Commands used to confirm the configuration was working:

```routeros
/ip dhcp-server print
/ip dhcp-server network print
```

**Output:**

```
[admin@MikroTik] > ip dhcp-server print
Flags: D - dynamic, X - disabled, I - invalid
 #    NAME   INTERFACE   RELAY   ADDRESS-POOL   LEASE-TIME   ADD-ARP
 0    dhcp1  bridge1             dhcp_pool0     30m

[admin@MikroTik] > ip dhcp-server network print
Flags: D - dynamic
 #   ADDRESS           GATEWAY        DNS-SERVER
 0   192.168.88.0/24   192.168.88.1   8.8.8.8
```

DHCP server `dhcp1` confirmed active on `bridge1` with pool `dhcp_pool0`. Network entry confirms gateway `192.168.88.1` and DNS `8.8.8.8` will be pushed to clients. Lease time set to 30 minutes.

---

## Next Session

Now that the router has a static IP on `bridge1` and a DHCP server assigning addresses to LAN devices, the next step is configuring NAT/Masquerade on the WAN interface so that those LAN devices can reach the internet through the router.

---

## References

- [MikroTik DHCP Server Documentation](https://wiki.mikrotik.com/wiki/Manual:IP/DHCP_Server)
- [MikroTik First Time Configuration](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/First+Time+Configuration)
