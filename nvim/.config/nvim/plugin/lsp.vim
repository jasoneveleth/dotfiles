if exists("loaded_lsp_settings") || !has('nvim')
    finish
endif
let g:loaded_lsp_settings = 1

lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.racket_langserver.setup{}
lua <<EOF
require('lean').setup{
  abbreviations = { builtin = true },
  lsp = { on_attach = on_attach },
  lsp3 = { on_attach = on_attach },
  mappings = true,
}
EOF
lua require'lspconfig'.lean3ls.setup{}
