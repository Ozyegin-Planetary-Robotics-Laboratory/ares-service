SOURCE_SERVICE_DIR = ./services
SOURCE_SCRIPTS_DIR = ./scripts
SOURCE_UDEVRULES_DIR = ./rules

TARGET_SERVICE_DIR = /etc/systemd/system
TARGET_SCRIPTS_DIR = /usr/local/bin
TARGET_UDEVRULES_DIR = /etc/udev/rules.d

SERVICES = $(wildcard $(SOURCE_SERVICE_DIR)/*.service)
SCRIPTS = $(wildcard $(SOURCE_SCRIPTS_DIR)/*.sh)
UDEVRULES = $(wildcard $(SOURCE_UDEVRULES_DIR)/*.rules)

%.service:
	@echo "Installing $@..."
	@sudo cp $(SOURCE_SERVICE_DIR)/$@ $(TARGET_SERVICE_DIR)/
	@sudo systemctl daemon-reload
	@echo "$@ installed."

%.rules:
	@echo "Installing $@ udev rule..."
	@sudo cp $(SOURCE_UDEVRULES_DIR)/$@ $(TARGET_UDEVRULES_DIR)/

%.sh:
	@echo "Installing $@..."
	@sudo cp $(SOURCE_SCRIPTS_DIR)/$@ $(TARGET_SCRIPTS_DIR)/
	@sudo chmod +x $(TARGET_SCRIPTS_DIR)/$@
	@echo "$@ installed."

install: $(SERVICES) $(SCRIPTS) $(UDEVRULES)
	@echo "Installation complete." 

.PHONY: install