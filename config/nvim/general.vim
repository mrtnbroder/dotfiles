"###############################################################################
"# Bootstrap
"###############################################################################

" Vim doesn't like fish
set shell=/bin/sh

" be iMproved, required
set nocompatible

" UTF-8 all the things
set encoding=utf-8
set fileencoding=utf-8

let g:loaded_perl_provider = 0

"###############################################################################
"# General settings
"###############################################################################


syntax enable                     " Automatic syntax
filetype plugin indent on         " Automatic plugin indent
set hidden                        " Required to keep multiple buffers open multiple buffers
set nowrap                        " Remove automatic text wrapping
set pumheight=10                  " Makes popup menu smaller
set ruler              			      " Show the cursor position all the time
set cmdheight=2                   " More space for displaying messages
set iskeyword+=-                  " treat dash separated words as a word text object"
set mouse=a                       " Enable mouse in all modes
set splitbelow                    " Horizontal splits will automatically be below
set splitright                    " Vertical splits will automatically be to the right
set t_Co=256                      " Support 256 colors
set conceallevel=0                " So that I can see `` in markdown files
set tabstop=2                     " Insert 2 spaces for a tab
set shiftwidth=2                  " Change the number of space characters inserted for indentation
set smarttab                      " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                     " Converts tabs to spaces
set smartindent                   " Makes indenting smart
set autoindent                    " Good auto indent
set laststatus=2                  " Display status bar
set number                        " Show line numbers
set cursorline                    " Highlight current line
set background=dark               " tell vim what the background color looks like
set showtabline=2                 " Always show tabs
" set noshowmode                  " We don't need to see things like -- INSERT -- anymore
set nobackup                      " This is recommended by coc
set nowritebackup                 " This is recommended by coc
set formatoptions-=cro            " Stop newline continution of comments
set clipboard=unnamedplus         " Copy paste between vim and everything else

set relativenumber                " Numbers are relative to cursor
set title                         " Set the title at top of tab to be the filename
set backspace=2                   " Backspace
set list                          " Display hidden characters by default
set colorcolumn=80                " Highlight column 80
set linebreak
set virtualedit=onemore           " Give one virtual space at end of line
set hlsearch                      " Set highlight for search
set ignorecase                    " Case-insensitive searching
set smartcase                     " But case-sensitive if expression contains a capital letter
set noswapfile                    " Stop being bothered by Vim swap files

" Fix folding on JSON and CSS files
autocmd Filetype json,css,scss setlocal foldmethod=syntax

" Limits the body of Git commit messages to 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72

" Enable spell checking on certain file types
autocmd BufRead,BufNewFile *.md,gitcommit setlocal spell complete+=kspell

" Auto save files when focus is lost
" au FocusLost * silent! wa

"###############################################################################
"# HardMode
"###############################################################################

" Boot into HardMode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
