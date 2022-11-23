# Prerequisites
function dotfiles_setup_prerequisities -d "Setup dotfiles prerequisites"
    set -l fish_home $HOME/.config/fish
    # Brew puts some binaries into this path
    fish_add_path /usr/local/sbin
    source $fish_home/environment.fish
    source $fish_home/prompt.fish
    source $fish_home/abbrs.fish

    # pyenv
    if type -q pyenv
        set -Ux PYENV_ROOT $HOME/.pyenv
        fish_add_path $PYENV_ROOT/bin
        status --is-interactive; and source (pyenv init -| psub)
        # echo "init pyenv"
    end

    # rbenv
    if type -q rbenv
        status --is-interactive; and source (rbenv init -| psub)
        # echo "init rbenv"
    end

    # nodenv
    if type -q nodenv
        status --is-interactive; and source (nodenv init -| psub)
        # echo "init nodenv"
    end
end

# Haskell
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.ghcup/bin


# set -l core_function_path $DOTFILES_PATH/config/fish/functions/{general,git,npm,yarn}
# set fish_function_path $fish_function_path[1] $core_function_path $fish_function_path[2..-1]

# fisher
if not type -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Kitty Termial autocompletions
function autocomplete_kitty
    if type -q kitty
        kitty + complete setup fish | source
    end
end

# always start within a tmux session
function start_tmux
    # https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
    if type -q tmux; and test -z "$TMUX"; and test -z $TERMINAL_CONTEXT
        tmux attach; or tmux new-session
    end
end

dotfiles_setup_prerequisities
fish_vi_key_bindings
starship init fish | source
# start_tmux

# autocomplete_kitty



# Soure Rust Lang
# source $HOME/.cargo/env
