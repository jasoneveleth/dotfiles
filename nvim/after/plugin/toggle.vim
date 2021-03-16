" toggle spell
nnoremap yos :set invspell <bar> set spell?<cr>

" colo dim
nnoremap yoc :syn on <bar> colorscheme dim<cr>

" showbreak
nnoremap yob :if &showbreak == '++' <bar> set sbr= <bar> else <bar> set sbr=++ <bar> endif<cr>

" adjust current directory
nnoremap yod :cd %:h<cr>

" toggle backgroundwarning
nnoremap yol :hi! link BackgroundWarning Normal<cr>

" toggle o in format options?? (commenting onto opened line)
