setlocal sw=2
" setlocal conceallevel=1
setlocal linebreak
setlocal makeprg=latexmk\ %

inoremap <buffer> . .<c-g>u
inoremap <buffer> <C-s> <c-g>u<Esc>[s1z=`]a
inoremap <buffer> <c-f> <c-g>u$<space><esc>Bi$<esc>:undoj<cr>f$a

nnoremap <buffer> <leader>g :call texcount#Texcount()<cr>

function! Math()
    let syntax_list = synstack(line('.'), col('.')-1)
    let mapped_list = map(syntax_list, {i,v -> synIDattr(v, 'name')})
    let innermost_syn = get(reverse(mapped_list), 0, '')
    " ^^ defaults to an empty string
    echo mapped_list
    return innermost_syn =~# 'texMathZone\(W\|X\|Y\|V\)'
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
inoremap <expr>Z Snippet("Z", " ZZ", "\mathbb{Z}", 1)
inoremap <expr>R Snippet("R", " RR", "\mathbb{R}", 1)
inoremap <expr>n Snippet("n", " inn", "\in", 1)
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
" QQ, OO, nnn, uuu, UU, NN, Nn, notin, cc, EE, AA


" Filesystem: edit /usr/local/Cellar/neovim/0.4.4/share/nvim/runtime/syntax/tex.vim
" so that call `TexNewMathZone("E","align",1)` is in the right place
