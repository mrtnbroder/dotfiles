#!/usr/bin/env zsh

# Initialize Z Shell with with -L Flag, causing the effects of the emulate
# command and any setopt and trap commands to be local to the immediately
# surrounding shell function

emulate -LR zsh # http://stackoverflow.com/questions/3964068/zsh-automatically-run-ls-after-every-cd#comment11149454_3964198

# Installation

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

# Variables

export base_dir="${ZDOTDIR:-$HOME}/.dotfiles_v2"
# base_dir="${ZDOTDIR:-$HOME}/Dropbox/dotfiles"
export base_git="https://github.com/mrtnbroder/dotfiles_v2"
export base_tar="https://github.com/mrtnbroder/dotfiles_v2/tarball/master"

export no_apps=true
export no_sync=false
export no_npm=false
export no_brew=false
export no_gem=false

# Downloading

if [[ ! -d $base_dir ]]; then
    printf "$(tput setaf 6)➜ %s$(tput sgr0)\n" "Downloading dotfiles"

    # create directory
    mkdir "$base_dir"
    # # Get the tarball
    curl -fsSLo "${ZDOTDIR:-$HOME}"/dotfiles.tar.gz "$base_tar"
    # # Extract to the dotfiles directory
    tar -zxf "${ZDOTDIR:-$HOME}"/dotfiles.tar.gz --strip-components 1 -C "$base_dir"
    # # Remove the tarball
    rm -rf "${ZDOTDIR:-$HOME}"/dotfiles.tar.gz

    [ $? ] && echo "$(tput setaf 2)✔ Done.$(tput sgr0)"
fi

cd "$base_dir"

# Imports

source "lib/colors"
source "lib/utils"

source "lib/checks"

source "lib/git"

# initialise the git repository
init_git

# sync with git
sync_git

e_ask "Are you sure you want to install .dotfiles?\n${Yellow}Warning: This may override some files in your home directory.${NC}"

if is_confirmed; then

    # link git configs for some default behaviour
    link_git
    # create gitconfig.user
    create_gitconfig

    # run brew
    source "lib/brew"
    init_brew

    # run npm
    source "lib/npm"
    init_npm

    # link .gemrc
    link_gem

    # run gem
    source "lib/gem"
    init_gem

    # link prezto
    link_prezto

    # link vundle and vimrc
    # link_vim

    # copy fonts into the library
    copy_fonts

    # install vundle bundles
    # vim +BundleInstall +qall

    # e_info "Don't forget to install a iTerm2 color scheme, located in ~/.dotfiles/apps/iTerm2"

else
    e_error "Aborting..."
fi

























