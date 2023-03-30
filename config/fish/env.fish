# General
set -gx EDITOR nvim
set -gx VISUAL code
set -gx VISUAL_GIT gittower
set -gx PAGER less

# XDG Base Directory Specification (https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"

# GPG
set -gx GPG_TTY (tty)

# Browser
set -gx BROWSER brave-browser

# Enable colors
set -gx CLICOLOR 1
set -gx LSCOLORS gxfxbEaEBxxEhEhBaDaCaD

#  Prefer US English and use UTF-8
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Keep showing man page after exit
set -gx MANPAGER less -X
