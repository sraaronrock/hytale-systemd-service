# Hytale-systemd-service

This repository provides a systemd service and two helper scripts (start_server.sh and stop_server.sh) that allow you to start, stop, and automatically manage a Hytale server on Linux Servers without Admin Panels.

**IMPORTANT**: The server runs **as a normal user**, NOT as root, using custom start and stop scripts. **This guide assumes that you already have a Hytale server**, if not, you can start one following: https://support.hytale.com/hc/en-us/articles/45326769420827-Hytale-Server-Manual

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
```
Step-by-Step Guide

The server will run as a **normal Linux user (NOT root)** and will:
- Start automatically on boot
- Stop cleanly
- Restart automatically if it crashes

---

## 🔴 REPLACE ALL THE `<your_user>` WITH YOUR SYSTEM USER. ALSO REPLACE YOUR DIRECTORIES IF YOU USE OTHER ONES.

1. Create the start script: ```bash nano /home/<your_user>/hytale-server/start_server.sh```

2. Paste the content from start_server.sh (🔴 DOUBLE CHECK BEFORE SAVING, Replace ALL <your_user> values and Verify paths are correct) --> https://github.com/sraaronrock/hytale-systemd-service/blob/master/start_server.sh

3. Create the stop script: ```bash nano /home/<your_user>/hytale-server/stop_server.sh```

4. Paste the content from stop_server.sh (🔴 DOUBLE CHECK BEFORE SAVING, Replace ALL <your_user> values and Verify paths are correct) --> https://github.com/sraaronrock/hytale-systemd-service/blob/master/stop_server.sh

5. Make the scripts executable:
```bash sudo chmod +x /home/<your_user>/hytale-server/start_server.sh```
```bash sudo chmod +x /home/<your_user>/hytale-server/stop_server.sh```

6. Create the systemd service: ```bash sudo nano /etc/systemd/system/hytale.service```

7. Paste the content from hytale.service (🔴 DOUBLE CHECK BEFORE SAVING, Replace ALL <your_user> values and Verify paths are correct) --> https://github.com/sraaronrock/hytale-systemd-service/blob/master/hytale.service

8. Reload systemd: ```bash sudo systemctl daemon-reload ```

9. Enable the service (auto-start on boot): ```bash sudo systemctl enable hytale.service ```

10. Start the server: ```bash sudo systemctl start hytale.service ```

11. Verify the server is running ```bash sudo systemctl status hytale.service ```

You can check live logs using: ```bash  journalctl -u hytale.service -f ```

To stop the server or restart, you can use the following commands:

-Stop: ```bash sudo systemctl stop hytale.service ```

-Restart: ```bash sudo systemctl restart hytale.service ```

## Need help?

If you have followed **all the steps** in this guide and the server still does not work:

👉 **Open a GitHub Issue** --> https://github.com/sraaronrock/hytale-systemd-service/issues

Please include **as much detail as possible**, such as:

- Your Linux distribution and version
- The exact error message
- Output of:
  ```bash
  systemctl status hytale.service





