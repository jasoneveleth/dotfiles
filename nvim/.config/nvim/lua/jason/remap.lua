local function bind(op, outer_ops)
    outer_ops = outer_ops or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_ops,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

map = bind({"n", "v", "o"}, {noremap = false})
nnoremap = bind("n", {silent = true})
vnoremap = bind("v")
xnoremap = bind("x")
inoremap = bind("i")
tnoremap = bind("t")
noremap = bind({"n", "v", "o"})
icnoremap = bind({"i", "c"})
anoremap = bind({"n", "v", "o", "i", "c"})

noremap("U", "<c-r>")
noremap("<s-cr>", "<nop>")
noremap("<c-j>", "<cmd>cnext<cr>")
noremap("<c-k>", "<cmd>cprevious<cr>")
noremap("<cr>", "<cmd>update<cr>")
noremap("ga", "<c-^>")
noremap("<a-o>", "o<esc>k")
noremap("<a-O>", "O<esc>j")
noremap("gh", "^")
noremap("gl", "$")
noremap("<ScrollWheelUp>", "<C-Y>")
noremap("<ScrollWheelDown>", "<C-E>")
noremap("<S-ScrollWheelUp>", "<C-U>")
noremap("<S-ScrollWheelDown>", "<C-D>")
noremap("<ScrollWheelRight>", "zl")
noremap("<ScrollWheelLeft>", "zh")

xnoremap("*", "y/\\V<C-R>\"<CR>")
xnoremap(">", ">gv")
xnoremap("<", "<gv")

inoremap("<esc>", "<esc>")
inoremap("<c-c>", "<esc>")
inoremap("<c-s>", "<c-a>")
icnoremap("<c-a>", "<home>")
icnoremap("<c-e>", "<end>")

anoremap("<a-h>", "<c-w>h")
anoremap("<a-l>", "<c-w>l")
anoremap("<a-j>", "<c-w>j")
anoremap("<a-k>", "<c-w>k")

tnoremap("<a-h>", "<c-\\><c-n><c-w>h")
tnoremap("<a-l>", "<c-\\><c-n><c-w>l")
tnoremap("<a-j>", "<c-\\><c-n><c-w>j")
tnoremap("<a-k>", "<c-\\><c-n><c-w>k")
tnoremap("<C-Space>", "<C-\\><C-n>")

map("p", "<Plug>(miniyank-autoput)")
map("P", "<Plug>(miniyank-autoPut)")
map("<c-s-n>", "<Plug>(miniyank-cycleback)")
map("<c-n>", "<Plug>(miniyank-cycle)")
map("<leader>yc", "<Plug>(miniyank-tochar)")
map("<leader>yl", "<Plug>(miniyank-toline)")
map("<leader>yb", "<Plug>(miniyank-toblock)")

-- window stuff
nnoremap("<leader>ww", "<C-w><bar>")
nnoremap("<leader>wt", "<C-w>_")
nnoremap("<leader>wm", "<C-w><bar><C-w>_")
nnoremap("<leader>we", "<C-w>=")
nnoremap("<leader>wf", "<cmd>close<cr>")
nnoremap("<leader>wk", "<cmd>Sayonara!<cr>")
nnoremap("<leader>wj", "<cmd>Sayonara!<cr><c-\\><c-n><cmd>close<cr>")
noremap("<s-up>", "<C-W>+")
noremap("<s-down>", "<C-W>-")
noremap("<s-left>", "<C-W>>")
noremap("<s-right>", "<C-W><")

nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
nnoremap("gr", "<cmd>lua vim.lsp.buf.rename()<cr>")
nnoremap("gR", "<cmd>lua vim.lsp.buf.references()<cr>")
nnoremap("gx", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>")
nnoremap("gX", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr> ")
inoremap("<c-k>", "<c-o><cmd>lua vim.lsp.buf.signature_help()<CR>")
nnoremap("<leader>gq", "<cmd>lua vim.lsp.buf.formatting()<CR>")
nnoremap("K :lua", "vim.lsp.buf.hover()<cr>")
nnoremap("g]", "<cmd>lua vim.lsp.buf.implementation()<cr>")
-- nnoremap("gDt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
-- nnoremap("", "<cmd>lua vim.lsp.buf.code_action()<cr>")

nnoremap("<leader>u", "<cmd>UndotreeToggle<cr>")
nnoremap("<c-p>", "<cmd>Files<cr>")
nnoremap("<c-m>", "<cmd>History<cr>")
nnoremap("<c-g>", "<cmd>RgRegex<cr>")
nnoremap("<c-b>", "<cmd>Buffers<cr>")
nnoremap("<leader>e", "<cmd>exec 'e ~/.config/nvim/after/ftplugin/' . &ft . '.vim'<cr>")

-- maps for neovide
noremap("<d-0>", "<cmd>set guifont=Hack:h14<cr>")
noremap("<d-->", "<cmd>set guifont=Hack:h14<cr>")
noremap("<d-=>", "<cmd>set guifont=Hack:h22<cr>")
tnoremap("<d-v>", "<c-\\><c-n>pa")
icnoremap("<d-v>", "<c-r>+")

vim.keymap.set("n", "k", function() 
        return vim.v.count == 0 and "gk" or 'm`' .. vim.v.count .. 'k'
    end, {noremap = true, expr = true})

vim.keymap.set("n", "j", function() 
        return vim.v.count == 0 and "gj" or 'm`' .. vim.v.count .. 'j'
    end, {noremap = true, expr = true})

