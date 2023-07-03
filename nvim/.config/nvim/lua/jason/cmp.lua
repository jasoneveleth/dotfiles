local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-l>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                feedkey("<C-n>", "n")
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {
                "i",
            }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                feedkey("<C-p>", "n")
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {
                "i",
            }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5},
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
    { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
mapping = cmp.mapping.preset.cmdline(),
sources = {
    { name = 'buffer', keyword_length = 5 }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
    { name = 'path' }
}, {
    { name = 'cmdline' }
})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup({capabilities = capabilities})
require('lspconfig').tsserver.setup({capabilities = capabilities})
require('lspconfig').racket_langserver.setup({capabilities = capabilities})
require('lspconfig').pyright.setup({capabilities = capabilities})
require('lspconfig').rust_analyzer.setup({capabilities = capabilities})
require('lspconfig').texlab.setup({capabilities = capabilities})
vim.lsp.set_log_level('debug')

-- this is how you change pyright path
-- pyright = {}
-- pyright.settings = {}
-- pyright.settings.python = {}
-- pyright.settings.python.pythonPath = "/opt/homebrew/Caskroom/miniforge/base/envs/tensorflow/bin/python"
-- require'lspconfig'.pyright.setup{}

require('lspconfig').julials.setup({
    cmd = { "julia", "--startup-file=no", "--history-file=no", "-e", [[
    # tries to find packages (on DEPOT_PATH), and uses fallback ~/.config
    ls_install_path = joinpath(get(DEPOT_PATH, 1, joinpath(homedir(), ".config")), "julia", "environments", "nvim-lspconfig")
    pushfirst!(LOAD_PATH, ls_install_path)
    using LanguageServer
    popfirst!(LOAD_PATH)
    depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
    ## 1. Uses JULIA_PROJECT if exists
    ## 2. Look for a Project.toml file in the current working directory,
    ##    or parent directories, with $HOME as an upper boundary
    ## 3. First entry in the load path
    ## 4. Fallback to default global environment,
    ##    this is more or less unreachable
    project_path = dirname(something(
        Base.load_path_expand((p = get(ENV, "JULIA_PROJECT", nothing); p === nothing ? nothing : isempty(p) ? nothing : p)),
        Base.current_project(),
        get(Base.load_path(), 1, nothing),
        Base.load_path_expand("@v#.#"),
        ))
    @info "Running language server" VERSION pwd() project_path depot_path
    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
    server.runlinter = true
    run(server)
]] },
    capabilities = capabilities,
    filetypes = { "julia" },
    single_file_support = true,
})

-- turn off in line diagnostics
vim.diagnostic.config({virtual_text = false})

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function(args)
  vim.diagnostic.setloclist({ open = false }) -- don't open and focus
  local window = vim.api.nvim_get_current_win()
  if #args.data.diagnostics >= 1 then
    vim.cmd('lwindow ' .. tostring(#args.data.diagnostics)) 
  else
    vim.cmd.lwindow() -- open+focus loclist if has entries, else close
  end

  vim.api.nvim_set_current_win(window) -- restore focus to window you were editing (delete this if you want to stay in loclist)
  end,
})

