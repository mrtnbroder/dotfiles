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

BASE_DIR=${0:a:h}

echo "BASE_DIR: $BASE_DIR"

# The order is important
source "$BASE_DIR/lib/exports"
source "$BASE_DIR/lib/options"
source "$BASE_DIR/lib/download"
source "$BASE_DIR/lib/colors"
source "$BASE_DIR/lib/utils"
source "$BASE_DIR/lib/checks"
source "$BASE_DIR/lib/git"

check_required_commands

# Initalise the Git Repository
# init_git

e_ask "Are you sure you want to install .dotfiles?\n${Yellow}Warning: This may override some files in your home directory.${NC}"

if is_confirmed; then

  # Git
  link_git

  # create gitconfig.user
  create_gitconfig

  # Homebrew
  source "$BASE_DIR/lib/brew"
  update_brew

  # Fish
  source "$BASE_DIR/lib/fish"
  update_fish

  # NPM
  source "$BASE_DIR/lib/npm"
  update_npm

  # Gem
  source "$BASE_DIR/lib/gem"
  update_gem

  # Tmux
  source "$BASE_DIR/lib/tmux"
  update_tmux

  # NeoVim
  source "$BASE_DIR/lib/nvim"
  update_nvim

  # copy fonts into the library
  # copy_fonts

  # e_info "Don't forget to install a iTerm2 color scheme, located in ~/.dotfiles/apps/iTerm2"

else
  e_error "Aborting..."
fi
