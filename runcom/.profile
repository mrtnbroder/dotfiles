# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Source the dotfiles (order matters)

# for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,exports,alias,fnm,grep,prompt,completion,fix,zoxide}; do
#   . "$DOTFILE"
# done

# if is-macos; then
#   for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.macos; do
#     . "$DOTFILE"
#   done
# fi

