#!/usr/bin/env zsh

# Initialize Z Shell with with -L Flag, causing the effects of the emulate
# command and any setopt and trap commands to be local to the immediately
# surrounding shell function

emulate -L zsh

# Installation

printf "$(tput setaf 6)"
printf "%s\n" '                _      _'
printf "%s\n" '    |          | | o  | |'
printf "%s\n" '  __|   __ _|_ | |    | |  _   ,'
printf "%s\n" ' /  |  /  \_|  |/  |  |/  |/  / \_'
printf "%s\n" 'o\_/|_/\__/ |_/|__/|_/|__/|__/ \/'
printf "%s\n" '               |\'
printf "%s\n" '               |/ by Martin Broder'
printf "$(tput sgr0)\n"

# Variables

base_dir="${ZDOTDIR:-$HOME}/.testfiles"
base_git="https://github.com/mrtnbroder/dotfiles_v2"
base_tar="https://github.com/mrtnbroder/dotfiles_v2/tarball/master"

no_apps=true
no_sync=false
no_npm=false
no_brew=false
no_gem=false

# Downloading

if [[ ! -d $base_dir ]]; then
    printf "$(tput setaf 6)➜ %s$(tput sgr0)\n" "Downloading dotfiles"

    # create directory
    mkdir $base_dir
    # # Get the tarball
    curl -fsSLo ${ZDOTDIR:-$HOME}/dotfiles.tar.gz $base_tar
    # # Extract to the dotfiles directory
    tar -zxf ${ZDOTDIR:-$HOME}/dotfiles.tar.gz --strip-components 1 -C $base_dir
    # # Remove the tarball
    rm -rf ${ZDOTDIR:-$HOME}/dotfiles.tar.gz

    [ $? ] && echo "$(tput setaf 2)✔ Done.$(tput sgr0)"
fi


cd $base_dir

# Imports

source "./lib/colors"
source "./lib/utils"

# source "./lib/flags"
source "./lib/checks"

source "./lib/brew"
source "./lib/npm"
source "./lib/gem"

e_ask "Are you sure you want to install .dotfiles?\n${Yellow}Warning: This may override some files in your home directory.${NC}"

if is_confirmed; then

    if ! $( git rev-parse --is-inside-work-tree &> /dev/null ); then
        init_git_repo
    fi

    sync_git

    init_brew

    init_npm

    init_gem

    # vim_installer

    init_prezto

else
    e_error "Aborting..."
fi

























