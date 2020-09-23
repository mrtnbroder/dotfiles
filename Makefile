SHELL = /usr/local/bin/fish
DOTFILES="${HOME}/.dotfiles"
SCRIPTS="${DOTFILES}/scripts"

prerequisites:
	# Xcode
	xcode-select --install
	# Homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# Git
	brew install git
	# Fish Shell
	brew install fish
	# Vim
	brew install neovim

restore:
	stow --restow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)" src

homebrew:

yarn:
	yarn global add (cat install/Npmfile)
	yarn global upgrade

gem:
	gem add (cat install/Gemfile)
	gem cleanup

homebrew:
	brew bundle --file="$(DOTFILES)/install/Brewfile"
	brew cleanup
	brew doctor

.PHONY: prerequisites install restore homebrew gem yarn
