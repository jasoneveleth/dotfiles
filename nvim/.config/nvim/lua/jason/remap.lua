local nvo = {"n", "v", "o"}
local x = "x"
local i = "i"
local ic = {"i", "c"}
local a = {"n", "v", "o", "i", "c"}
local t = "t"
local n = "n"

vim.keymap.set(nvo, "U", "<c-r>")
vim.keymap.set(nvo, "<s-cr>", "<nop>")
vim.keymap.set(nvo, "<c-q>", "<cmd>q<cr>")
vim.keymap.set(nvo, "<c-j>", "<cmd>cnext<cr>")
vim.keymap.set(nvo, "<c-k>", "<cmd>cprevious<cr>")
vim.keymap.set(nvo, "<cr>", "<cmd>update<cr>")
vim.keymap.set(nvo, "ga", "<c-^>", {desc = "alt file"})
vim.keymap.set(nvo, "<a-o>", "o<esc>k")
vim.keymap.set(nvo, "<a-O>", "O<esc>j")
vim.keymap.set(nvo, "gh", "^", {desc = "begin of line"})
vim.keymap.set(nvo, "gl", "$", {desc = "end of line"})
vim.keymap.set(nvo, "g.", "`.", {desc = "last edit"})
vim.keymap.set(nvo, "<ScrollWheelUp>", "<C-Y>")
vim.keymap.set(nvo, "<ScrollWheelDown>", "<C-E>")
vim.keymap.set(nvo, "<S-ScrollWheelUp>", "<C-U>")
vim.keymap.set(nvo, "<S-ScrollWheelDown>", "<C-D>")
vim.keymap.set(nvo, "<ScrollWheelRight>", "zl")
vim.keymap.set(nvo, "<ScrollWheelLeft>", "zh")

vim.keymap.set(x, "*", "y/\\V<C-R>\"<CR>")
vim.keymap.set(x, ">", ">gv")
vim.keymap.set(x, "<", "<gv")

vim.keymap.set(i, "<esc>", "<esc>")
vim.keymap.set(i, "<c-c>", "<esc>")
vim.keymap.set(i, "<c-s>", "<c-a>")
vim.keymap.set(i, "<M-BS>", "<c-w>")
vim.keymap.set(ic, "<c-a>", "<home>")
vim.keymap.set(ic, "<c-e>", "<end>")

vim.keymap.set(a, "<a-h>", "<c-w>h")
vim.keymap.set(a, "<a-l>", "<c-w>l")
vim.keymap.set(a, "<a-j>", "<c-w>j")
vim.keymap.set(a, "<a-k>", "<c-w>k")

vim.keymap.set(t, "<a-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set(t, "<a-l>", "<c-\\><c-n><c-w>l")
vim.keymap.set(t, "<a-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set(t, "<a-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set(t, "<C-Space>", "<C-\\><C-n>")

vim.keymap.set(nvo, "f", "<Plug>Sneak_s", {noremap = false})
vim.keymap.set(nvo, "F", "<Plug>Sneak_S", {noremap = false})

vim.keymap.set(nvo, "p", "<Plug>(miniyank-autoput)", {noremap = false})
vim.keymap.set(nvo, "P", "<Plug>(miniyank-autoPut)", {noremap = false})
vim.keymap.set(nvo, "<c-s-n>", "<Plug>(miniyank-cycleback)", {noremap = false}, {desc = "yankring cycle back"})
vim.keymap.set(nvo, "<c-n>", "<Plug>(miniyank-cycle)", {noremap = false}, {desc = "yankring cycle"})
vim.keymap.set(nvo, "<leader>yc", "<Plug>(miniyank-tochar)", {noremap = false}, {desc = "to char"})
vim.keymap.set(nvo, "<leader>yl", "<Plug>(miniyank-toline)", {noremap = false}, {desc = "to line"})
vim.keymap.set(nvo, "<leader>yb", "<Plug>(miniyank-toblock)", {noremap = false}, {desc = "to block"})

-- window stuff
vim.keymap.set(n, "<leader>ww", "<C-w><bar>")
vim.keymap.set(n, "<leader>wt", "<C-w>_")
vim.keymap.set(n, "<leader>wm", "<C-w><bar><C-w>_")
vim.keymap.set(n, "<leader>we", "<C-w>=")
vim.keymap.set(n, "<leader>wf", "<cmd>close<cr>")
vim.keymap.set(n, "<leader>wk", "<cmd>Sayonara!<cr>")
vim.keymap.set(n, "<leader>wj", "<cmd>Sayonara!<cr><c-\\><c-n><cmd>close<cr>")
vim.keymap.set(nvo, "<s-up>", "<C-W>+")
vim.keymap.set(nvo, "<s-down>", "<C-W>-")
vim.keymap.set(nvo, "<s-left>", "<C-W>>")
vim.keymap.set(nvo, "<s-right>", "<C-W><")

vim.keymap.set(n, "g]", "<cmd>lua vim.lsp.buf.implementation()<cr>")
vim.keymap.set(n, "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set(n, "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set(n, "gr", "<cmd>lua vim.lsp.buf.rename()<cr>")
vim.keymap.set(n, "gR", "<cmd>lua vim.lsp.buf.references()<cr>")
vim.keymap.set(n, "gx", "<cmd>lua vim.diagnostic.goto_next()<cr>")
vim.keymap.set(n, "gX", "<cmd>lua vim.diagnostic.goto_prev()<cr> ")
vim.keymap.set(n, "gqq", "<cmd>lua vim.lsp.buf.formatting()<CR>")
vim.keymap.set(n, "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
vim.keymap.set(n, '<leader>ca', "<cmd>lua vim.lsp.buf.code_action({apply=true})<cr>")
vim.keymap.set(n, "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
-- vim.keymap.set(n, "", "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set("i", "<c-k>", "<c-o><cmd>lua vim.lsp.buf.signature_help()<CR>")

vim.keymap.set(n, "<leader>u", "<cmd>UndotreeToggle<cr>")
vim.keymap.set(n, "<c-p>", "<cmd>lua require('fzf-lua').files()<cr>")
vim.keymap.set(n, "<c-m>", "<cmd>lua require('fzf-lua').oldfiles()<cr>")
vim.keymap.set(n, "<c-g>", "<cmd>lua require('fzf-lua').grep()<cr>")
-- vim.keymap.set(n, "<c-g>", "<cmd>lua require('fzf-lua').live_grep()<cr>")
vim.keymap.set(n, "<c-w>", "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<cr>")
vim.keymap.set(n, "<c-b>", "<cmd>lua require('fzf-lua').buffers()<cr>")
vim.keymap.set(n, "<leader>e", "<cmd>exec 'e ~/.config/nvim/after/ftplugin/' . &ft . '.vim'<cr>", {desc = "edit ftplugin file"})
vim.keymap.set(n, "<leader>g", "<cmd>Neogit<cr>")
vim.keymap.set(n, "<leader>n", "<cmd>Noice<cr>")
vim.keymap.set(n, "<leader>m", "<cmd>AsyncRun make<cr>")

-- maps for neovide
vim.keymap.set(nvo, "<d-0>", "<cmd>set guifont=Hack:h14<cr>")
vim.keymap.set(nvo, "<d-->", "<cmd>set guifont=Hack:h14<cr>")
vim.keymap.set(nvo, "<d-=>", "<cmd>set guifont=Hack:h22<cr>")
vim.keymap.set(t, "<d-v>", "<c-\\><c-n>pa")
vim.keymap.set(ic, "<d-v>", "<c-r>+")

vim.keymap.set("n", "k", function() 
        return vim.v.count == 0 and "gk" or 'm`' .. vim.v.count .. 'k'
    end, {noremap = true, expr = true})

vim.keymap.set("n", "j", function() 
        return vim.v.count == 0 and "gj" or 'm`' .. vim.v.count .. 'j'
    end, {noremap = true, expr = true})

