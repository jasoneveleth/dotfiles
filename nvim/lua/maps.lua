local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

map('n', '<leader>r', ':call system(\'ctags -R -o .tags\')<cr>', { noremap = true, silent = true })
map('x', '<leader>p', '"_dP', { noremap = true })
map('x', 'y', 'myy`y', { noremap = true })
map('n', '<Up>', '<c-y>', { noremap = true })
map('n', '<Down>', '<c-e>', { noremap = true })
map('n', '\'', '`', { noremap = true })

map('n', '<leader>g', ':grep<space>', {noremap = true})
map('n', '<leader>b', ':call myfun#Buffers()<cr>', { noremap = true, silent = true })
map('n', '<leader>d', ':call myfun#DiffWithSaved()<cr>', { noremap = true, silent = true })
map('n', '<leader>o', 'filter(range(1, winnr(\'$\')), getwinvar(v:val, "&ft") == "qf")==[] ? \':cope<cr>\' : \':ccl<cr>\'', { noremap = true, silent = true })
-- hacky bc I exploit that my path starts with '.,,'
-- https://github.com/junegunn/fzf/blob/master/README-VIM.md
map('n', '<leader>f', ':call fzf#run(fzf#wrap({\'source\' : \'getfiles \' . substitute(getcwd() . \',\' . expand(\'%:p:h\') . \',\' . &path[3:], \',\', \' \', \'g\')}))<cr><cr>', { noremap = true, silent = true })

