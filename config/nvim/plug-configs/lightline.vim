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
