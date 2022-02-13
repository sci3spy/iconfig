augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{timeout=300}
augroup END

augroup setSpelling
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

augroup setIndentation
    autocmd FileType html setlocal sw=2 ts=2 sts=2
    autocmd FileType css  setlocal sw=2 ts=2 sts=2
    autocmd FileType lua  setlocal sw=2 ts=2 sts=2
augroup END

augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
augroup end
