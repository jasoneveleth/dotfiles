vim.cmd([[
if exists("loaded_window_plugin")
    finish
endif
let g:loaded_window_plugin = 1

"ryan's maps
let g:window_key_prefix = "<space>"
" the first value is the key and the second is the new window command
let g:window_key_mappings = [
            \ ["h", "aboveleft vsplit"],
            \ ["j", "belowright split"],
            \ ["k", "aboveleft split"],
            \ ["l", "belowright vsplit"],
            \ [",", "let buf = bufnr('%') <bar> tabnew <bar> execute 'buffer' buf"],
            \ [".", ""],
            \ ["H", "topleft vsplit"],
            \ ["J", "botright split"],
            \ ["K", "topleft split"],
            \ ["L", "botright vsplit"],
            \ ]

" Create an additional set of window maps for some command.
" If user_enter is truthy (typically 1), then the command won't be automatically
" executed; the user will have to press enter. This is useful for commands
" which require user input (edit for example).
function! MapWinCmd(key, command, user_enter)
  if a:user_enter
    let suffix = ""
    let prefix = ":"
  else
    let suffix = "<cr>"
    let prefix = "<cmd>"
  endif

  for key_mapping in g:window_key_mappings
      execute "nnoremap " . g:window_key_prefix . key_mapping[0] . a:key . 
            \ " <Cmd>" . key_mapping[1] . "<cr>" . prefix . a:command . suffix
  endfor
endfunction

call MapWinCmd("e", "e ", 1)
call MapWinCmd("n", "enew <bar> setlocal bufhidden=hide nobuflisted " .
      \ "buftype=nofile", 0)
call MapWinCmd("c", "", 0)
call MapWinCmd("t", "terminal", 0)
call MapWinCmd("f", "Files", 0)
call MapWinCmd("b", "Buffers", 0)
call MapWinCmd("s", "Startify", 0)
]])
