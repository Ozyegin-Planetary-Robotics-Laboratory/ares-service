# Hardcoded install/uninstall routines as we have to accommodate for the specifics of each subsystem.

roscore:
	@echo "Installing roscore environment file..."
	@sudo mkdir -p /etc/ros
	@sudo cp ./env.sh /etc/ros/env.sh
	@echo "Installing roscore service..."
	@sudo cp ./services/roscore.service /etc/systemd/system/
	@sudo systemctl daemon-reload
	@sudo systemctl enable roscore
	@echo "roscore service installed."	

uroscore:
	@echo "Uninstalling roscore service..."
	@sudo systemctl stop roscore
	@sudo systemctl disable roscore
	@sudo rm /etc/systemd/system/roscore.service
	@sudo rm -rf /etc/ros
	@sudo systemctl daemon-reload
	@echo "roscore service uninstalled."

roslaunch:
	@echo "Installing roslaunch service..."
	@sudo cp ./services/roslaunch.service /etc/systemd/system/
	@sudo systemctl daemon-reload
	@sudo systemctl enable roslaunch
	@echo "roslaunch service installed."

uroslaunch:
	@echo "Uninstalling roslaunch service..."
	@sudo systemctl stop roslaunch
	@sudo systemctl disable roslaunch
	@sudo rm /etc/systemd/system/roslaunch.service
	@sudo systemctl daemon-reload
	@echo "roslaunch service uninstalled."

broadcast:
	@echo "Installing broadcast service..."
	@sudo cp ./services/broadcast.service /etc/systemd/system/
	@sudo systemctl daemon-reload
	@sudo systemctl enable broadcast
	@echo "broadcast service installed."

ubroadcast:
	@echo "Uninstalling broadcast service..."
	@sudo systemctl stop broadcast
	@sudo systemctl disable broadcast
	@sudo rm /etc/systemd/system/broadcast.service
	@sudo systemctl daemon-reload
	@echo "broadcast service uninstalled."

canable:
	@echo "Installing canable script..."
	@sudo cp ./scripts/canable.sh /usr/local/bin/canable
	@sudo chmod +x /usr/local/bin/canable
	@echo "canable script installed."
	@echo "Installing canable service..."
	@sudo cp ./services/canable.service /etc/systemd/system/
	@sudo systemctl daemon-reload
	@echo "canable service installed."
	@echo "Installing canable udev rule..."
	@sudo cp ./udev/99-canable.rules /etc/udev/rules.d/

ucanable:
	@echo "Uninstalling canable service..."
	@sudo rm /etc/systemd/system/canable.service
	@sudo systemctl daemon-reload
	@echo "canable service uninstalled."
	@echo "Uninstalling canable script..."
	@sudo rm /usr/local/bin/canable
	@echo "canable script uninstalled."

joystick:
	@echo "Installing deimos joystick symlink rules..."
	@sudo cp ./rules/99-deimos-joystick.rules /etc/udev/rules.d/
	@echo "Deimos joystick rules installed."
	@echo "Installing ares joystick symlink rules..."
	@sudo cp ./rules/99-ares-joystick.rules /etc/udev/rules.d/
	@echo "Ares joystick rules installed."
	@sudo udevadm control --reload-rules
	@sudo udevadm trigger
	@echo "udev rules reloaded."

ujoystick:
	@echo "Uninstalling deimos joystick symlink rules..."
	@sudo rm /etc/dev/rules.d/99-deimos-joystick.rules
	@echo "Deimos joystick rules uninstalled."
	@echo "Uninstalling ares joystick symlink rules..."
	@sudo rm /etc/dev/rules.d/99-ares-joystick.rules
	@echo "Ares joystick rules uninstalled."
	@sudo udevadm control --reload-rules
	@sudo udevadm trigger
	@echo "udev rules reloaded."

install: broadcast canable roscore 

uninstall: ubroadcast ucanable uroscore 

.PHONY: install uninstall broadcast canable roscore ubroadcast ucanable uroscore joystick ujoystick