vim.cmd([[
" fun! Plugin()
"     let width = nvim_win_get_width(0)
"     let height = nvim_win_get_height(0)
"     let bufh = nvim_create_buf(0, 1)
"     let winId = nvim_open_win(bufh, 1, {
"                 \ 'relative':'editor',
"                 \ 'width':width-10,
"                 \ 'height':height-10,
"                 \ 'col':5,
"                 \ 'row':5,
"                 \ })
"     echo system(expand("texcount %"))
" endfun

fun! Texcount() abort
    let count = system('texcount -opt=' . $HOME . '/.config/latex/texcount_template ' . expand('%'))
    let message = split(count, '\n')[1:]
    call TexcountFloatingMessage(message)
endfun

" https://www.statox.fr/posts/2021/03/breaking_habits_floating_window/
function! TexcountFloatingMessage(message) abort
    " Define the size of the floating window
    let width = 50
    let height = 17

    " Create the scratch buffer displayed in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " create the lines to draw a box
    let horizontal_border = '+' . repeat('-', width - 2) . '+'
    let empty_line = '|' . repeat(' ', width - 2) . '|'
    let lines = flatten([horizontal_border, map(range(height-2), 'empty_line'), horizontal_border])
    " set the box in the buffer
    call nvim_buf_set_lines(buf, 0, -1, v:false, lines)

    " Create the lines for the centered message and put them in the buffer
    let offset = 0
    for line in a:message
        let start_col = (width - len(line))/2
        let end_col = start_col + len(line)
        let current_row = height/2-len(a:message)/2 + offset
        let offset = offset + 1
        call nvim_buf_set_text(buf, current_row, start_col, current_row, end_col, [line])
    endfor

    " Set mappings in the buffer to close the window easily
    let closingKeys = ['<Esc>', '<CR>', '<Leader>']
    for closingKey in closingKeys
        call nvim_buf_set_keymap(buf, 'n', closingKey, ':close<CR>', {'silent': v:true, 'nowait': v:true, 'noremap': v:true})
    endfor

    " Create the floating window
    let ui = nvim_list_uis()[0]
    let opts = {'relative': 'editor',
                \ 'width': width,
                \ 'height': height,
                \ 'col': (ui.width/2) - (width/2),
                \ 'row': (ui.height/2) - (height/2),
                \ 'anchor': 'NW',
                \ 'style': 'minimal',
                \ }
    let win = nvim_open_win(buf, 1, opts)

    " Change highlighting
    call nvim_win_set_option(win, 'winhl', 'Normal:ErrorFloat')
endfunction
]])
