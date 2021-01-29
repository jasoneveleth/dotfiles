function! myfunctions#DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

function! myfunctions#HardMode()
    set backspace=0
    inoremap <CR> <nop>
    nnoremap h <nop>
    nnoremap j <nop>
    nnoremap k <nop>
    nnoremap l <nop>
    nnoremap w <nop>
    nnoremap b <nop>
endfunction

function! myfunctions#StripTrailing()
    let save_pos = getpos(".")
    %s/\s\+$//en
    %s/\s\+$//e
    call setpos('.', save_pos)
endfunction

function! myfunctions#SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function myfunctions#Buffers()
    ls
    echo 'input buffer: '
    let buff = getchar()
    echon nr2char(buff)
    if buff == 13
        buffer #
        redraw!
    elseif buff == 27
        redraw!
    else
        let buff = [buff]
        while buff[-1] != 13
            let buff = buff + [getchar()]
            echon nr2char(buff[-1])
            if buff[-1] == 27
                redraw!
                return
            endif
        endwhile
        call map(buff, 'nr2char(v:val)')
        let num = join(buff[0:-2], '')
        exec('buffer ' . num)
        redraw!
    endif
endfunction

function myfunctions#SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 1m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

function! myfunctions#NotesFind(split)
    let line=getline('.')
    let backward=join(reverse(split(line, '.\zs')), '')
    let cursor=getcurpos()[2]
    let backcursor=(strlen(line) - cursor)
    let beginning=strlen(line) - match(backward, '[[', backcursor)
    let end=match(line, ']]', cursor) - 1
    let filepath =line[beginning:end]
    if strlen(filepath) == 0
        return
    endif
    " add to tag stack
    let bufnr = bufnr('%')
    let newtag = {
                \ 'tagname' : filepath,
                \ 'bufnr' : bufnr,
                \ 'from' : [bufnr, line('.'), col('.'), 0]
                \ }
    let nr = win_getid()
    let dict = gettagstack(nr)
    let dict['curidx'] += 1
    let dict['items'] = [newtag]
    call settagstack(nr, dict, 'a')
    " open the file
    if a:split
        execute 'vsplit **/' . filepath . '*'
    else
        execute 'edit **/' . filepath . '*'
    endif
endfunction

function! myfunctions#Enter()
    let before=getline('.')[col('.')-2] 
    echo before
    if (before == "{") || (before == "(")
        return "O"
    else
        return ""
    endif
endfunction

function! myfunctions#InsertBrace()
    let cursor=getline('.')[col('.')-1]
    if (!(cursor =~ '\S')) || (cursor == "}") || (cursor == ";")
        return "{}\<left>"
    else
        return "{"
    endif
endfunction

function! myfunctions#IgnoreBrace()
    let next=getline('.')[col('.')-1]
    if next == "}"
        return "\<right>"
    else
        return "}"
    endif
endfunction

function! myfunctions#InsertParen()
    let cursor=getline('.')[col('.')-1]
    if (!(cursor =~ '\S')) || (cursor == ")") || (cursor == ";")
        return "()\<left>"
    else
        return "("
    endif
endfunction

function! myfunctions#IgnoreParen()
    let next=getline('.')[col('.')-1]
    if next == ")"
        return "\<right>"
    else
        return ")"
    endif
endfunction

function! myfunctions#Tab()
  if search('<++>')
    stopinsert
    call feedkeys('c4l', 'n')
  else
    call feedkeys("\t", 'n')
  endif
endfunction

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" https://www.reddit.com/r/neovim/comments/f2frf6/how_do_i_use_nvimlsps_omnicompletion_with_the_tab/fhd7ky8?utm_source=share&utm_medium=web2x&context=3
function! Smart_TabComplete()
    let line = getline('.')                         " current line

    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    " line to one character right
    " of the cursor
    let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
        return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"                         " existing text matching
    elseif ( has_slash )
        return "\<C-X>\<C-F>"                         " file matching
    else
        return "\<C-X>\<C-O>"                         " plugin matching
    endif
endfunction

function! myfunctions#BS()
    let lasttwo = getline('.')[col('.')-2:col('.')-1]
    if (lasttwo == "()") || (lasttwo == "{}")
        return "\<right>"
    else
        return ""
    endif
endfunction
