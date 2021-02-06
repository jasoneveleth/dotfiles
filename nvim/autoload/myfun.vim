function! myfun#DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | -1r #
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

function! myfun#HardMode()
    nnoremap h <nop>
    nnoremap j <nop>
    nnoremap k <nop>
    nnoremap l <nop>
    nnoremap w <nop>
    nnoremap b <nop>
    xnoremap h <nop>
    xnoremap j <nop>
    xnoremap k <nop>
    xnoremap l <nop>
    xnoremap w <nop>
    xnoremap b <nop>
endfunction

function! myfun#Trailing()
    let save_pos = getpos(".")
    %s/\s\+$//en
    %s/\s\+$//e
    call setpos('.', save_pos)
endfunction

function! myfun#SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function myfun#Buffers()
    echo ""
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

function myfun#SmoothScroll(is_up)
    if a:is_up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 1m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

function! myfun#NotesFind(split)
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

" function! myfun#Enter()
"     let before=getline('.')[col('.')-2] 
"     echo before
"     if (before == "{") || (before == "(")
"         return "O"
"     else
"         return ""
"     endif
" endfunction

" function! myfun#InsertBrace()
"     let cursor=getline('.')[col('.')-1]
"     if (!(cursor =~ '\S')) || (cursor == "}") || (cursor == ";")
"         return "{}\<left>"
"     else
"         return "{"
"     endif
" endfunction

" function! myfun#IgnoreBrace()
"     let next=getline('.')[col('.')-1]
"     if next == "}"
"         return "\<right>"
"     else
"         return "}"
"     endif
" endfunction

" function! myfun#InsertParen()
"     let cursor=getline('.')[col('.')-1]
"     if (!(cursor =~ '\S')) || (cursor == ")") || (cursor == ";")
"         return "()\<left>"
"     else
"         return "("
"     endif
" endfunction

" function! myfun#IgnoreParen()
"     let next=getline('.')[col('.')-1]
"     if next == ")"
"         return "\<right>"
"     else
"         return ")"
"     endif
" endfunction

" function! myfun#BS()
"     " converting col to 0 index
"     let surrounding = getline('.')[col('.')-2:col('.')]
"     if (surrounding == "()") || (surrounding == "{}")
"         return "\<right>\<bs>\<bs>"
"     else
"         return "\<bs>"
"     endif
" endfunction

function! myfun#Search(string)
  if search(a:string)
    stopinsert
    call feedkeys(strlen(string) . 's', 'n')
  else
    call feedkeys("\t", 'n')
  endif
endfunction

" https://www.reddit.com/r/neovim/comments/f2frf6/how_do_i_use_nvimlsps_omnicompletion_with_the_tab/fhd7ky8?utm_source=share&utm_medium=web2x&context=3
function! myfun#Tab()
    if neosnippet#expandable_or_jumpable()
        return "\<Plug>(neosnippet_expand_or_jump)"
    endif

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
    elseif (has_slash)
        return "\<C-X>\<C-F>"                         " file matching
    else
        return "\<C-X>\<C-O>"                         " plugin matching
    endif
endfunction
