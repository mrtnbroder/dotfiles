# Disable greeting
set -U fish_greeting
# Set fish home
set -l fish_home "$XDG_CONFIG_HOME/fish"

# Brew puts some binaries into this path
# fish_add_path "/usr/local/sbin"
# fish_add_path "$HOME/.local/bin"

source $fish_home/abbrs.fish
source $fish_home/aliases.fish

fish_vi_key_bindings

starship init fish | source
