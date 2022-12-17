vim.cmd([[
augroup Statusline
    autocmd!
    autocmd ColorScheme * Statusline
augroup END

augroup Cursorline
  autocmd!
  autocmd WinEnter,TabEnter,BufWinEnter * set cursorline
  autocmd WinLeave,TabLeave * set nocursorline
augroup END

augroup Startify
    autocmd!
    autocmd User Startified unmap <buffer> e
    autocmd User Startified nmap <buffer> e <plug>(startify-open-buffers)
    autocmd User StartifyReady set laststatus=0
    autocmd BufEnter * set laststatus=2
augroup END

augroup Term
    autocmd!
    autocmd TermOpen,BufEnter term://* startinsert
    autocmd TermOpen * setlocal nonu nornu listchars= signcolumn=no scrolloff=0
    autocmd TermClose * if &ft!="fzf"|call feedkeys("\<cr>")|endif
augroup END

augroup Yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup FZF
    autocmd!
    autocmd FileType fzf setlocal nonu nornu
augroup END

augroup Autocomment
    autocmd!
    " don't insert comment leader after 'o'
    autocmd BufEnter * set formatoptions-=o
augroup END

augroup cfiles
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

augroup restore_cursor
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'gitcommit' && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif
augroup END
]])
