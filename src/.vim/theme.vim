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
"# Indent guides
"###############################################################################

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Disable automatic colors and specify custom ones
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
