#!/usr/bin/env zsh

setopt EXTENDED_GLOB

printf "%s" "$(tput setaf 6)"
printf "%s\n" '                _      _'
printf "%s\n" '    |          | | o  | |'
printf "%s\n" '  __|   __ _|_ | |    | |  _   ,'
printf "%s\n" ' /  |  /  \_|  |/  |  |/  |/  / \_'
printf "%s\n" 'o\_/|_/\__/ |_/|__/|_/|__/|__/ \/'
printf "%s\n" '               |\'
printf "%s\n" '               |/ by Martin Broder'
printf "%s\n" "$(tput sgr0)"

# The order here is important
source "$HOME/.dotfiles/lib/paths"
source "$DOTFILES_PATH/lib/options"
source "$DOTFILES_PATH/lib/download"
source "$DOTFILES_PATH/lib/colors"
source "$DOTFILES_PATH/lib/utils"
source "$DOTFILES_PATH/lib/checks"
source "$DOTFILES_PATH/git/init"

# Initalise the Git Repository
init_git

e_ask "Are you sure you want to install .dotfiles?\n${Yellow}Warning: This may override some files in your home directory.${NC}"

if is_confirmed; then

  # Git
  link_git

  # create gitconfig.user
  create_gitconfig

  # Homebrew
  source "$DOTFILES_PATH/brew/init"
  init_brew

  # NPM
  source "$DOTFILES_PATH/npm/init"
  init_npm

  # Gem
  source "$DOTFILES_PATH/gem/init"
  init_gem

  # Zsh
  source "$DOTFILES_PATH/zsh/init"
  init_zsh

  # (Neo)Vim
  source "$DOTFILES_PATH/vim/init"
  init_vim

  # copy fonts into the library
  # copy_fonts

  # e_info "Don't forget to install a iTerm2 color scheme, located in ~/.dotfiles/apps/iTerm2"

else
  e_error "Aborting..."
fi
