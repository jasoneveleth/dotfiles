fun! Plugin()
    let width = nvim_win_get_width(0)
    let height = nvim_win_get_height(0)
    let bufh = nvim_create_buf(0, 1)
    let winId = nvim_open_win(bufh, 1, {
                \ 'relative':'editor',
                \ 'width':width-10,
                \ 'height':height-10,
                \ 'col':5,
                \ 'row':5,
                \ })
    echo system(expand("texcount %"))
endfun
