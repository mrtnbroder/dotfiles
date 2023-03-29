# rbenv
if type -q rbenv
  status --is-interactive; and source (rbenv init -| psub)
  # echo "init rbenv"
end
