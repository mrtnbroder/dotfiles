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

"###############################################################################
"# Plug
"###############################################################################

" Install Plug+Plugins if required
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !mkdir -p ~/.config/nvim/autoload
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall
" endif

" Set the runtime path to include Plug and initialize
call plug#begin('~/.config/nvim/plugged')

"###############################################################################
"# Plugs
"###############################################################################

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
" Plug 'tpope/vim-fugitive'

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

" Close Plug
call plug#end()

"###############################################################################
"# General settings
"###############################################################################

" Automatic plugin indent
filetype plugin indent on

" Show line numbers
set number

" Create the 'tags' file (may need to install ctags first)
" command! MakeTags !ctags -R .

" Numbers are relative to cursor
set relativenumber

" Set the title at top of tab to be the filename
set title

" Automatic syntax
syntax enable

" Tab
set tabstop=2 shiftwidth=2 expandtab

" Backspace
set backspace=2

" Display hidden whitespace
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

" Display hidden characters by default
set list

" Highlight current line
set cursorline

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Highlight column 80
set colorcolumn=80
set linebreak

" Give one virtual space at end of line
set virtualedit=onemore

" Ignore node_modules
set wildignore+=**/node_modules/**

" Complete files like a shell
set wildmenu wildmode=full

" Specify files to ignore on wildmenu
set wildignore+=.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.sw?
set wildignore+=.DS_Store
set wildignore+=node_modules,bower_components,elm-stuff

" Ignore patterns for netrw
let g:netrw_list_hide='.*\.git,.*\.DS_Store$'

" Set highlight for search
set hlsearch

" Case-insensitive searching
set ignorecase

" But case-sensitive if expression contains a capital letter
set smartcase

" Remove automatic text wrapping
set nowrap

" Display status bar
set laststatus=2

" Backups are annoying, let file versioning handles this
set nobackup
set nowritebackup

" Stop being bothered by Vim swap files
set noswapfile

" Enable mouse in all modes because why not
set mouse=a

" Change the position where panes are opened
set splitbelow
set splitright

" Enable tree folding
set foldenable
set foldnestmax=10
set foldlevelstart=10
set foldmethod=indent

" Remap the space key to toggle current fold
nnoremap <tab> za

" Fix folding on JSON and CSS files
autocmd Filetype json,css,scss setlocal foldmethod=syntax

" Limits the body of Git commit messages to 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72

" Enable spell checking on certain file types
autocmd BufRead,BufNewFile *.md,gitcommit setlocal spell complete+=kspell

" Auto save files when focus is lost
" au FocusLost * silent! wa

"###############################################################################
"# Theming
"###############################################################################

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Set background
set background=dark

" Define color scheme
" colorscheme Base2Tone-Sea-dark

" Enable italic text
highlight Comment cterm=italic

" Display current line number in bold text
highlight CursorLineNr cterm=bold

" Set hidden characters colors to light gray
" highlight NonText ctermfg=187 ctermbg=white
" highlight SpecialKey ctermfg=187 ctermbg=white

"###############################################################################
"# Emmet
"###############################################################################

" Disable Emmet for all file types
let g:user_emmet_install_global = 0

" Specifies file types for Emmet
autocmd FileType html,erb,css,scss EmmetInstall

"###############################################################################
"# CtrlP
"###############################################################################

" Use Git's `ls-files` and properly ignore hidden files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Remap most used CtrlP commands
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" ignore gitignore files in CtrlP v2
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

"###############################################################################
"# Indent guides
"###############################################################################

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Disable automatic colors and specify custom ones
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black

"###############################################################################
"# Coc - Concer of completion
"###############################################################################

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Run prettier on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"###############################################################################
"# Polyglot
"###############################################################################

" Disable JavaScript on Polyglot due to conflicts with yajs
" let g:polyglot_disabled = ['javascript']

"###############################################################################
"# Syntastic
"###############################################################################

" let g:syntastic_javascript_checkers = ['eslint']

"###############################################################################
"# UltiSnips
"###############################################################################

" let g:UltiSnipsEditSplit='vertical'

"###############################################################################
"# Lightline
"###############################################################################

" let g:lightline = {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
"       \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
"       \ },
"       \ 'component_function': {
"       \   'fugitive': 'LightLineFugitive',
"       \   'filename': 'LightLineFilename',
"       \   'fileformat': 'LightLineFileformat',
"       \   'filetype': 'LightLineFiletype',
"       \   'fileencoding': 'LightLineFileencoding',
"       \   'mode': 'LightLineMode',
"       \   'ctrlpmark': 'CtrlPMark',
"       \ },
"       \ 'component_expand': {
"       \   'syntastic': 'SyntasticStatuslineFlag',
"       \ },
"       \ 'component_type': {
"       \   'syntastic': 'error',
"       \ },
"       \ 'subseparator': { 'left': '|', 'right': '|' }
"       \ }

" function! LightLineModified()
"   return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction

" function! LightLineReadonly()
"   return &ft !~? 'help' && &readonly ? 'RO' : ''
" endfunction

" function! LightLineFilename()
"   let fname = expand('%:t')
"   return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
"         \ fname == '__Tagbar__' ? g:lightline.fname :
"         \ fname =~ '__Gundo\|NERD_tree' ? '' :
"         \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \ &ft == 'unite' ? unite#get_status_string() :
"         \ &ft == 'vimshell' ? vimshell#get_status_string() :
"         \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"         \ ('' != fname ? fname : '[No Name]') .
"         \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
" endfunction

" function! LightLineFugitive()
"   try
"     if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
"       let mark = ''  " edit here for cool mark
"       let branch = fugitive#head()
"       return branch !=# '' ? mark.branch : ''
"     endif
"   catch
"   endtry
"   return ''
" endfunction

" function! LightLineFileformat()
"   return winwidth(0) > 70 ? &fileformat : ''
" endfunction

" function! LightLineFiletype()
"   return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
" endfunction

" function! LightLineFileencoding()
"   return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
" endfunction

" function! LightLineMode()
"   let fname = expand('%:t')
"   return fname == '__Tagbar__' ? 'Tagbar' :
"         \ fname == 'ControlP' ? 'CtrlP' :
"         \ fname == '__Gundo__' ? 'Gundo' :
"         \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
"         \ fname =~ 'NERD_tree' ? 'NERDTree' :
"         \ &ft == 'unite' ? 'Unite' :
"         \ &ft == 'vimfiler' ? 'VimFiler' :
"         \ &ft == 'vimshell' ? 'VimShell' :
"         \ winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

" function! CtrlPMark()
"   if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
"     call lightline#link('iR'[g:lightline.ctrlp_regex])
"     return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
"           \ , g:lightline.ctrlp_next], 0)
"   else
"     return ''
"   endif
" endfunction

" let g:ctrlp_status_func = {
"   \ 'main': 'CtrlPStatusFunc_1',
"   \ 'prog': 'CtrlPStatusFunc_2',
"   \ }

" function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
"   let g:lightline.ctrlp_regex = a:regex
"   let g:lightline.ctrlp_prev = a:prev
"   let g:lightline.ctrlp_item = a:item
"   let g:lightline.ctrlp_next = a:next
"   return lightline#statusline(0)
" endfunction

" function! CtrlPStatusFunc_2(str)
"   return lightline#statusline(0)
" endfunction

" let g:tagbar_status_func = 'TagbarStatusFunc'

" function! TagbarStatusFunc(current, sort, fname, ...) abort
"     let g:lightline.fname = a:fname
"   return lightline#statusline(0)
" endfunction

" augroup AutoSyntastic
"   autocmd!
"   autocmd BufWritePost *.c,*.cpp call s:syntastic()
" augroup END
" function! s:syntastic()
"   SyntasticCheck
"   call lightline#update()
" endfunction

" let g:unite_force_overwrite_statusline = 0
" let g:vimfiler_force_overwrite_statusline = 0
" let g:vimshell_force_overwrite_statusline = 0

"###############################################################################
"# HardMode
"###############################################################################

" Boot into HardMode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
