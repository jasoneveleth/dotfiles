-- ~/.config/nvim/lua/jason/luasnip.lua
-- ~/.config/nvim/lua/jason/packer.lua
-- ~/.config/nvim/lua/jason/remap.lua

require("jason.set")
require("jason.misc")
require("jason.packer")
require("jason.disable")
require("jason.luasnip")
require("jason.remap")
require("jason.noice")
require("jason.cmp")
require("jason.plugin")
require("jason.statusline")
require("jason.texcount")
require("jason.textobjects")
require("jason.toggle")
require("jason.window")

require'nvim-treesitter.configs'.setup{
  indent = {
      enable = true,
  },
  highlight = {
    enable = true,
    -- Setting this to true/list of languages will run `:h syntax` and tree-sitter at the same time.
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd([[
" https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
" allows regex to be used
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RgRegex call RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=* RgContents
            \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
]])

misc = require("jason.misc")
vim.api.nvim_create_user_command("OpenChangedFiles", misc.openchangedfiles, {})
vim.api.nvim_create_user_command("Rename", misc.rename, {})
vim.api.nvim_create_user_command("ConflictHighlights", misc.conflicthighlights, {})
vim.api.nvim_create_user_command("BufOnly", [[silent! exec "%bd|e#|bd#"]], {})
vim.api.nvim_create_user_command("SourceBookmarks", misc.sourcebookmarks, {})
vim.api.nvim_create_user_command("Quickfix", misc.openquickfixlist, {})
vim.api.nvim_create_user_command("Statusline", [[silent! exec "unlet g:loaded_personal_statusline|so ~/.config/nvim/plugin/statusline.vim"]], {})
vim.api.nvim_create_user_command("Commands", [[echo "
    \ ConflictHighlights -- highlight git conflicts\n
    \ RgRegex    -- use rust regex rather than fuzzy finding\n
    \ RgContents -- only search contents not filenames too\n
    \ SourceBookmarks -- source Startify bookmarks\n
    \ Rename     -- rename current file\n
    \ Quickfix   -- for file /tmp/quickfix\n
    \ BufOnly    -- delete all other buffers, and keep current one\n
    \ Statusline -- resource the statusline to add colors again\n
    \ "
]], {})

-- fixes clipbloard so you can paste right into terminal
-- usage: yank a tex formula (with $'s), execute this macro (depends on gdefault for :s)
vim.cmd([[let @t = " jep:%join\rIecho \elv$S'A | itex\e:s/\\\\/\\\\\\\\/\ryy wj"]])

