# Simple installer for macOS/Linux
PREFIX ?= /usr/local
BIN_DIR := $(PREFIX)/bin
SCRIPTS := bin/artisan bin/cdlaravel bin/cache-clear-all

.PHONY: all install uninstall print install-user

all: print

print:
	@echo "Targets:"
	@echo "  make install       Install scripts into $(BIN_DIR)"
	@echo "  make uninstall     Remove scripts from $(BIN_DIR)"
	@echo "  make install-user  Install to $$HOME/.local/bin"

install:
	@mkdir -p "$(BIN_DIR)"
	@for f in $(SCRIPTS); do \
	  install -m 0755 "$$f" "$(BIN_DIR)"; \
	  echo "Installed $(BIN_DIR)/$$(basename $$f)"; \
	done

install-user:
	$(MAKE) install PREFIX="$$HOME/.local"
	@printf "\nIf not already in PATH, add this line to your shell rc:\n  export PATH=\"$$HOME/.local/bin:$$PATH\"\n"

uninstall:
	@for f in $(SCRIPTS); do \
	  rm -f "$(BIN_DIR)/$$(basename $$f)"; \
	  echo "Removed $(BIN_DIR)/$$(basename $$f)"; \
	done
