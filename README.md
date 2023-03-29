# .files

These are my macOS dotfiles. Feel free to use it, but at your own risk.

---

## ToC

- Prerequisites
- Install
- The `dot` command
- `Makefile`

---

## Prerequisites

On a sparkling fresh macOS:

1. Login into Apple Account (System Settings -> Apple ID - Required for the MAS utility).
2. Update to the latest macOS and install the Xcode Command Line Tools.

```sh
softwareupdate -i -a
xcode-select --install
```

Additionally on Apple Silicon Macs:

```sh
softwareupdate --install-rosetta --agree-to-license
```

The Xcode Command Line Tools add `git` and `make`. Now you can run:

```sh
git clone https://github.com/mrtnbroder/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make
```

This will do the following:

- Install Homebrew packages (Brewfile)
- Install Homebrew casks (Caskfile)
- Install Node via nodenv + npm LTS (npmfile)
- Python via pyenv
- Ruby via rbenv
- Latest tools like Git, Fish, GNU coreutils, curl, wget etc.
- `$EDITOR` is `nvim` (`$VISUAL` is `code` and Git `core.editor` is `code --wait`)

## Bootstrapping

The bootstrapping process is meant to be idempotent, which means you can run it
as many times as you want, the result is (in theory) always the same.

`bootstrap.sh`

- OS Setup
  - Installs XCode CLI
    - Installs rosetta on arm_64 (apple silicon chips)
  - Installs Homebrew
    - Installs git, pyenv with latest python 3 version and fish shell
  - Symlinks dotfiles
