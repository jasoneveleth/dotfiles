setlocal commentstring=//\ %s
setlocal signcolumn=yes
let g:completion_trigger_character = ['.']
set tags+=$HOME/.cache/nvim/systags
if has('macunix')
set path=.,/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include,/usr/local/include,/Users/jason/code/c/include,**,
endif
set tw=80
" vim runtime fucks with this
set fo=rcqnlj

nnoremap <expr> gs expand('%:e') == 'h' ? ':e %:r.c<cr>' : ':e %:r.h<cr>'
