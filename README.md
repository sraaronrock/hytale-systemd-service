# Hytale-systemd-service
This repository provides a systemd service and two helper scripts (start_server.sh and stop_server.sh) that allow you to start, stop, and automatically manage a Hytale server on Linux Servers without Admin Panels.

**IMPORTANT**: The server runs **as a normal user**, not as root, using custom start and stop scripts. 

**The user running the service must own or have full permissions on the hytale-server directory.**

---

## Recommended directory structure

The following directory layout is assumed:

```bash
/home/<your_user>/hytale-server/
├── start_server.sh
├── stop_server.sh
├── server.pid
├── Assets.zip
└── Server/
    └── HytaleServer.jar
