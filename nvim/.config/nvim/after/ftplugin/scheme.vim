setlocal makeprg=racket\ %
setlocal signcolumn=yes

nmap <buffer> g) ysi))

augroup targets
    autocmd!
    autocmd BufEnter *.rkt let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'
    autocmd BufLeave *.rkt let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB Ab AB rb al rB Al bb aa bB Aa BB AA'
augroup END

let b:delimitMate_quotes = "\""
