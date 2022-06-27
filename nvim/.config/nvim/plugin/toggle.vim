if exists("loaded_toggle")
    finish
endif
let g:loaded_toggle = 1

nnoremap ]<space> o<esc>k
nnoremap [<space> O<esc>j

" toggle spell
nnoremap yos :setl invspell <bar> set spell?<cr>

" colo dim
nmap <silent> yoc <Plug>(ToggleHighlight)

" showbreak
nnoremap yob :if &showbreak == '++' <bar> set sbr= <bar> else <bar> set sbr=++ <bar> endif<cr>

" adjust current directory
nnoremap yof :lcd %:h<cr>
nnoremap yod :lcd ..<cr>

" toggle backgroundwarning
let g:WarningCol = 0
nmap <silent> yol <Plug>(ToggleWarning)

" toggle relative number
nnoremap <leader><leader> :set invrelativenumber<cr>

" toggle wrap
nnoremap yow :setl invwrap<cr>

" toggle lazyredraw
nnoremap yor :set invlazyredraw<cr>

nnoremap yox :set invcursorline invcursorcolumn<cr>
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
