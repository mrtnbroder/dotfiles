if type -q jenv
    # fish_add_path $HOME/.jenv/bin
    status --is-interactive; and . (jenv init -| psub)
    # echo "init rbenv"
end
