if g:personal_statusline == 0
    finish
endif

" https://gist.github.com/meskarune/57b613907ebd1df67eb7bdb83c6e6641
" status bar colors
augroup statusline
    au!
    au InsertEnter * hi statusline ctermfg=0 ctermbg=2
    au ColorScheme * hi statusline ctermfg=0 ctermbg=4 cterm=bold
    au InsertLeave * hi statusline ctermfg=0 ctermbg=4
    " au FileType qf set statusline
augroup END
hi statusline ctermfg=0 ctermbg=4 cterm=bold

" Status line
" default:      set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
" mine:         set statusline=%<%f\ %h%m%r%=%-50.(%{nvim_treesitter#statusline(50)}%)\ %-14.(%l,%c%V%)\ %P

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode 
set statusline+=%6*\ %<%f%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%7*                                      " Separator
set statusline+=%=                                       " Right Side
" set statusline+=\ (%{&ff})\                              " FileFormat (dos/unix..)
" set statusline+=%7*\|                                    " Separator
" set statusline+=%7*\ %{''.(&fenc!=''?&fenc:&enc).''}\    " Encoding
" set statusline+=%7*\|                                    " Separator
set statusline+=%7*\ %y\                                 " FileType
set statusline+=%6*\ %3p%%\                              " Colomn number
set statusline+=%0*\ %02l/%L\ :\ %c\                 " Line number / total lines, percentage of document, column number
" set statusline+=%0*\ %n\                                 " Buffer number
