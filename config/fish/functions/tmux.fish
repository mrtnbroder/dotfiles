function init_tmux
    # https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
    if type -q tmux; and test -z "$TMUX"; and test -z $TERMINAL_CONTEXT
        tmux attach; or tmux new-session
    end
end
