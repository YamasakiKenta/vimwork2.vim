if &compatible
    set nocompatible
endif
set rtp^=~/.cache/plugin/dein.vim
call dein#begin(expand('~/.cache/dein'))
call dein#add('Shougo/denite.nvim', {'merged': 0})
call dein#add('Shougo/neomru.vim', {'merged': 0})
call dein#add('Shougo/neosnippet', {'merged': 0})
call dein#add('Shougo/neosnippet-snippets', {'merged': 0})
" call dein#add('Shougo/unite.vim', {'merged': 0})
call dein#add('Shougo/denite.vim', {'merged': 0})
call dein#add('cocopon/vaffle.vim', {'merged': 0})
call dein#add('fuenor/qfixgrep', {'merged': 0})
call dein#add('thinca/vim-qfreplace', {'merged': 0})
call dein#add('thinca/vim-quickrun', {'merged': 0})
call dein#add('tpope/vim-fugitive', {'merged': 0})
call dein#add('mattn/emmet-vim', {'merged': 0})
call dein#add('joonty/vdebug', {
    \ 'disabled': has('python'),
    \ 'merged': 0
    \ })
if dein#tap('vim-quickrun')
    let g:quickrun_config = {
            \ 'cpp' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ 'type': 'c/gcc',
            \ },
            \ 'c' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ 'type': 'c/gcc',
            \ },
            \ 'cs' : {
            \ 'command': 'dmcs',
            \ 'exec': ['%c %o %s -out:%s:p:r.exe', 'mono %s:p:r.exe %a', 'rm -f %s:p:r.exe'],
            \ 'tempfile': '%{tempname()}.cs',
            \ },
            \ 'java' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ },
            \ 'php' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'utf-8',
            \ },
            \ '_' : {
            \ 'hook/time/enable' : 1,
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ 'debug': 'x',
            \ },
            \ 'vb' : {
            \ 'command': 'cscript',
            \ 'cmdopt': '//Nologo',
            \ 'tempfile': '{tempname()}.vbs',
        \ }
    \ }
endif
if dein#tap('qfixgrep')
    let QFixWin_EnableMode = 1
    let g:QFixWin_QuickFixTitleReg = '\cQuickfix'
    let g:QFixWin_LocationListTitleReg = '\cLocation'
endif
if dein#tap('neosnippet')
    let g:neosnippet#snippets_directory = '~/.cache/plugin/vimwork2.vim/snippets'
    imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
endif
if dein#tap('unite.vim')
    let g:unite_enable_start_insert = 1
    nmap <leader>u [unite]
    nnoremap [unite]m :<c-u>Unite neomru/file
    nnoremap [unite]f :<c-u>Unite file_rec
    nnoremap [unite]g :<c-u>Unite file_rec/git
endif
if dein#tap('denite.vim')
    nmap <leader>d [denite]
    nnoremap [denite]m :<c-u>Denite file_mru
    nnoremap [denite]f :<c-u>Denite ffile_rec
    nnoremap [denite]g :<c-u>Denite ffile_rec/git
endif
if dein#tap('emmet-vim')
    let g:user_emmet_settings = {
                \ 'variables': {
                \ 'lang' : 'ja'
                \ }
                \ }
    imap <expr><TAB>
                \ emmet#isExpandable()? emmet#expandAbbrIntelligent("\<tab>")
                \ :"\<TAB>"
endif
if dein#tap('vdebug')
    let g:vdebug_keymap = {
        \ 'run'               : '<F8>',
        \ 'run_to_cursor'     : '<F1>',
        \ 'step_over'         : '<F10>',
        \ 'step_into'         : '<F11>',
        \ 'step_out'          : '<S-F11>',
        \ 'close'             : '<F6>',
        \ 'detach'            : '<F7>',
        \ 'set_breakpoint'    : '<F9>',
        \ 'get_context'       : '<S-F12>',
        \ 'eval_under_cursor' : '<F12>',
    \ }
endif
call dein#end()
filetype plugin indent on
syntax enable
nnoremap <leader>fp<CR> :<C-u>let @+ = expand("%:p")\|echo @+<CR>|"
nnoremap <leader>ft<CR> :<C-u>let @+ = expand("%:t")\|echo @+<CR>|"
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
let g:loaded_netrw = 1 " #netrw必須 1/2
let g:loaded_netrwPlugin = 1 " #netrw必須 2/2
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
" netrw
let g:netrw_liststyle = 3
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
set viminfo+=n~/.cache/viminfo
" set wildmode=longest:full,full
set backupdir=~/.cache/bak
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
