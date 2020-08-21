" Clear default
syn clear pythonStatement

" Set it to what's in the Python file, and change def, class, print
syn keyword pythonBuiltin      print
syn keyword pythonBooleans     False None True
syn keyword pythonStatement    as assert break continue del exec global
syn keyword pythonStatement    lambda nonlocal pass return with yield
syn keyword pythonStatement    def nextgroup=pythonFunction,pythonFunctionDeclaration skipwhite

" Now make seperate syntax groups for classes
syn keyword pythonClassStmt class nextgroup=pythonClass skipwhite
syn match   pythonClass "\h\w*" display contained

" Redoing pythonAttribute
syn clear pythonAttribute
syn match   pythonAttribute /\.\h\w*/hs=s+1
    \ contains=ALLBUT,pythonBuiltin,pythonFunction,pythonClass,pythonAsync

syntax match pythonOperator "\v\*"
syntax match pythonOperator "\v/"
syntax match pythonOperator "\v\+"
syntax match pythonOperator "\v-"
syntax match pythonOperator "\v\?"
syntax match pythonOperator "\v\="
syntax match pythonOperator "\v\*\="
syntax match pythonOperator "\v/\="
syntax match pythonOperator "\v\+\="
syntax match pythonOperator "\v-\="

syntax match pythonOperator "\v\!\="
syntax match pythonOperator "\v\>\="
syntax match pythonOperator "\v\<\="

syn match pythonFunctionCall "\v\w+\ze\("
hi def link pythonFunctionCall Function

" Highlight the class statement and the class name.
hi def link pythonClassStmt Statement
hi def link pythonClass Special

" Highlights the arguments of functions, annoying
syn clear pythonFunction
syn match pythonFunction "\h\w*" nextgroup=pythonFunctionDeclaration display contained
" syn match pythonFunctionDeclaration "\v^\s*def \h\w*\(.+\):" 
    " \ contains=ALLBUT,pythonDoctestValue transparent
syn match pythonFunctionDeclaration "\v\(.+\):" contains=pythonArguments transparent contained
syn match pythonArguments "\v\(\zs.+\ze\)" contained contains=ALLBUT,pythonFunction
hi def link pythonArguments Special



hi Function ctermfg=4
hi String ctermfg=2
hi Statement ctermfg=5 cterm=none
hi Special ctermfg=11
hi Operator ctermfg=5
hi Include ctermfg=5 cterm=none
hi pythonAttribute ctermfg=1
hi pythonBuiltin ctermfg=6
hi Number ctermfg=3
hi pythonProperty ctermfg=1
hi pythonBooleans ctermfg=3

