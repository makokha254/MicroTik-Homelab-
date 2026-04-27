# 01 — IP Setup Configuration

**Date:** 27th April 2026
**Duration:** 30 minutes
**Difficulty:** Beginner

---

## Goal

Configure IP access on the MikroTik router so that devices connecting to the ether2 interface receive IP addresses in the 192.168.88.1/24 range.

---

## What I Did

```routeros
# Create a bridge interface
/interface bridge add name=bridge1

# Assign bridge ports
/interface bridge port add interface=ether2 bridge=bridge1

# Assign an IP address to the bridge interface
/ip address add address=192.168.88.1/24 interface=bridge1
```

---

## What Broke

- Error message: `"device already added as a bridge port"` when trying to assign ether2 to bridge1
- Discovered the same IP address was assigned to two different bridge interfaces simultaneously

---

## How I Fixed It

Found that ether2 was already active in the bridge port list. Ran `/interface bridge port print` to confirm, then removed the duplicate entry and re-added it to the correct bridge:

```routeros
# Check what's already assigned
/interface bridge port print

# Remove the duplicate port entry
/interface bridge port remove [find interface=ether2]

# Re-add to the correct bridge
/interface bridge port add bridge=bridge1 interface=ether2
```

Also found the same IP address assigned to two bridge interfaces. Moved all ports to bridge1 first:

```routeros
/interface bridge port set [find bridge=bridge] bridge=bridge1
```

---

## What I Learned

- **Always print before you add.** Running `/interface bridge port print` first would have shown the port was already assigned, avoiding the "device already added" error entirely. Check the current state before making changes — this applies to every config section, not just bridge ports.

- **Duplicate IP addresses cause silent conflicts.** Having the same IP assigned to two bridge interfaces doesn't always throw an obvious error — you have to know to look for it. The `/ip address print` command is your first diagnostic tool whenever something isn't behaving as expected.

- **A bridge interface is more flexible than assigning IP directly to a physical port.** Assigning the IP to `bridge1` instead of `ether2` directly means you can add more physical ports to that bridge later without reconfiguring the IP — this is how real networks are built.

---

## Verification

Commands used to confirm the configuration was working:

```routeros
/ip address print
/interface bridge port print
```

**Output:**

```
[admin@MikroTik] > ip address print
Flags: X - disabled, I - invalid, D - dynamic
 #   ADDRESS            NETWORK         INTERFACE
 0   192.168.88.1/24    192.168.88.0    bridge1

[admin@MikroTik] > interface bridge port print
Flags: X - disabled, I - inactive, D - dynamic, H - hw-offload
 #     INTERFACE BRIDGE    HW  PVID PR  PATH-COST INTERNA...    HORIZON
 0   H ether2    bridge1   yes    1 0x         10         10       none
```

IP address `192.168.88.1/24` successfully assigned to `bridge1`. Port `ether2` confirmed active under `bridge1` with hardware offload enabled.

---

## Next Session

Now that the router has a static IP address on `bridge1` and LAN devices can physically connect, the next step is configuring a DHCP server so that those devices are automatically assigned IP addresses instead of requiring manual configuration on each device.

---

## References

- [MikroTik Bridge Documentation](https://help.mikrotik.com/docs/display/ROS/Bridge)
- [MikroTik First Time Configuration](https://help.mikrotik.com/docs/spaces/ROS/pages/328151/First+Time+Configuration)
