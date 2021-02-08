setlocal sw=2
setlocal conceallevel=1
setlocal spell
setlocal makeprg=maketex\ %

inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
" inoremap <c-f> <c-g>u<esc>lBi$<esc>:undoj<CR>Ea$
inoremap <c-f> <c-g>u$<space><esc>Bi$<esc>:undoj<cr>f$a
" other candidates for insert ctrl B
let g:vimtex_indent_enabled = 1

" visual and operator-pending
xnoremap <buffer>i$ :<C-u>silent normal! lT$vt$<CR>
onoremap <buffer>i$ :silent normal vi$<CR>
xnoremap <buffer>a$ :<C-u>silent normal! lF$vf$<CR>
onoremap <buffer>a$ :silent normal va$<CR>
xnoremap <buffer>i& :<C-u>silent normal! lF&vf&<CR>
onoremap <buffer>i& :silent normal va&<CR>
xnoremap <buffer>a& :<C-u>silent normal! lF&vf&<CR>
onoremap <buffer>a& :silent normal va&<CR>
" inoremap <buffer>/ <c-g>u<esc>:call FancyFrac()<CR>

function! FancyFrac() abort
    let current_line = getline('.')
    let substr = strpart(current_line, -1, col('.')+1)
    let word_till_cursor = matchstr(substr, "[^ \t]*$")
    if word_till_cursor != ''
        if !setline(".", substitute(current_line, "\\<".word_till_cursor."\\>", '\\frac{'.word_till_cursor."}{} <`0`>", ""))
            call feedkeys('8la', 'n')
            return
        endif
    endif
    call feedkeys('a/', 'n')
endfunction

" function! Math()
"     return get(reverse(map(synstack(line('.'), col('.')), {i,v -> synIDattr(v, 'name')})), 0, '') =~# 'texMathZone\%(X\|Y\|V\)'
" endfunction

" Filesystem: edit /usr/local/Cellar/neovim/0.4.4/share/nvim/runtime/syntax/tex.vim
" so that call `TexNewMathZone("E","align",1)` is in the right place

" inoremap <silent> <tab> <c-\><c-o>:call myfunctions#Search('<++>')<cr>
" nnoremap <tab> /<++><CR>:noh<CR>c4l
" inoremap ( ()<++><left><left><left><left><left>
" nnoremap <CR> :update<CR>:make<CR>
" inoremap $ $$<++><left><left><left><left><left>
