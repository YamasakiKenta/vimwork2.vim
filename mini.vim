set number
set nobackup
function! MiniRepo(repo)
    let repo_dir = expand('~/.cache/plugin/'.a:repo)
    if !isdirectory(repo_dir)
        call system('git clone https://github.com/'.a:repo.' '.repo_dir)
    endif
    let &rtp=&rtp.','.repo_dir
endfunction
call MiniRepo('mattn/emmet-vim.git')
