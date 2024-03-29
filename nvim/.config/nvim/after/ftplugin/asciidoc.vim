setlocal suffixesadd=.adoc
" wrap long lines at a character in 'breakat' rather than last character on
" the line, doesn't insert <EOL>s (\n) in file. Not used when wrap is off.
setlocal linebreak
set tw=65
set sw=2

" end an undo thing every sentence
inoremap <buffer> . .<c-g>u

inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]a

" https://git.peppe.rs/vim/better-text-objs/tree/plugin/better-text-objs.vim
" xnoremap <buffer> ix :<C-u>normal vi`<CR>
" onoremap <buffer> ix :<C-u>normal vi`<CR>
" xnoremap <buffer> ax :<C-u>normal va`<CR>
" onoremap <buffer> ax :<C-u>normal va`<CR>

inoremap <buffer> ;d <esc>:let @s=system('date "+%Y-%m-%d"')<cr>a<c-r>s<bs>

" for checklists
nnoremap <buffer> <leader>n :g/\[ \]/<cr>
nmap <buffer><expr> <c-g> ToggleChar()

" for checklists
function! ToggleChar() abort
    let line = getline('.') 
    if line =~ '\s*- \[x\]'
        return '0f[lr j'
    elseif line =~ '\s*- \[ \]'
        return '0f[lrxj'
    else
        echoerr 'not a valid line: `' . line . '`'
    endif
endfunction
