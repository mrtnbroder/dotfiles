# Disable default fish greeting
set fish_greeting

# Set fish home
set -gx FISH_HOME "$HOME/.config/fish"

# Source files
. $FISH_HOME/env.fish
. $FISH_HOME/theme.fish

# Fish
fish_add_path $FISH_HOME/bin
# Brew
fish_add_path /usr/local/bin /opt/homebrew/bin /opt/homebrew/sbin
# .local
fish_add_path $HOME/.local/bin
# Rust
fish_add_path $CARGO_HOME/bin
# VI key bindings
fish_vi_key_bindings
