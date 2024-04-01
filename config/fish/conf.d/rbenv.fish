if type -q rbenv
    status --is-interactive; and . (rbenv init -| psub)
    # echo "init rbenv"
end
