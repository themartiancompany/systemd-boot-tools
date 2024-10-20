#
# SPDX-License-Identifier: GPL-3.0-or-later

_PKG=systemd-boot
_PROJECT=$(_PKG)-tools
PREFIX ?= /usr/local
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
LIB_DIR=$(DESTDIR)$(PREFIX)/lib

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 "$(_PROJECT)/mk$(_PKG)" "$(BIN_DIR)/mk$(_PKG)"
	install -vDm 755 "$(_PROJECT)/mk$(_PKG)cfg" "$(BIN_DIR)/mk$(_PKG)cfg"

install-doc:
	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
