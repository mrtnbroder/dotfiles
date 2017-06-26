
source ~/.dotfiles/bin/lib/exports

set -g EDITOR nvim
set -g VISUAL nvim

function start_tmux
  # https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
  if type tmux > /dev/null
    #if not inside a tmux session, and if no session is started, start a new session
    if test -z "$TMUX" ; and test -z $TERMINAL_CONTEXT
      tmux -2 attach; or tmux -2 new-session
    end
  end
end

# always start within a tmux session
# start_tmux

# run fisher once
# fisher ^/dev/null

# init nodenv
status --is-interactive; and . (nodenv init -|psub)

# init rbenv
status --is-interactive; and . (rbenv init -|psub)

source ~/.dotfiles/config/fish/functions/git/aliases.fish
