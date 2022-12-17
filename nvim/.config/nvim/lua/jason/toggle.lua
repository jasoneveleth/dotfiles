vim.cmd([[
" toggle spell
nnoremap yos <cmd>setl invspell <bar> set spell?<cr>

" colo dim
nmap <silent> yoc <Plug>(ToggleHighlight)

" showbreak
nnoremap yob <cmd>if &showbreak == '++' <bar> set sbr= <bar> else <bar> set sbr=++ <bar> endif<cr>

" adjust current directory
nnoremap yof <cmd>lcd %:h<cr>
nnoremap yod <cmd>lcd ..<cr>

" toggle backgroundwarning
let g:WarningCol = 0
nmap <silent> yol <Plug>(ToggleWarning)

" toggle relative number
nnoremap <leader><leader> <cmd>set invrelativenumber<cr>

" toggle wrap
nnoremap yow <cmd>setl invwrap<cr>

" toggle lazyredraw
nnoremap yor <cmd>set invlazyredraw<cr>

nnoremap yox <cmd>set invcursorline invcursorcolumn<cr>
" toggle o in format options?? (commenting onto opened line)

nnoremap <silent><expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"


fun! ToggleWarning() abort
    if g:WarningCol == 1
        hi! link WarningCol Normal 
        let g:WarningCol = 0
    else 
        hi! link WarningCol Error
        let g:WarningCol = 1
    endif
endfun
nnoremap <Plug>(ToggleWarning) <cmd>call ToggleWarning()<cr>

fun! ToggleSyntax() abort
    if exists("g:syntax_on") 
        syntax off 
    else 
        syntax enable 
    endif
    TSBufToggle highlight
endfun
nnoremap <Plug>(ToggleHighlight) <cmd>call ToggleSyntax()<cr>
]])
