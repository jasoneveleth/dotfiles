function! myfun#PackInit() abort
    packadd minpac

    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    call minpac#add('tpope/vim-commentary')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('romainl/vim-cool')
    call minpac#add('junegunn/fzf.vim')
    call minpac#add('junegunn/fzf')
    call minpac#add('junegunn/vim-peekaboo')
    call minpac#add('jasoneveleth/vim-dim')
    call minpac#add('mhinz/vim-startify')
    call minpac#add('mhinz/vim-sayonara')
    call minpac#add('mbbill/undotree')
    call minpac#add('joshdick/onedark.vim')
    call minpac#add('dkarter/bullets.vim')
    call minpac#add('PeterRincker/vim-argumentative')
    call minpac#add('justinmk/vim-sneak')
    call minpac#add('Raimondi/delimitMate')
    call minpac#add('tjdevries/train.nvim')
    call minpac#add('nvim-lua/plenary.nvim')
    call minpac#add('Julian/lean.nvim')
    call minpac#add('lervag/vimtex')
    call minpac#add('airblade/vim-gitgutter')
    call minpac#add('nvim-telescope/telescope.nvim')
    call minpac#add('nvim-telescope/telescope-fzf-native.nvim')
    call minpac#add('SirVer/ultisnips', {'type': 'opt'})
    if has('nvim-0.5')
        call minpac#add('nvim-treesitter/nvim-treesitter')
        call minpac#add('neovim/nvim-lspconfig')
        call minpac#add('hrsh7th/nvim-compe')
    endif
endfunction

function! myfun#OpenQuickfixList()
    cgetfile /tmp/quickfix
    topleft cwindow
    if &ft == "qf"
        cc
    endif
endfunction

" https://github.com/garybernhardt/dotfiles/blob/9e128843775d37983ca8f2ffc5d2cb46d7d4fc88/.vimrc#L567
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction

" https://vi.stackexchange.com/questions/305/how-can-i-rename-the-file-im-editing
function! myfun#RenameFile()
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
endfunction

function! myfun#SourceBookmarks()
    let l:bookmarks = split(system("cat $HOME/.local/share/misc/bookmarks"), '\n')
    let g:startify_bookmarks = []
    for bookmark in l:bookmarks
        if len(split(bookmark, ',')) == 2
            let key = split(bookmark, ',')[0]
            let file = split(bookmark, ',')[1]
            let g:startify_bookmarks = g:startify_bookmarks + [{key: file}]
        endif
    endfor
endfunction

" https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
" allows regex to be used
function! myfun#RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! myfun#Paste(regname, pasteType, pastecmd)
    let reg_type = getregtype(a:regname)
    call setreg(a:regname, getreg(a:regname), a:pasteType)
    exe 'normal "'.a:regname . a:pastecmd
    call setreg(a:regname, getreg(a:regname), reg_type)
endfunction

function! myfun#HardMode()
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

function! myfun#Search(string)
  if search(a:string)
    stopinsert
    call feedkeys(strlen(string) . 's', 'n')
  else
    call feedkeys("\t", 'n')
  endif
endfunction

function! myfun#ConflictsHighlight()
    syn region conflictStart start=/^<<<<<<< .*$/ end=/^\ze\(=======$\||||||||\)/
    syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
    syn region conflictEnd start=/^\(=======$\||||||| |\)/ end=/^>>>>>>> .*$/

    highlight conflictStart ctermbg=red ctermfg=black
    highlight conflictMiddle ctermbg=blue ctermfg=black
    highlight conflictEnd ctermbg=green cterm=bold ctermfg=black
endfunction
