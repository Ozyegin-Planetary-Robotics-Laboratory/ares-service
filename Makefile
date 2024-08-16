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

.PHONY: install