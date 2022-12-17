local misc = {}

function misc.openquickfixlist()
vim.cmd([[
cgetfile /tmp/quickfix
topleft cwindow
if &ft == "qf"
    cc
endif
]])
end

function misc.removefancycharacters()
vim.cmd([[
" https://github.com/garybernhardt/dotfiles/blob/9e128843775d37983ca8f2ffc5d2cb46d7d4fc88/.vimrc#L567
let typo = {}
let typo["“"] = '"'
let typo["”"] = '"'
let typo["‘"] = "'"
let typo["’"] = "'"
let typo["–"] = '--'
let typo["—"] = '---'
let typo["…"] = '...'
:exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
]])
end

function misc.rename()
vim.cmd([[
" https://vi.stackexchange.com/questions/305/how-can-i-rename-the-file-im-editing
let old_name = expand('%')
let new_name = input('New file name: ', expand('%'), 'file')
if new_name != '' && new_name != old_name
    let v:errmsg = ""
    exec ':saveas ' . new_name
    if v:errmsg =~# '^$'
        if expand("%:p") !=# old_name && filewritable(expand("%:p"))
            silent exe "bwipe! " . old_name
            if delete(old_name)
                echoerr "Could not delete " . l:curfile
            endif
            redraw!
        endif
    else
        echoerr v:errmsg
    endif
endif
]])
end

function misc.sourcebookmarks()
vim.cmd([[
let bookmarks = split(system("cat $HOME/.local/share/misc/bookmarks"), '\n')
let g:startify_bookmarks = []
for bookmark in bookmarks
    if len(split(bookmark, ',')) == 2
        let key = split(bookmark, ',')[0]
        let file = split(bookmark, ',')[1]
        let g:startify_bookmarks = g:startify_bookmarks + [{key: file}]
    endif
endfor
]])
end

function misc.paste(regname, pasteType, pastecmd)
vim.cmd([[
    let reg_type = getregtype(]] .. regname .. [[)
    call setreg(]] .. regname .. [[, getreg(]] .. regname [[), ]] .. pasteType .. [[)
    exe 'normal "'.]] .. regname .. pastecmd [[
    call setreg(]] .. regname [[, getreg(]] .. regname [[), reg_type)

" nmap <leader>P :call myfun#Paste(v:register, "l", "P")<CR>
" nmap <leader>p :call myfun#Paste(v:register, "l", "p")<CR>
" nmap <leader>cP :call myfun#Paste(v:register, "v", "P")<CR>
" nmap <leader>cp :call myfun#Paste(v:register, "v", "p")<CR>
]])
end

function misc.hardmode()
vim.cmd([[
nnoremap <expr> k v:count == 0 ? '' : 'k'
nnoremap <expr> j v:count == 0 ? '' : 'j'
nnoremap h <nop>
nnoremap l <nop>
nnoremap w <nop>
nnoremap b <nop>
xnoremap h <nop>
xnoremap j <nop>
xnoremap k <nop>
xnoremap l <nop>
xnoremap w <nop>
xnoremap b <nop>
]])
end

function misc.trailing()
vim.cmd([[
let save_pos = getpos(".")
%s/\s\+$//en
%s/\s\+$//e
call setpos('.', save_pos)
]])
end

function misc.synstack()
vim.cmd([[
if !exists("*synstack")
    return
endif
echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
]])
end

function misc.buffers()
vim.cmd([[
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
]])
end

function misc.smoothscroll(is_up)
vim.cmd([[
if ]] .. is_up .. [[
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
]])
end

function misc.cr()
vim.cmd([[
let before_and_after_cursor = getline('.')[col('.')-2:col('.')]
if before_and_after_cursor == "{}" || before_and_after_cursor == "()" || before_and_after_cursor == "[]"
    return "\<cr>\<esc>O"
else
    return "\<cr>"
endif
]])
end

function misc.search()
vim.cmd([[
if search(]] .. string .. [[)
    stopinsert
    call feedkeys(strlen(string) . 's', 'n')
else
    call feedkeys("\t", 'n')
endif
]])
end

function misc.conflicthighlights()
vim.cmd([[
function! myfun#ConflictsHighlight()
    syn region conflictStart start=/^<<<<<<< .*$/ end=/^\ze\(=======$\||||||||\)/
    syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
    syn region conflictEnd start=/^\(=======$\||||||| |\)/ end=/^>>>>>>> .*$/

    highlight conflictStart ctermbg=red ctermfg=black
    highlight conflictMiddle ctermbg=blue ctermfg=black
    highlight conflictEnd ctermbg=green cterm=bold ctermfg=black
endfunction
]])
end

function misc.openchangedfiles()
vim.cmd([[
" https://github.com/garybernhardt/dotfiles/blob/004164079c6aeb226338b5a1b5d4f91f366ff50e/.vimrc#L542
function! myfun#OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
]])
end

-- function! myfun#NotesFind(split)
--     let line=getline('.')
--     let backward=join(reverse(split(line, '.\zs')), '')
--     let cursor=getcurpos()[2]
--     let backcursor=(strlen(line) - cursor)
--     let beginning=strlen(line) - match(backward, '[[', backcursor)
--     let end=match(line, ']]', cursor) - 1
--     let filepath =line[beginning:end]
--     if strlen(filepath) == 0
--         return
--     endif
--     " add to tag stack
--     let bufnr = bufnr('%')
--     let newtag = {
--                 \ 'tagname' : filepath,
--                 \ 'bufnr' : bufnr,
--                 \ 'from' : [bufnr, line('.'), col('.'), 0]
--                 \ }
--     let nr = win_getid()
--     let dict = gettagstack(nr)
--     let dict['curidx'] += 1
--     let dict['items'] = [newtag]
--     call settagstack(nr, dict, 'a')
--     " open the file
--     if a:split
--         execute 'vsplit **/' . filepath . '*'
--     else
--         execute 'edit **/' . filepath . '*'
--     endif
-- endfunction

return misc
