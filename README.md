# MikroTik Homelab — Network Engineering Portfolio

**Haron Mark Makokha** | BBIT Student | Aspiring Network Engineer  
📍 Mombasa, Kenya | 🎯 CCNA In Progress

---

## What This Is

This repository documents my hands-on MikroTik router configuration journey — every config, every mistake, and every fix. It is not a collection of polished labs. It is a real record of building network engineering skills from the ground up using physical hardware and CLI.

Every folder contains:
- A `.rsc` file — the actual exported MikroTik config
- A `.md` notes file — what I was trying to do, what broke, and how I fixed it

---

## Lab Setup

| Component | Details |
|-----------|---------|
| Router | MikroTik (model) |
| Access Method | WinBox Terminal / CLI |
| OS | RouterOS (version) |
| Network Range | 192.168.x.x |
| Goal | Build CCNA-level real-world skills on physical hardware |

---

## Configuration Log

| # | Topic | Config File | Notes | Date |
|---|-------|-------------|-------|------|
| 01 | IP Address Setup | [configs/01-ip-setup.rsc](configs/01-ip-setup.rsc) | [notes/01-ip-setup.md](notes/01-ip-setup.md) | 2025-04 |
| 02 | DHCP Server | [configs/02-dhcp-server.rsc](configs/02-dhcp-server.rsc) | [notes/02-dhcp-server.md](notes/02-dhcp-server.md) | 2025-04 |
| 03 | NAT / Masquerade | *(coming soon)* | *(coming soon)* | — |
| 04 | Firewall Rules | *(coming soon)* | *(coming soon)* | — |
| 05 | Static Routes | *(coming soon)* | *(coming soon)* | — |

---

## How I Document Each Session

Before every session I write one line: *what am I trying to configure today?*

After every session I write three things:
1. What I configured
2. What broke or confused me
3. How I resolved it

This keeps the documentation honest and useful — not just a showcase of things that worked.

---

## Skills Being Built

- MikroTik RouterOS CLI
- IP addressing and subnetting
- DHCP server configuration
- NAT and internet gateway setup
- Firewall rules (input/forward chains)
- Static and dynamic routing
- Network documentation

---

## How to Use These Configs

All `.rsc` files are exported directly from RouterOS using the `/export` command.  
To import on a MikroTik router:

```
/import file-name=filename.rsc
```

> ⚠️ Always review a config before importing. IP ranges may need adjusting for your environment.

---

## Contact

- **LinkedIn:** [linkedin.com/in/your-profile](#)
- **Email:** your@email.com
- **CCNA Target:** Q3 2025

---

*Updated regularly as I progress through configurations. Last updated: April 2025.*
