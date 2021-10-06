function! myfun#PackInit() abort
    packadd minpac

    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    call minpac#add('tpope/vim-commentary')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-rsi')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('romainl/vim-qf')
    call minpac#add('romainl/vim-cool')
    call minpac#add('junegunn/fzf.vim')
    call minpac#add('junegunn/fzf')
    call minpac#add('junegunn/vim-peekaboo')
    call minpac#add('ajpaulson/julia-syntax.vim')
    call minpac#add('leanprover/lean.vim')
    call minpac#add('jasoneveleth/vim-dim')
    call minpac#add('wellle/targets.vim')
    call minpac#add('mbbill/undotree')
    call minpac#add('chrisbra/Colorizer')
    call minpac#add('airblade/vim-rooter')
    call minpac#add('voldikss/vim-floaterm')
    call minpac#add('mhinz/vim-startify')
    call minpac#add('jiangmiao/auto-pairs')
    if has('nvim-0.5')
        call minpac#add('nvim-treesitter/nvim-treesitter')
        call minpac#add('neovim/nvim-lspconfig')
        call minpac#add('hrsh7th/nvim-compe')
    endif
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

function! myfun#DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | -1r #
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
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

function! myfun#Enter()
    let before=getline('.')[col('.')-2] 
    if (before == "{")
        return "\<cr>}\<esc>O"
    else
        return "\<cr>"
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
