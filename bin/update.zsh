#!/usr/bin/env zsh

setopt EXTENDED_GLOB

BASE_DIR=${0:a:h}

# The order here is important
source "$BASE_DIR/lib/exports"
source "$BASE_DIR/lib/options"
source "$BASE_DIR/lib/colors"
source "$BASE_DIR/lib/utils"
source "$BASE_DIR/lib/checks"
source "$BASE_DIR/git/init"

# Initalise the Git Repository
# sync_git

# Git
# link_git

# create gitconfig.user
# create_gitconfig

# Homebrew
source "$DOTFILES_PATH/brew/init"
update_brew

# NPM
source "$DOTFILES_PATH/npm/init"
update_npm

# Gem
source "$DOTFILES_PATH/gem/init"
update_gem

# Tmux
source "$DOTFILES_PATH/tmux/init"
update_tmux

# Zsh
# source "$DOTFILES_PATH/zsh/init"
# init_zsh

# (Neo)Vim
source "$DOTFILES_PATH/vim/init"
update_vim

# copy fonts into the library
# copy_fonts
