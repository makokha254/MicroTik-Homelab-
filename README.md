# MikroTik Homelab — Network Engineering Portfolio

**Haron Mark Makokha**  
BSc. Business Information Technology | Technical University of Mombasa (2025)  
📍 Mombasa, Kenya | 🎯 CCNA In Progress

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Haron%20Makokha-0077B5?style=flat&logo=linkedin)](https://www.linkedin.com/in/haron-makokha)
[![Email](https://img.shields.io/badge/Email-haronmarkmakokha%40gmail.com-D14836?style=flat&logo=gmail)](mailto:haronmarkmakokha@gmail.com)

---

## About This Repository

This repository documents my hands-on MikroTik RouterOS configuration journey on physical hardware using CLI. It is a live portfolio of real network engineering work — not simulated labs.

Each entry contains:
- A `.rsc` file — the actual exported MikroTik configuration
- A `.md` notes file — the goal, commands run, what broke, how it was fixed, and key takeaways

The documentation follows the same approach a support engineer uses on-site: define the objective, execute, troubleshoot, verify, and record.

---

## Lab Environment

| Component | Details |
|-----------|---------|
| Router | MikroTik RouterBOARD |
| Access Method | WinBox Terminal (CLI) |
| OS | RouterOS |
| LAN Subnet | 192.168.88.0/24 |
| WAN Connection | DHCP Client (ISP) |
| Objective | Build and document CCNA-level skills on physical hardware |

---

## Configuration Log

| # | Topic | Config File | Notes | Date | Status |
|---|-------|-------------|-------|------|--------|
| 01 | IP Address Setup & Bridge Configuration | [configs/01-ip-setup.rsc](configs/01-ip-setup.rsc) | [notes/01-ip-setup.md](notes/01-ip-setup.md) | 27 Apr 2026 | ✅ |
| 02 | DHCP Server Configuration | [configs/02-dhcp-server.rsc](configs/02-dhcp-server.rsc) | [notes/02-dhcp-server.md](notes/02-dhcp-server.md) | 27 Apr 2026 | ✅ |
| 03 | Internet Connection (DHCP Client) | [configs/03-internet-connection.rsc](configs/03-internet-connection.rsc) | [notes/03-internet-connection.md](notes/03-internet-connection.md) | 30 Apr 2026 | ✅ |
| 04 | NAT / Masquerade | [configs/04-nat-masquerade.rsc](configs/04-nat-masquerade.rsc) | [notes/04-nat-masquerade.md](notes/04-nat-masquerade.md) | 30 Apr 2026 | ✅ |
| 05 | Basic Firewall Rules (Input Chain) | [configs/05-firewall-basics.rsc](configs/05-firewall-basics.rsc) | [notes/05-firewall-basics.md](notes/05-firewall-basics.md) | 30 Apr 2026 | ✅ |
| 06 | End-to-End Connectivity Verification | *(coming soon)* | *(coming soon)* | — | 🔲 |
| 07 | VLAN Configuration | *(coming soon)* | *(coming soon)* | — | 🔲 |
| 08 | Home Network Audit & Device Mapping | *(coming soon)* | *(coming soon)* | — | 🔲 |
| 09 | Network Diagram (draw.io) | *(coming soon)* | *(coming soon)* | — | 🔲 |
| 10 | Wireless Configuration | *(coming soon)* | *(coming soon)* | — | 🔲 |

---

## Repository Structure

```
mikrotik-homelab/
│
├── README.md
├── configs/
│   ├── 01-ip-setup.rsc
│   ├── 02-dhcp-server.rsc
│   ├── 03-internet-connection.rsc
│   ├── 04-nat-masquerade.rsc
│   └── 05-firewall-basics.rsc
└── notes/
    ├── 01-ip-setup.md
    ├── 02-dhcp-server.md
    ├── 03-internet-connection.md
    ├── 04-nat-masquerade.md
    └── 05-firewall-basics.md
```

---

## Documentation Approach

Every session follows a consistent structure:

| Section | Purpose |
|---------|---------|
| **Goal** | What was being configured and why |
| **What I Did** | Step-by-step CLI commands with inline comments |
| **What Broke** | Honest account of errors and unexpected behaviour |
| **How I Fixed It** | Troubleshooting steps and root cause |
| **What I Learned** | Key takeaways — concepts, not just commands |
| **Verification** | Command output confirming successful configuration |
| **Next Session** | How this session connects to the next objective |

---

## Skills Demonstrated

- MikroTik RouterOS CLI configuration
- Network interface and bridge management
- IP addressing and subnetting (IPv4)
- DHCP server and client configuration
- NAT / Masquerade for LAN internet access
- Firewall filter rules (input chain)
- Network documentation and troubleshooting methodology
- Configuration export and version control via GitHub

---

## How to Use These Configs

All `.rsc` files are exported directly from RouterOS using section-specific export commands:

```routeros
/ip address export file=filename
/ip firewall nat export file=filename
```

To import on a MikroTik router:

```routeros
/import file-name=filename.rsc
```

> ⚠️ Always review a config before importing. IP ranges and interface names may need adjusting for your environment.

---

## About Me

I am a Business Information Technology graduate from the Technical University of Mombasa, specialising in networking. This repository represents my commitment to building real, verifiable skills on physical hardware beyond the classroom — documented transparently, including mistakes and how they were resolved.

Currently pursuing CCNA certification and actively seeking an IT internship or entry-level network support role in Mombasa.

📧 [haronmarkmakokha@gmail.com](mailto:haronmarkmakokha@gmail.com)  
💼 [linkedin.com/in/haron-makokha](https://www.linkedin.com/in/haron-makokha)

---

*This repository is updated after every configuration session. Last updated: 30th April 2026.*
