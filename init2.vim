call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')
" call dein#add('Shougo/neosnippet')
" call dein#add('Shougo/neosnippet-snippets')
" call dein#add('Shougo/unite.vim')
" call dein#add('cocopon/vaffle.vim')
call dein#add('fuenor/qfixgrep')
call dein#add('thinca/vim-qfreplace')
call dein#add('thinca/vim-quickrun')
call dein#add('tpope/vim-fugitive')
call dein#add('mattn/emmet-vim')
call dein#add('vim-scripts/Align')
call dein#add('joonty/vdebug', {
            \ 'disabled': has('python')
            \ })
call dein#end()
call dein#save_state()
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
if dein#tap('denite.nvim')
    nmap <leader>d [denite]
    nnoremap [denite]m :<c-u>Denite file_mru
    nnoremap [denite]f :<c-u>Denite file_rec
    nnoremap [denite]g :<c-u>Denite file_rec/git
    call denite#custom#var('file_rec', 'command',
                \ ['pt', '--follow', '--nocolor', '--nogroup', '-g:', ''])
    call denite#custom#alias('source', 'file_rec/git', 'file_rec')
    call denite#custom#var('file_rec/git', 'command',
                \ ['git', 'ls-files', '-co', '--exclude-standard'])
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
