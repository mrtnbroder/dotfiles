# .files

These are my macOS dotfiles. Feel free to use it, but at your own risk.

## Highlights

- Easy install via [Makefile](./Makefile)
- Mostly based around Homebrew + Casks, Node.js, latest Fish + GNU Utils
- Starship Prompt
- macOS defaults
- Well-organized and easy to customize
- Supports both Apple Silicon and Intel chips
- [`dot`](./config/fish/bin/dot.fish) bin for common dotfile tasks

## Prerequisites

On a sparkling fresh macOS system:

1. Login into Apple Account (System Settings -> Apple ID) (Required for the `mas` utility).
2. Update to the latest macOS and install the Xcode Command Line Tools.

```sh
softwareupdate -i -a
xcode-select --install
```

3. _(Optional)_ on Apple Silicon chips:

```sh
softwareupdate --install-rosetta --agree-to-license
```

4. The Xcode Command Line Tools add `git` and `make`. Now you can run:

```sh
git clone https://github.com/mrtnbroder/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && make
```

This will do the following:

- Install [Homebrew](https://brew.sh) packages ([Brewfile](./install/Brewfile))
- Install [Homebrew casks](https://github.com/Homebrew/homebrew-cask) ([Caskfile](./install/Caskfile))
- Install Node LTS via fnm ([npmfile](./install/npmfile))
- Python via pyenv
- Ruby via rbenv
- Latest tools like Git, Fish, GNU coreutils, curl, wget etc.
- `$EDITOR` is `nvim` (`$VISUAL` is `code` and Git `core.editor` is `code --wait`)

## The `dotfiles` command

```
$ dotfiles help
Usage: dotfiles <command>

Commands:
   clean            Clean up caches (brew, gem, pip)
   edit             Open dotfiles in IDE (code) and Git GUI (stree)
   help             This help message
   macos            Apply macOS system defaults
   update           Update packages and pkg managers (brew, casks, pip3, npm, gems, macOS)
```
