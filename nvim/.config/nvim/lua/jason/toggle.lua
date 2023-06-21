-- toggle spell
vim.keymap.set("n", "yos", "<cmd>setl invspell <bar> set spell?<cr>", {desc = "toggle spelling"})

-- colo dim
vim.keymap.set("n", "yoc", "<Plug>(ToggleHighlight)", {silent = true, desc = "toggle highlight"})

-- showbreak
vim.keymap.set("n", "yob", "<cmd>if &showbreak == '++' <bar> set sbr= <bar> else <bar> set sbr=++ <bar> endif<cr>", {desc = "toggle show break"})

-- adjust current directory
vim.keymap.set("n", "yof", "<cmd>lcd %:h<cr>", {desc = "cd $(dirname %)"})
vim.keymap.set("n", "yod", "<cmd>lcd ..<cr>", {desc = "cd .."})

-- toggle relative number
vim.keymap.set("n", "<leader><leader>", "<cmd>set invrelativenumber<cr>", {desc = "toggle relno"})

vim.keymap.set("n", "<leader>o", [[filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"]], {silent = true, expr = true, desc = "toggle quickfix list"})

vim.cmd([[
" toggle backgroundwarning
let g:WarningCol = 0
nmap <silent> yol <Plug>(ToggleWarning)

" toggle wrap
nnoremap yow <cmd>setl invwrap<cr>

" toggle lazyredraw
nnoremap yor <cmd>set invlazyredraw<cr>

nnoremap yox <cmd>set invcursorline invcursorcolumn<cr>
" toggle o in format options?? (commenting onto opened line)


fun! ToggleWarning() abort
    if g:WarningCol == 1
        hi! link WarningCol Normal 
        let g:WarningCol = 0
    else 
        hi! link WarningCol Error
        let g:WarningCol = 1
    endif
endfun
nnoremap <Plug>(ToggleWarning) <cmd>call ToggleWarning()<cr>

fun! ToggleSyntax() abort
    if exists("g:syntax_on") 
        syntax off 
    else 
        syntax enable 
    endif
    TSBufToggle highlight
endfun
nnoremap <Plug>(ToggleHighlight) <cmd>call ToggleSyntax()<cr>
]])
