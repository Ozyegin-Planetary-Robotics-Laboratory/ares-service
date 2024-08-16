services = $(wildcard ./services/*.service)

install:
	@echo "Installing ROS environment file..."
	@sudo mkdir -p /etc/ros
	@sudo cp ./env.sh /etc/ros/env.sh
	@echo "Installing services..."
	@for service in $(services); do \
		sudo cp $$service /etc/systemd/system/; \
		sudo systemctl enable $$(basename $$service); \
		sudo systemctl start $$(basename $$service); \
	done

uninstall:
	@echo "Removing services..."
	@for service in $(services); do \
		sudo systemctl stop $$(basename $$service); \
		sudo systemctl disable $$(basename $$service); \
		sudo rm /etc/systemd/system/$$(basename $$service); \
	done
	@echo "Removing ROS environment file..."
	@sudo rm /etc/ros/env.sh
	@sudo systemctl daemon-reload

.PHONY: install uninstall