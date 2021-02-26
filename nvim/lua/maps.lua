local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

map('x', '<leader>p', '"_dP', { noremap = true })
map('x', 'y', 'myy`y', { noremap = true })
map('n', '<Up>', '<c-y>', { noremap = true })
map('n', '<Down>', '<c-e>', { noremap = true })
map('n', '\'', '`', { noremap = true })
-- : ;
-- jk <esc>
-- J, K in x to dP, and djp
-- >, < in x to >gv and <gv OR use .
-- Y y$
-- vnoremap * y/<C-R>"<CR>
-- vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
-- noremap <leader>a =ip
-- nnoremap <expr> k      v:count == 0 ? 'gk' : 'k'
-- nnoremap <expr> j      v:count == 0 ? 'gj' : 'j'

-- hacky bc I exploit that my path starts with '.,,'
-- nnoremap <leader>f :call fzf#run(fzf#wrap({'source' : 'getfiles ' . substitute(getcwd() . ',' . expand('%:p:h') . ',' . &path[3:], ',', ' ', 'g')}))<cr><cr>

-- faster ]f and gf mappings
map('n', ']f', ':exec "e " . system("fd -H " . expand("<cfile>") . " " . getcwd() . " | head -n 1")<cr>', { silent = true, noremap = true })
map('n', 'gf', ']f', { silent = true })

map('n', '<leader>r', ':call system(\'ctags -R -o .tags\')<cr>', { noremap = true, silent = true })
map('n', '<leader>b', ':call myfun#Buffers()<cr>', { noremap = true, silent = true })
map('n', '<leader>d', ':call myfun#DiffWithSaved()<cr>', { noremap = true, silent = true })
map('n', '<leader>o', 'filter(range(1, winnr("$")), "getwinvar(v:val, \\"&ft\\") == \\"qf\\"")==[] ? \':cope<cr>\' : \':ccl<cr>\'', { noremap = true, expr = true, silent = true })
map('n', '<leader>p', ":Files<CR>", { silent = true })

map('x', 'ga', '<Plug>(EasyAlign)', {silent = true})
map('n', 'ga', '<Plug>(EasyAlign)', {silent = true})

-- " Neosnippet: mappings
-- imap <expr> <tab> myfun#Tab()
-- smap <tab>     <Plug>(neosnippet_expand_or_jump)
-- xmap <tab>     <Plug>(neosnippet_expand_target)
