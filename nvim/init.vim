" call myfun#HardMode()

if exists('g:vscode')
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    nnoremap K :call VSCodeNotify('editor.action.showHover')<cr>
    nnoremap == :call VSCodeNotify('editor.action.formatDocument')<cr>
    " nnoremap <leader>b :call VSCodeNotify('workbench.action.quickOpen')<CR>
    augroup makingCommands
        autocmd!
        autocmd Filetype julia command! Make call VSCodeNotify('language-julia.executeFile')
        autocmd Filetype python command! Make call VSCodeNotify('python.execInTerminal')
    augroup END
    cabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'Make' : 'make'
    finish
endif

lua require('config')
