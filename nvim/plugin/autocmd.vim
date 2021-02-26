augroup LineEnd
    autocmd!
    autocmd ColorScheme * match BackgroundWarning /\%81v/
    autocmd ColorScheme * highlight BackgroundWarning ctermbg=9 guibg=#be5046
augroup END 

augroup FZF
    autocmd!
    autocmd FileType fzf set nonu nornu
    autocmd BufLeave <buffer> set nu rnu
augroup END

