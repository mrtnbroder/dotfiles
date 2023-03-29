#!/usr/bin/env fish

set BIN_NAME (status filename)
set COMMAND_NAME $argv[1]
set SUB_COMMAND_NAME $argv[2]

function dot_help
  echo "Usage: $BIN_NAME <command>"
  echo
  echo "Commands:"
  echo "   clean            Clean up caches (brew, gem, pip)"
  echo "   dock             Apply macOS Dock settings"
  echo "   edit             Open dotfiles in IDE ($VISUAL) and Git GUI ($VISUAL_GIT)"
  echo "   help             This help message"
  echo "   macos            Apply macOS system defaults"
  echo "   test             Run tests"
  echo "   update           Update packages and pkg managers (brew, casks, pip3, npm, gems, macOS)"
end

function dot_clean
  echo "$ brew cleanup"
  brew cleanup
  echo "$ gem cleanup"
  gem cleanup
  echo "$ pip cache purge"
  pip3 cache purge
end

function dot_update
  echo "$ brew upgrade"
  brew upgrade
  echo "$ brew cask upgrade"
  brew cask upgrade
  echo "$ pip3 install --upgrade pip"
  pip3 install --upgrade pip
  echo "$ npm install -g npm"
  npm install -g npm
  echo "$ gem update --system"
  gem update --system
  echo "$ gem update"
  gem update
  echo "$ mas upgrade"
  mas upgrade
  echo "$ softwareupdate -i -a"
  softwareupdate -i -a
end

switch $COMMAND_NAME
  case "" "-h" "--help" "help"
    sub_help
  case "*"
    if type -q "sub_$COMMAND_NAME"
      eval "sub_$COMMAND_NAME"
    else
      echo "'$COMMAND_NAME' is not a known command or has errors."
      sub_help
      exit 1
    end
end
