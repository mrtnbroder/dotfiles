# XDG Base Directory
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GPG_TTY (tty)
set -gx PAGER less
set -gx BROWSER brave-browser
# set -gx LSCOLORS gxfxbEaEBxxEhEhBaDaCaD
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Path
fish_add_path $HOME/.local/bin

