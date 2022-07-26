if exists("loaded_lsp_settings") || !has('nvim')
    finish
endif
let g:loaded_lsp = 1

lua <<EOF
require'lspconfig'.julials.setup{
    cmd = { "julia", "--startup-file=no", "--history-file=no", "-e", '    # Load LanguageServer.jl: attempt to load from ~/.julia/environments/nvim-lspconfig\n    # with the regular load path as a fallback\n    ls_install_path = joinpath(\n        get(DEPOT_PATH, 1, joinpath(homedir(), ".config")),\n        "julia", "environments", "nvim-lspconfig"\n    )\n    pushfirst!(LOAD_PATH, ls_install_path)\n    using LanguageServer\n    popfirst!(LOAD_PATH)\n    depot_path = get(ENV, "JULIA_DEPOT_PATH", "")\n    project_path = let\n        dirname(something(\n            ## 1. Finds an explicitly set project (JULIA_PROJECT)\n            Base.load_path_expand((\n                p = get(ENV, "JULIA_PROJECT", nothing);\n                p === nothing ? nothing : isempty(p) ? nothing : p\n            )),\n            ## 2. Look for a Project.toml file in the current working directory,\n            ##    or parent directories, with $HOME as an upper boundary\n            Base.current_project(),\n            ## 3. First entry in the load path\n            get(Base.load_path(), 1, nothing),\n            ## 4. Fallback to default global environment,\n            ##    this is more or less unreachable\n            Base.load_path_expand("@v#.#"),\n        ))\n    end\n    @info "Running language server" VERSION pwd() project_path depot_path\n    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)\n    server.runlinter = true\n    run(server)\n  ' },
    filetypes = { "julia" },
    single_file_support = true,
}
-- doesn't work becuase I don't install in defualt dir ~/.julia/environments/
-- lua require'lspconfig'.julials.setup{}
EOF

" pyright = {}
" pyright.settings = {}
" pyright.settings.python = {}
" pyright.settings.python.pythonPath = "/opt/homebrew/Caskroom/miniforge/base/envs/tensorflow/bin/python"
" require'lspconfig'.pyright.setup{}

lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.racket_langserver.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.rust_analyzer.setup{}

" lua <<EOF
" require('lean').setup{
"   abbreviations = { builtin = true },
"   lsp = { on_attach = on_attach },
"   lsp3 = { on_attach = on_attach },
"   mappings = true,
" }
" EOF
" lua require'lspconfig'.lean3ls.setup{}

