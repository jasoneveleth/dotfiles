if exists("loaded_personal_statusline")
    finish
endif
let g:loaded_personal_statusline = 1

" Status line
" default:      set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
" mine:         set statusline=%<%f\ %h%m%r%=%-50.(%{nvim_treesitter#statusline(50)}%)\ %-14.(%l,%c%V%)\ %P

let g:active_colors = ['red', 'green', 'blue', 'magenta']

let g:color2cterm={
    \ 'red' : '1',
    \ 'green' : '2',
    \ 'blue' : '4',
    \ 'magenta' : '5',
    \ 'grey' : '8',
    \ 'dark' : '0',
    \ 'light' : '15'
    \}

let g:color2gui={
    \ 'red' : '#E06C75',
    \ 'green' : '#98C379',
    \ 'blue' : '#61AFEF',
    \ 'magenta' : '#C678DD',
    \ 'light' : '#ABB2BF',
    \ 'grey' : '#3E4452',
    \ 'dark' : '#2C323C',
    \}

let g:mode2color={
    \ 'n'  : 'green',
    \ 'no' : 'green',
    \ 'v'  : 'magenta',
    \ 'V'  : 'magenta',
    \ '' : 'magenta',
    \ 's'  : 'magenta',
    \ 'S'  : 'magenta',
    \ '^S' : 'magenta',
    \ 'i'  : 'blue',
    \ 'R'  : 'red',
    \ 'Rv' : 'red',
    \ 'c'  : 'green',
    \ 'cv' : 'green',
    \ 'ce' : 'green',
    \ 'r'  : 'blue',
    \ 'rm' : 'blue',
    \ 'r?' : 'red',
    \ '!'  : 'blue',
    \ 't'  : 'blue'
    \}


" Status Line Custom
let g:mode2name={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V-Line',
    \ '' : 'V-Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S-Line',
    \ '^S' : 'S-Block',
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

function! statusline#link(mode)
    exec 'hi! link rainbowstatuscolor statusline' . g:mode2color[a:mode]
    return ''
endfunction

for color in g:active_colors
    exec 'hi statusline' . color . ' ctermfg=0 cterm=bold ctermbg=' . g:color2cterm[color] . ' guibg=' . g:color2gui[color] . ' guifg=#282C34 gui=bold'
endfor
exec 'hi greystatuscolor ctermfg=' . g:color2cterm['light'] . ' ctermbg=' . g:color2cterm['grey'] . ' guifg=' . g:color2gui['light'] . ' guibg=' . g:color2gui['grey']
exec 'hi darkstatuscolor ctermfg=' . g:color2cterm['light'] . ' ctermbg=' . g:color2cterm['dark'] . ' guifg=' . g:color2gui['light'] . ' guibg=' . g:color2gui['dark']

set laststatus=2
set noshowmode
set statusline=
set statusline+=%{statusline#link(mode())}                               " reset colors
set statusline+=%#rainbowstatuscolor#\ %{toupper(g:mode2name[mode()])}\  " The current mode 
set statusline+=%#greystatuscolor#\ %<%f%m%r%h%w\                        " File path, modified, readonly, helpfile, preview
set statusline+=%#darkstatuscolor#                                       " Separator
set statusline+=%=                                                       " Right Side
" set statusline+=\ (%{&ff})\                                            " FileFormat (dos/unix..)
" set statusline+=%7*\ %{''.(&fenc!=''?&fenc:&enc).''}\                  " Encoding
" set statusline+=%7*\|                                                  " Separator
set statusline+=%#darkstatuscolor#\ %y\                                  " FileType
set statusline+=%#greystatuscolor#\ %2p%%\                               " percentage of document
set statusline+=%#rainbowstatuscolor#\ %2l/%L:%2c\                       " Line number , column number
" set statusline+=%0*\ %n\                                               " Buffer number
