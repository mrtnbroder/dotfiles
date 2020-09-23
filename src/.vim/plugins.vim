"###############################################################################
"# Plug
"###############################################################################

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  " autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"###############################################################################
"# Plugs
"###############################################################################

" Set the runtime path to include Plug and initialize
call plug#begin('~/.config/nvim/plugged')

  if exists('g:vscode')
    " Easymotion
    Plug 'asvetliakov/vim-easymotion'

    " Highlight Yank
    Plug 'machakann/vim-highlightedyank'
  else

    " Make your Vim/Neovim as smart as VSCode.
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    " Tmux integration
    " Plug 'christoomey/vim-tmux-navigator'

    " morhetz
    " Plug 'morhetz/gruvbox'

    " TS Syntax
    Plug 'HerringtonDarkholme/yats.vim'

    " Fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Emmet
    Plug 'mattn/emmet-vim'

    " Editor config
    Plug 'editorconfig/editorconfig-vim'

    " Solarized color scheme
    Plug 'altercation/vim-colors-solarized'

    " Easy way to wrap/unwrap words
    Plug 'tpope/vim-surround'

    " Fuzzy search
    Plug 'ctrlpvim/ctrlp.vim'

    " Indent guides
    Plug 'nathanaelkane/vim-indent-guides'

    " Syntax highlight
    " Plug 'sheerun/vim-polyglot'

    " Syntax highlight for ES2015
    " Plug 'othree/yajs.vim'

    " Syntaxt highlighting for CSSNext
    " Plug 'hail2u/vim-css3-syntax'

    " Syntastic
    " Plug 'scrooloose/syntastic'

    " Syntastic prefer local eslint over global
    " Plug 'mtscout6/syntastic-local-eslint.vim'

    " Code snippets
    " Plug 'sirver/ultisnips'

    " Basic UltiSnip snippets
    " Plug 'honza/vim-snippets'

    " Real time color preview for CSS
    " Plug 'ap/vim-css-color'

    " Code comments helper
    " Plug 'tpope/vim-commentary'

    " Git wrapper
    Plug 'tpope/vim-fugitive'

    " Unix commands wrapper
    " Plug 'tpope/vim-eunuch'

    " Buffer navigation improved
    " Plug 'tpope/vim-unimpaired'

    " Easy string coercion
    Plug 'tpope/vim-abolish'

    " Programming metrics
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " Async keyword completion
    " Plug 'Shougo/deoplete.nvim'

    " Automatically create folders when writing buffers to disk
    " Plug 'pbrisbin/vim-mkdir'

    " Smarter increment/decrement numbers for Vim
    " Plug 'tpope/vim-speeddating'

    " Vim colorschemes
    " Plug 'atelierbram/Base2Tone-vim'

    " Show Git diff indicators on the sidebar
    " Plug 'airblade/vim-gitgutter'

    " Useful status bar
    " Plug 'itchyny/lightline.vim'

    " So we can repeat plugin commands
    " Plug 'tpope/vim-repeat'
  endif

" Close Plug
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
