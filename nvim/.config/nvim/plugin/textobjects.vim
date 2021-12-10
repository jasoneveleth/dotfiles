if exists("loaded_textobjects")
    finish
endif
let g:loaded_textobjects = 1

onoremap il :normal vg_o^<cr>
onoremap al :normal v$o0<cr>

if !exists("textobjs")
    let g:textobjs = ['$', ',', '.', ':', '+', ';', '=', '-', '_', '*', '#', '&', '~']
endif

for c in g:textobjs
    exec 'onoremap i' . c . ' :call <sid>select_in("' . c . '")<cr>'
    exec 'xnoremap i' . c . ' :call <sid>select_in("' . c . '")<cr>'
    exec 'onoremap a' . c . ' :call <sid>select_around("' . c . '")<cr>'
    exec 'xnoremap a' . c . ' :call <sid>select_around("' . c . '")<cr>'
endfor

function! s:select_in(char)
    call search('\V' . a:char, 'b', line('.'))
    call search('\V' . a:char . '\.', 'cze', line('.'))
    normal! v
    call search('\V\.' . a:char, 'cz', line('.'))
endfunction

function! s:select_around(char)
    call search('\V' . a:char, 'b', line('.'))
    call search('\V' . a:char, 'cz', line('.'))
    normal! v
    call search('\V' . a:char, 'z', line('.'))
endfunction
