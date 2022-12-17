vim.cmd([[
onoremap il <cmd>normal vg_o^<cr>
onoremap al <cmd>normal v$o0<cr>

if !exists("textobjs")
    let g:textobjs = ['$', ',', '.', ':', '+', ';', '=', '-', '_', '*', '#', '&', '~']
endif

for c in g:textobjs
    exec 'onoremap i' . c . ' <cmd>call TextObjectsSelectIn("' . c . '")<cr>'
    exec 'xnoremap i' . c . ' <cmd>call TextObjectsSelectIn("' . c . '")<cr>'
    exec 'onoremap a' . c . ' <cmd>call TextObjectsSelectAround("' . c . '")<cr>'
    exec 'xnoremap a' . c . ' <cmd>call TextObjectsSelectAround("' . c . '")<cr>'
endfor

function! TextObjectsSelectIn(char)
    call search('\V' . a:char, 'b', line('.'))
    call search('\V' . a:char . '\.', 'cze', line('.'))
    normal! v
    call search('\V\.' . a:char, 'cz', line('.'))
endfunction

function! TextObjectsSelectAround(char)
    call search('\V' . a:char, 'b', line('.'))
    call search('\V' . a:char, 'cz', line('.'))
    normal! v
    call search('\V' . a:char, 'z', line('.'))
endfunction
]])
