SHELL := /usr/bin/env bash
DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
HOMEBREW_PREFIX := $(shell bin/is-supported bin/is-arm64 '/opt/homebrew' '/usr/local')
SHELLS := /private/etc/shells
BASH_BIN := $(HOMEBREW_PREFIX)/bin/bash
FISH_BIN := $(HOMEBREW_PREFIX)/bin/fish
BREW_BIN := $(HOMEBREW_PREFIX)/bin/brew
FNM_BIN := $(HOMEBREW_PREFIX)/bin/fnm
STOW_BIN := $(HOMEBREW_PREFIX)/bin/stow

export XDG_CONFIG_HOME = $(HOME)/.config
export STOW_DIR = $(DOTFILES_DIR)
export ACCEPT_EULA=Y

define fnm_setup
	eval "$$($(FNM_BIN) env)"
endef

.PHONY: all macos core-macos packages stow sudo link unlink brew fish git npm brew-packages brew-casks node-packages test

all: macos

macos: core-macos packages link

core-macos: brew fish git npm

packages: brew-packages brew-casks node-packages

stow: brew
	is-executable $(STOW_BIN) || brew install stow

sudo:
ifndef GITHUB_ACTION
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
endif

link: stow
	mkdir -p $(XDG_CONFIG_HOME)
	$(STOW_BIN) --no-folding --restow --ignore=".DS_Store" -t $(HOME) runcom
	$(STOW_BIN) --no-folding --restow --ignore=".DS_Store" -t $(XDG_CONFIG_HOME) config

unlink: stow
	$(STOW_BIN) --delete -t $(HOME) runcom
	$(STOW_BIN) --delete -t $(XDG_CONFIG_HOME) config

brew:
	is-executable $(BREW_BIN) || NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

fish: brew
ifdef GITHUB_ACTION
	if ! grep -q $(FISH_BIN) $(SHELLS); then \
		$(BREW_BIN) install fish; \
		sudo append $(FISH_BIN) $(SHELLS); \
		sudo chsh -s $(FISH_BIN); \
	fi
else
	if ! grep -q $(FISH_BIN) $(SHELLS); then \
		$(BREW_BIN) install fish; \
		sudo append $(FISH_BIN) $(SHELLS); \
		chsh -s $(FISH_BIN); \
	fi
endif

git: brew
	is-executable git || $(BREW_BIN) install git

npm: brew-packages
	$(FNM_BIN) install --lts

brew-packages: brew
	$(BREW_BIN) bundle --file=$(DOTFILES_DIR)/install/Brewfile || true

brew-casks: brew
	$(BREW_BIN) bundle --file=$(DOTFILES_DIR)/install/Caskfile || true

node-packages: npm
	$(fnm_setup); npm install -g $(shell grep -v '^#' install/npmfile | awk '{print $1}' | tr '\n' ' ')

test:
	$(fnm_setup); bats test
