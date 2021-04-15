setlocal sw=2
setlocal conceallevel=1
setlocal linebreak
setlocal makeprg=maketex\ %

inoremap <buffer> <C-s> <c-g>u<Esc>[s1z=`]a
inoremap <buffer> <c-f> <c-g>u$<space><esc>Bi$<esc>:undoj<cr>f$a
" let g:vimtex_indent_enabled = 1

" visual and operator-pending
" xnoremap <buffer>i$ :<C-u>silent normal! lT$vt$<CR>
" onoremap <buffer>i$ :silent normal vi$<CR>
" xnoremap <buffer>a$ :<C-u>silent normal! lF$vf$<CR>
" onoremap <buffer>a$ :silent normal va$<CR>
" xnoremap <buffer>i& :<C-u>silent normal! lF&vf&<CR>
" onoremap <buffer>i& :silent normal va&<CR>
" xnoremap <buffer>a& :<C-u>silent normal! lF&vf&<CR>
" onoremap <buffer>a& :silent normal va&<CR>

" inoremap <buffer>/ <c-g>u<esc>:call FancyFrac()<CR>

" function! FancyFrac() abort
"     let current_line = getline('.')
"     let substr = strpart(current_line, -1, col('.')+1)
"     let word_till_cursor = matchstr(substr, "[^ \t]*$")
"     if word_till_cursor != ''
"         if !setline(".", substitute(current_line, "\\<".word_till_cursor."\\>", '\\frac{'.word_till_cursor."}{} <`0`>", ""))
"             call feedkeys('8la', 'n')
"             return
"         endif
"     endif
"     call feedkeys('a/', 'n')
" endfunction

function! Math()
    return get(reverse(map(synstack(line('.'), col('.')), {i,v -> synIDattr(v, 'name')})), 0, '') =~# 'texMathZone\%(w\|X\|Y\|V\)'
endfunction


function! Snippet(char, old, new, mathmode)
    " if a:mathmode && !vimtex#syntax#in_mathzone()
    if a:mathmode && !Math()
        return a:char
    endif
    let col = col('.')
    if getline('.')[col - len(a:old):col-1] . a:char == a:old
        " return a:char ."\<c-g>u\<c-o>d?" . a:old . "\<cr>" . a:new
        return a:char ."\<c-g>u \<c-o>d?" . a:old . "\<cr>\<bs>" . a:new
    else
        return a:char
    endif
endfunction

inoremap <expr>f Snippet("f", " iff", " \\iff", 1)
inoremap <expr>k Snippet("k", " mk", " $$\<left>", 0)
inoremap <expr>m Snippet("m", " dm", " \\[\<cr>\\]\<esc>O", 0)
inoremap <expr>d Snippet("d", "td", "^{}\<left>", 1)
inoremap <expr>r Snippet("r", "sr", "^2", 1)
inoremap <expr>_ Snippet("_", "__", "_{}\<left>", 1)
inoremap <expr>t Snippet("t", "tt", "\\text{}\<left>", 1)
inoremap <expr>* Snippet("*", "**", "\\cdot", 1)
inoremap <expr>x Snippet("x", "xx", "\\times", 1)
inoremap <expr>> Snippet(">", "->", "\\to", 1)
inoremap <expr>s Snippet("s", "invs", "^{-1}", 1)
" inoremap <expr>= Snippet("=", " ==", " &= $1 \\\\", 1)
" inoremap <expr>y Snippet("y", " ooo", " \\infty", 1)
" " auto subscript for numbers (_\d and _{\d})
" " neosnippet: begin, ali, sum, lim, prod, derivatives

" set
" mapsto
" setminus
" <=, >=, !=, 
" phi
" mod
" ZZ, QQ, RR, OO, nnn, uuu, UU, NN, Nn, inn, notin, cc, EE, AA


" Filesystem: edit /usr/local/Cellar/neovim/0.4.4/share/nvim/runtime/syntax/tex.vim
" so that call `TexNewMathZone("E","align",1)` is in the right place

" inoremap <silent> <tab> <c-\><c-o>:call myfunctions#Search('<++>')<cr>
" nnoremap <tab> /<++><CR>:noh<CR>c4l
" inoremap ( ()<++><left><left><left><left><left>
" nnoremap <CR> :update<CR>:make<CR>
" inoremap $ $$<++><left><left><left><left><left>
