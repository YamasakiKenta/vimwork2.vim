" [[plugins]]
" repo = 'nathanaelkane/vim-indent-guides'
" on_if = '''
"     has('gui')
" '''
" hook_add ='''
      let g:indent_guides_enable_on_vim_startup=1
      let g:indent_guides_start_level=2
      let g:indent_guides_color_change_percent = 5
      let g:indent_guides_guide_size = 1
" '''
" [[plugins]]
" repo = 'Shougo/dein.vim'
" [[plugins]]
" repo = 'mattn/emmet-vim'
" hook_add = '''
      let g:user_emmet_settings = {
                  \ 'variables': {
                  \ 'lang' : 'ja'
                  \ }
                  \ }
      imap <expr><TAB>
                  \ emmet#isExpandable()? emmet#expandAbbrIntelligent("\<tab>")
                  \ :"\<TAB>"
" '''
" [[plugins]]
" repo = 'Shougo/neosnippet.vim'
" hook_add = '''
      let g:neosnippet#snippets_directory = expand('~/.cache/plugin/vimwork2.vim/snippets')
      imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
" '''
" [[plugins]]
" repo = 'Shougo/neosnippet-snippets'
" on_source = 'neosnippet.vim'
" [[plugins]]
" repo = 'tpope/vim-fugitive'
" [[plugins]]
" repo = 'cespare/vim-toml'
" [[plugins]]
" repo = 'thinca/vim-qfreplace'
" [[plugins]]
" repo = 'fuenor/qfixgrep'
" hook_add = '''
      let QFixWin_EnableMode = 1
      let g:QFixWin_QuickFixTitleReg = '\cQuickfix'
      let g:QFixWin_LocationListTitleReg = '\cLocation'
" '''
" [[plugins]]
" repo = 'thinca/vim-quickrun'
" hook_add = '''
      let g:quickrun_config = {
          \ 'cs' : {
              \ 'hook/output_encode/enable' : 1,
              \ 'hook/output_encode/encoding' : 'sjis',
          \ },
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
" '''
" [[plugins]]
" repo = 'vim-scripts/Align'
" hook_add = '''
      let g:Align_xstrlen = 3
" '''
" [[plugins]]
" repo = 'Shougo/denite.nvim'
" hook_add = '''
      nmap <leader>d [denite]
      nnoremap [denite] :<c-u>Denite
      nnoremap [denite]g :<c-u>Denite file_rec/git
      nnoremap [denite]j :<c-u>Denite jump
      nnoremap [denite]m :<c-u>Denite buffer file_old_win
      call denite#custom#var('file_rec/git', 'command',
                  \ ['git', 'ls-files', '-co', '--exclude-standard'])
      call denite#custom#alias('source', 'file_rec/git', 'file_rec')
      call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
      call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
" '''
" [[plugins]]
" repo = 'cocopon/vaffle.vim'
" [[plugins]]
" repo = 'cocopon/iceberg.vim'
