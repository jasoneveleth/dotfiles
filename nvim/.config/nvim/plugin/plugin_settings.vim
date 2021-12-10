if exists("loaded_plugin_settings")
    finish
endif
let g:loaded_plugin_settings = 1

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" removes spaces when using the wrong character
let g:surround_40 = "(\r)"
let g:surround_123 = "{\r}"
let g:surround_91 = "[\r]"

" let g:vimtex_quickfix_mode=0

let g:CoolTotalMatches = 1

let g:peekaboo_delay = 500

let g:rooter_patterns = ['.git', 'Makefile']
let g:rooter_silent_chdir = 1

let g:textobjs = ['$', ',', '.', ':', '+', ';', '=', '-', '_', '*', '#', '&', '~']

let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, {'z': '~/.config/zsh/.zshrc'}, {'y': '~/.config/zsh/.zshenv'} ]
let g:startify_custom_header = []
let g:startify_files_number = 5

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = {'ignored_filetypes': ['markdown', 'gitcommit', 'yaml', 'tex']}
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.ultisnips = v:true

