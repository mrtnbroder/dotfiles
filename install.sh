#!/usr/bin/env sh

# exit on error
set -e

ANSIBLE_REPO_PATH="$HOME/.dotfiles.$(date +%H%M%S)"
ANSIBLE_REPO_BRANCH=main
ANSIBLE_REPO_PLAYBOOK=bootstrap
ANSIBLE_REPO_URL=https://github.com/mrtnbroder/dotfiles-ansible.git

bootstrap_macos() {
  # make sure macos doesnt go to sleep
  pgrep caffeinate >/dev/null || (caffeinate -d -i -m -u &)
  # reset `sudo` timeout
  sudo -v
  # xcode command line tools might be required for some things
  xcode-select --install
  # homebrew uses a different path for arm64 (apple silicon chips)
  case "$(uname -m)" in
  x86_64)
    export PATH="/opt/homebrew/bin:${PATH}"
    ;;
  arm64)
    export PATH="/usr/local/bin:${PATH}"
    sudo softwareupdate --install-rosetta
    ;;
  esac
  # Run in CI mode
  CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # install required tools
  brew install python3 git
  export PATH
}

bootstrap_macos

git clone "$ANSIBLE_REPO_URL" "$ANSIBLE_REPO_PATH"
cd "$ANSIBLE_REPO_PATH"
git checkout "$ANSIBLE_REPO_BRANCH"
pip3 install ansible ansible-lint

# ANSIBLE_CONFIG=setup/setup.cfg ansible-playbook setup/site.yml --extra-vars "@setup/extra-vars.yml"

ansible-playbook local.yml --ask-become-pass --tags=bootstrap
# ansible-playbook playbooks/dotfiles.yml
