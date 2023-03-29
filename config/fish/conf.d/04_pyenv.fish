# pyenv
if type -q pyenv
  set -Ux PYENV_ROOT "$HOME/.pyenv"
  fish_add_path "$PYENV_ROOT/bin"
  status --is-interactive; and source (pyenv init -| psub)
end
