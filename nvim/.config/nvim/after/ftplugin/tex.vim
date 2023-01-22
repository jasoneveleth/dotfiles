setlocal sw=2
" setlocal conceallevel=1
setlocal linebreak
setlocal makeprg=latex-compile\ %

inoremap <buffer> . .<c-g>u
inoremap <c-b> <c-g>u\textbf{}<left>
inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]a
nnoremap <buffer> <leader>s :e ~/.config/nvim/LuaSnip/tex.lua<cr>

nnoremap <buffer> <leader>g :call texcount#Texcount()<cr>
" imap <tab> <c-r>=Tab(1)<cr>
" imap <s-tab> <c-r>=Tab(0)<cr>

" function! Tab(tab) abort
"     if a:tab
"         if UltiSnips#CanJumpForwards() || UltiSnips#CanExpandSnippet()
"             return "\<c-r>=UltiSnips#ExpandSnippetOrJump()\<cr>"
"         elseif pumvisible()
"             return "\<c-n>"
"         endif
"         return "\<tab>"
"     else
"         if UltiSnips#CanJumpBackwards() || UltiSnips#CanExpandSnippet()
"             return "\<c-r>=UltiSnips#ExpandSnippetOrJump()\<cr>"
"         elseif pumvisible()
"             return "\<c-p>"
"         endif
"         return "\<s-tab>"
"     endif
" endfunction
