setlocal suffixesadd=.md
" wrap long lines at a character in 'breakat' rather than last character on
" the line, doesn't insert <EOL>s (\n) in file. Not used when wrap is off.
setlocal linebreak
setlocal tw=65
setlocal sw=2
setlocal wrap

set fo-=t

lua require('cmp').setup.buffer { enabled = false }

" end an undo thing every sentence
inoremap <buffer> . .<c-g>u

inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]a

" https://git.peppe.rs/vim/better-text-objs/tree/plugin/better-text-objs.vim
xnoremap <buffer> ix :<C-u>normal vi`<CR>
onoremap <buffer> ix :<C-u>normal vi`<CR>
xnoremap <buffer> ax :<C-u>normal va`<CR>
onoremap <buffer> ax :<C-u>normal va`<CR>

inoremap <buffer> ;d <esc>:let @s=system('date "+%Y-%m-%d"')<cr>a<c-r>s<bs>
inoremap <buffer> ;a \alpha
inoremap <buffer> ;b \beta
inoremap <buffer> ;s \sigma

" for checklists
nnoremap <buffer> <leader>n :g/\[ \]/<cr>
nmap <buffer><expr> <c-f> ToggleChar()

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

" let b:delimitMate_quotes = "\" '"
let b:delimitMate_expand_cr = 2
let b:delimitMate_expand_inside_quotes = 1
let b:delimitMate_expand_space = 0
let b:delimitMate_nesting_quotes = ['`']

" packadd ultisnips

" imap <tab> <c-r>=Tab(1)<cr>
" imap <s-tab> <c-r>=Tab(0)<cr>

" function! Tab(tab) abort
"     if a:tab
"         if UltiSnips#CanJumpForwards() || UltiSnips#CanExpandSnippet()
"             return "\<c-r>=Ultisnips#ExpandSnippetOrJump()\<cr>"
"         elseif pumvisible()
"             return "\<c-n>"
"         endif
"         return "\<tab>"
"     else
"         if UltiSnips#CanJumpBackwards() || UltiSnips#CanExpandSnippet()
"             return "\<c-r>=Ultisnips#ExpandSnippetOrJump()\<cr>"
"         elseif pumvisible()
"             return "\<c-p>"
"         endif
"         return "\<s-tab>"
"     endif
" endfunction
