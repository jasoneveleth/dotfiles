-- Bullets.vim
vim.g.bullets_enabled_file_types = {
    'markdown',
    'text',
    'gitcommit',
    'scratch',
    'asciidoc'
}
vim.g.delimitMate_expand_cr = 1

-- removes spaces when using the wrong character
vim.g.surround_40 = "(\r)"
vim.g.surround_123 = "{\r}"
vim.g.surround_91 = "[\r]"
vim.g.surround_no_insert_mappings = 1

vim.g.lion_create_maps = 0
vim.g.lion_map_left = "H"
vim.g.lion_map_right = "gH"
vim.g.lion_squeeze_spaces = 1

-- let g:vimtex_quickfix_mode=0

vim.g.CoolTotalMatches = 1

vim.g.peekaboo_delay = 500

vim.g.rooter_patterns = {'.git', 'Makefile'}
vim.g.rooter_silent_chdir = 1

vim.g.textobjs = {'$', ',', '.', ':', '+', ';', '=', '-', '_', '*', '#', '&', '~'}

require("jason.misc").sourcebookmarks()
vim.g.startify_custom_header = {}
vim.g.startify_files_number = 5

-- settings for neovide
-- let g:neovide_remember_window_size = v:true
vim.g.neovide_input_use_logo = true
vim.g.neovide_input_macos_alt_is_meta = true

vim.g.loaded_python_provider = 1
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1

prefix = os.getenv("CONDA_PREFIX") or ""
vim.g.python_host_prog = prefix .. '/bin/python'
vim.g.python3_host_prog = prefix .. '/bin/python'

vim.g.netrw_dirhistmax = 0
vim.g.tex_flavor = 'latex'
