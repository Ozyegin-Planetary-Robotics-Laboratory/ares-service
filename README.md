# Systemd Services Repository for Ares II Robotic System
This repository contains various service files that are essential for starting up various subsystems of Ares. Systemd is an application that boots up necessary services in a Linux system in a specific order, while observing and restarting them if need be.

We use this *daemon* to deploy our robotic system in a rapid way, alongside the operating system. Our programs thus have to be programmed in a robust, error-prone manner. If connection errors and other things are encountered, our control system will safely pause in order to reconnect.

For further introduction into Systemd daemon, the following link may be useful.

https://documentation.suse.com/smart/systems-management/html/systemd-basics/index.html