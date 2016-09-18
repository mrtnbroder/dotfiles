" dein Scripts-----------------------------

if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/mbroder/.dotfiles/vim/dein.vim//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/mbroder/.dotfiles/vim/dein.vim/')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
" call dein#add('Shougo/neosnippet.vim')
" call dein#add('Shougo/neosnippet-snippets')

call dein#add('junegunn/vim-easy-align')
call dein#add('junegunn/vim-github-dashboard')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/syntastic')

" On-demand loading
call dein#add('junegunn/goyo.vim')
call dein#add('vim-scripts/peaksea')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('wikitopian/hardmode')
call dein#add('tpope/vim-surround')

" Javascript
call dein#add('jelera/vim-javascript-syntax')
call dein#add('othree/javascript-libraries-syntax.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

"  If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" /dein Scripts-------------------------
