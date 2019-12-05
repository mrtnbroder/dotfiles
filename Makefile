DOTFILES="${HOME}/.dotfiles"
SCRIPTS="${DOTFILES}/scripts"

all: homebrew neovim

first_install:
	brew install stow

install:
	stow --restow --ignore ".DS_Store" --target="$(HOME)" --dir="$(DOTFILES)" src

homebrew:
	brew bundle --file="$(DOTFILES)/extra/Brewfile"
	brew cleanup
	brew doctor

neovim:
	brew install neovim

.PHONY: all install homebrew neovim
