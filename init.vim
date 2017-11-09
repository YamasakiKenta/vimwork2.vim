" dein
let s:dein_repo_dir = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim')
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
exec 'set rtp+=' . s:dein_repo_dir
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml(expand('~/.cache/plugin/vimwork2.vim/dein.toml'), {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

" not dein
nnoremap <leader>fp :<C-u>let @+ = expand("%:p")\|echo @+|"
nnoremap <leader>fg :<C-u>let @+ = getcwd()\|echo @+|"
nnoremap <S-Space> za|"
nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|"
nnoremap <C-n> :<C-u>cn<CR>:e<cr>|"
nnoremap <C-p> :<C-u>cN<CR>:e<cr>|"
nnoremap <C-j> j.|"
nnoremap <C-k> n.|"
nnoremap * :<C-u>set hls<CR>:let @/ = '\<'.expand("<cword>").'\>'\|echo @/<CR>|"
nnoremap + :<C-u>AddSearch <C-r>=expand("<cword>")<CR><CR>:echo @/<CR>|"
vnoremap < <gv|"
vnoremap > >gv|"
nnoremap go yypC
nnoremap gO yyPC
vnoremap / "ay/<c-r>a<cr><c-o>|"
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
nnoremap <a-up> [c
nnoremap <a-down> ]c
nnoremap <f5> :diffupdate<cr>

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
set tabstop=4
set shiftwidth=4
set expandtab
set list lcs=tab:.\ |
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
aug END

function! SetGUI()
    set nocursorline
    set enc=utf-8
    set go-=T
    set go-=m
    set guifontwide=MS_Gothic:h10
    set guifont=VL_ゴシック:h10:cSHIFTJIS
    nnoremap <A-Space> :<C-u>simalt ~<CR>|"
    "colo hybrid
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
    set vb t_vb=
endfunction

source $VIMRUNTIME/macros/matchit.vim

filetype plugin indent on
syntax enable
