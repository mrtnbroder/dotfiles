call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'

" On-demand loading
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/peaksea'
Plug 'ctrlpvim/ctrlp.vim'

" Add plugins to &runtimepath
call plug#end()
