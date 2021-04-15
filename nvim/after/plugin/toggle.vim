" toggle spell
nnoremap yos :set invspell <bar> set spell?<cr>

" colo dim
nmap <silent> yoc <Plug>(ToggleHighlight)

" showbreak
nnoremap yob :if &showbreak == '++' <bar> set sbr= <bar> else <bar> set sbr=++ <bar> endif<cr>

" adjust current directory
nnoremap yod :cd %:h<cr>

" toggle backgroundwarning
let g:WarningCol = 0
nmap <silent> yol <Plug>(ToggleWarning)

" toggle o in format options?? (commenting onto opened line)




fun! s:ToggleWarning() abort
    if g:WarningCol == 1
        hi! link WarningCol Normal 
        let g:WarningCol = 0
    else 
        hi! link WarningCol Error
        let g:WarningCol = 1
    endif
endfun
nnoremap <Plug>(ToggleWarning) :call <SID>ToggleWarning()<cr>

fun! s:ToggleSyntax() abort
    if exists("g:syntax_on") 
        syntax off 
    else 
        syntax enable 
    endif
    TSBufToggle highlight
endfun
nnoremap <Plug>(ToggleHighlight) :call <SID>ToggleSyntax()<cr>
