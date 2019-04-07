
source ~/.dotfiles/bin/lib/exports
# Soure Rust Lang
source $HOME/.cargo/env

set -g EDITOR nvim
set -g VISUAL nvim
set -g BROWSER google-chrome

# load all fish functions from the functions directory
function __autoload_require
  set -g fish_color_normal normal
  set -g fish_color_command green
  set -g fish_color_quote yellow
  set -g fish_color_redirection normal
  set -g fish_color_end normal
  set -g fish_color_error red
  set -g fish_color_param cyan
  set -g fish_color_comment normal
  set -g fish_color_match yellow
  set -g fish_color_search_match bryellow # --background=brblack
  set -g fish_color_operator bryellow
  set -g fish_color_escape bryellow --bold
  set -g fish_color_cwd green
  set -g fish_color_autosuggestion normal
  set -g fish_color_user green
  set -g fish_color_host normal
  set -g fish_color_cancel -r

  set -g fish_pager_color_prefix white # --bold --underline
  set -g fish_pager_color_completion
  set -g fish_pager_color_description yellow
  set -g fish_pager_color_progress white # --background=cyan

  set -g fish_color_cwd_root red
  set -g fish_color_history_current '--bold'
  set -g fish_color_selection -r
  set -g fish_color_status red
  set -g fish_color_valid_path '--underline'

  set -l core_function_path $DOTFILES_PATH/config/fish/functions/{general,git,npm,yarn}

  set fish_function_path $fish_function_path[1] $core_function_path $fish_function_path[2..-1]
end

__autoload_require

# run fisher
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
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
  if type tmux >/dev/null
    #if not inside a tmux session, and if no session is started, start a new session
    if test -z "$TMUX"; and test -z $TERMINAL_CONTEXT
      tmux -2 attach; or tmux -2 new-session
    end
  end
end

start_tmux
autocomplete_kitty
fish_vi_key_bindings

# openssl
set -g fish_user_paths \
  "/usr/local/opt/openssl/bin" \
  "$HOME/.local/bin/" \
  $fish_user_paths

# nodenv
status --is-interactive
and source (nodenv init -|psub)
# pyenv
status --is-interactive
and source (pyenv init -|psub)