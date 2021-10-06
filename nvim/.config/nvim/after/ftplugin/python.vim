setlocal commentstring=#\ %s
setlocal include=^\s\
setlocal signcolumn=yes
set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-\\}\\)*\\ze\\($\\\|\ as\ \\)

function! PyInclude(fname)
    let parts = split(a:fname, ' import ') " [conv.metrics] [conv, conversion]
    let l = parts[0] " conv.metrics conv
    if len(parts) > 1
	let r = parts[1] " conversion
	let joined = join([l, r], '.') "conv.conversion
	let fp = substitute(joined, '\.', '/', 'g') . '.py'
	let found = glob(fp, 1)
	echo found
	if len(found)
	    return found
	endif
    endif
    return substitute(l, '/.', '\', 'g') . '.py'
endfunction
setlocal includeexpr=PyInclude(v:fname)

setlocal define=^\\s*\\<\\(def\\\|class\\)\\>

nnoremap <buffer> <leader>r :FloatermNew python3 %<cr>

set errorformat=\%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,\%*\\sFile\ \"%f\"\\,\ line\ %l,
