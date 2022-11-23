# SHELL=/usr/local/bin/fish
DOTFILES="${HOME}/.dotfiles"
SCRIPTS="${DOTFILES}/scripts"

prerequisites:
	# Xcode
	xcode-select --install
	# Homebrew
	CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# Requirements
	brew install fish git neovim stow

restow:
	stow --no-folding --restow --ignore=".DS_Store" --target=$(HOME) --dir=$(DOTFILES) src

npm:
	npm i -g (cat install/Npmfile)
	npm up -g

gem:
	gem add (cat install/Gemfile)
	gem cleanup

homebrew:
	brew bundle --file="$(DOTFILES)/install/Brewfile"
	brew cleanup
	brew doctor

.PHONY: prerequisites install restow homebrew gem npm
