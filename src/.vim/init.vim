"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" General Settings

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim

if exists('g:vscode')

  " VS Code extension
  source $HOME/.config/nvim/plug-configs/polyglot.vim
  source $HOME/.config/nvim/vscode/settings.vim
  source $HOME/.config/nvim/plug-configs/easymotion.vim
  " source $HOME/.config/nvim/keys/mappings.vim
  source $HOME/.config/nvim/plug-configs/highlightyank.vim

else

  " Theme
  source $HOME/.config/nvim/theme.vim

  " Plugin Configurations
  " source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/plug-configs/emmet.vim
  source $HOME/.config/nvim/plug-configs/ctrlp.vim
  source $HOME/.config/nvim/plug-configs/coc.vim
  source $HOME/.config/nvim/plug-configs/syntastic.vim
  source $HOME/.config/nvim/plug-configs/ulti-snips.vim
  source $HOME/.config/nvim/plug-configs/lightline.vim

endif
