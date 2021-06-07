setlocal suffixesadd+=.md

nnoremap <local> <cr> gf
nnoremap <local> <bs> <c-o>
nnoremap <local> <s-bs> <c-i>
nnoremap <local><silent> <tab> :set nohls<cr>/\[\[\zs[a-zA-Z]\+\ze\]\]/<cr>:set hls<cr>
nnoremap <local><silent> <s-tab> :set nohls<cr>?\[\[\zs[a-zA-Z]\+\ze\]\]?<cr>:set hls<cr>
