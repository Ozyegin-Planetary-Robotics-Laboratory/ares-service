# Systemd Services Repository for Ares II Robotic System
This repository contains various service files that are essential for starting up various subsystems of Ares. Systemd is an application that boots up necessary services in a Linux system in a specific order, while observing and restarting them if need be.

We use this *daemon* to deploy our robotic system in a rapid way, alongside the operating system. Our programs thus have to be programmed in a robust, error-prone manner. If connection errors and other things are encountered, our control system will safely pause in order to reconnect.

For specific devices like the CANable Pro, we added udev rules to cope with the stringent timing relationship of the device enumeration process and the network configuration that comes afterwards.

For further introduction into systemd and udev rules, the following links may be useful.

https://documentation.suse.com/smart/systems-management/html/systemd-basics/index.html
https://hackaday.com/2009/09/18/how-to-write-udev-rules/

You can use udev for example, to ensure the execution of a specific script when a specific USB is plugged into your device, perhaps a joystick that needs to be immediately interfaced with the ROS network, or an Arduino that requires a handshake written in your own custom protocol. The possibilities are endless, though we only use very specific ones for this instance. 