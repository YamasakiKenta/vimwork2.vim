" dein
let s:dein_repo_dir = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim')
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
exec 'set rtp+=' . s:dein_repo_dir
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml(expand('~/.cache/vimwork2.vim/dein.toml'), {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

command! GFile call <SID>gitFile()
function! s:gitFile()
  Gcd
  e [Git]
  " setlocal buflisted
  setlocal buftype=nowrite
  setlocal bufhidden=delete
  setlocal noswapfile
  call setline(1, split(system('git ls-files'), "\n"))
  setlocal readonly
  map <buffer> <cr> :e <cfile><CR>
  map <buffer> q :q<cr>
endfunction

command! Mru call <SID>mru()
function! s:mru()
  e [mru]
  call setline(1, v:oldfiles)
  call setline(1, filter(map(getbufinfo(), "v:val['name']"), "v:val!=''"))
  map <buffer> <cr> gf
  map <buffer> q :q<cr>
  setlocal bufhidden=delete
  setlocal buftype=nowrite
  setlocal filetype=txt
  setlocal matchpairs=
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nowrap
endfunction

" not dein
" nnoremap <leader>b :<c-u>/ oldfiles<home>browse filter /
" nnoremap <f5> :<c-u>QuickRun<cr>
nnoremap <leader>bb<cr> :Mru<cr>:/d<home>v/
" nnoremap <leader>v :<c-u>/ ls<home>browse filter /
nnoremap <leader>ff : <c-r>=substitute(expand("%:h"), '\', '/', 'g')<cr><home>
nnoremap <leader>fp :<C-u>let @+ = expand("%:p")\|echo @+|"
nnoremap <leader>ft :<C-u>let @+ = expand("%:t")\|echo @+|"
nnoremap <leader>fd :<C-u> %:h<Home>!start 
nnoremap <S-Space> za|"
nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|"
nnoremap <C-n> :<C-u>cn<CR>:e<cr>|"
nnoremap <C-p> :<C-u>cN<CR>:e<cr>|"
nnoremap <C-j> j.|"
nnoremap <C-k> n.|"
nnoremap <C-@> @q|"
nnoremap * :<C-u>set hls<CR>:let @/ = '\<'.expand("<cword>").'\>'\|echo @/<CR>|"
nnoremap + :<C-u>AddSearch <C-r>=expand("<cword>")<CR><CR>:echo @/<CR>|"
vnoremap < <gv|"
vnoremap > >gv|"
" nnoremap go yypC
" nnoremap gO yyPC
" vnoremap / "ay/<c-r>a<cr><c-o>|"
let g:plugin_cmdex_disable = 1
cnoremap <C-X> <C-R>=<SID>GetBufferDirectory()<CR>
function! s:GetBufferDirectory()
  let dir = expand('%:p:h')
  return dir . (exists('+shellslash') && !&shellslash ? '\' : '/')
endfunction
command! -narg=* AddSearch call <SID>addSearch(<f-args>)
function! s:addSearch(...)
  if a:0 > 0
    let @/ = @/.'\|\<'.join(a:000,'\>\|\<').'\>'
  endif
endfunction

" diff
" nnoremap <a-up> [c
" nnoremap <a-down> ]c
" nnoremap <f5> :diffupdate<cr>

" finish

" http://lambdalisue.hatenablog.com/entry/2015/12/25/000046
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
" let g:loaded_netrw = 1 " #netrw必須 1/2
" let g:loaded_netrwPlugin = 1 " #netrw必須 2/2
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" netrw
" let g:netrw_liststyle = 3
"
" php
" let php_sql_query = 1
" let php_baselib = 1
" let php_htmlInStrings = 1
" let php_oldStyle = 1
" let php_asp_tags = 1
" let php_noShortTags = 1
" let php_parent_error_close = 1
" let php_parent_error_open = 1
" let php_folding = 1
" let php_sync_method = -1

set autoread
set ve=block
set nowrap
set noswapfile
set number
set fdm=marker
set ts=4
set sw=4
set expandtab
set list lcs=tab:\.\ |
set nf=""
set backupdir=~/.cache/bak
if !has('nvim')
  set viminfo+=n~/.cache/viminfo
endif

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir))
endif
if has('persistent_undo')
  set noudf
  set undodir=~/.cache/undo
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir))
  endif
endif
aug vimwork
  au!
  au BufNewFile,BufRead *.tag setf html
  au BufNewFile,BufRead *.frm setf vb
  au BufNewFile,BufRead *.dcm setf vb
  au BufNewFile,BufRead *.bas setf vb
  au BufNewFile,BufRead *.vue setf html
  au BufNewFile,BufRead *.tpl setf php
  au BufNewFile,BufRead *.inc setf php
  au BufNewFile,BufRead *.ts setf javascript
  " au BufNewFile,BufRead *.php setf html
aug END

source $VIMRUNTIME/macros/matchit.vim

" for linux
set vb t_vb=

filetype plugin indent on
syntax enable
" vim:set ts=2 sw=2 :
