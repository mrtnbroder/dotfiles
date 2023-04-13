# Disable greeting
set -U fish_greeting

# Set fish home
set -l fish_home "$HOME/.config/fish"

# Fish
fish_add_path "$fish_home/bin"
# Brew
fish_add_path /usr/local/bin /opt/homebrew/bin /opt/homebrew/sbin
# GNU coreutils
# fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin

# Source files
. $fish_home/env.fish
. $fish_home/abbrs.fish
. $fish_home/aliases.fish

# Load fisher
if not type -q fisher
    curl https://git.io/fisher --create-dirs -sLo "$XDG_CONFIG_HOME/fish/functions/fisher.fish"
    fish -c "fisher update"
end

# fnm
if type -q fnm
    fnm env --use-on-cd | .
end

# kitty
if type -q kitty
    kitty + complete setup fish | .
end

# pyenv
if type -q pyenv
    set -Ux PYENV_ROOT "$HOME/.pyenv"
    fish_add_path "$PYENV_ROOT/bin"
    status --is-interactive; and . (pyenv init -| psub)
end

# rbenv
if type -q rbenv
    status --is-interactive; and . (rbenv init -| psub)
    # echo "init rbenv"
end

# jenv
if type -q jenv
    # fish_add_path $HOME/.jenv/bin
    status --is-interactive; and . (jenv init -| psub)
    # echo "init rbenv"
end


fish_vi_key_bindings

starship init fish | .
