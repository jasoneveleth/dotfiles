if vim.g.snippets == "luasnip" then
    return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
    -- jump back to last snippet even if you move outside selection
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } },
            },
        },
    },
})

-- CTRL-K to expand or jump
vim.keymap.set({"i", "s"}, "<c-]>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true})

-- CTRL-J to jump back
vim.keymap.set({"i", "s"}, "<c-[>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, {silent = true})

-- source snippets
vim.keymap.set("n", "<leader>,", "<cmd>source ~/.config/nvim/lua/jason/luasnip.lua<cr>")

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.conditions.expand").line_begin
local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types") -- already done
local parse = require("luasnip.util.parser").parse_snippet

local math = require("luasnip.extras.conditions").make_condition(function(...)
    return require("ts-latex-mode").in_mathzone()
end)

-- mine
local a = function(context, ...)
    context["snippetType"] = "autosnippet"
    return s(context, ...)
end
local ba = function(context, nodes) 
    context["snippetType"] = "autosnippet"
    return s(context, nodes, {condition = line_begin})
end
local b = function(context, nodes) 
    return s(context, nodes, {condition = line_begin})
end
local ai = function(context, ...)
    context["snippetType"] = "autosnippet"
    context["wordTrig"] = false
    return s(context, ...)
end
local mai = function(context, nodes)
    context["snippetType"] = "autosnippet"
    context["wordTrig"] = false
    return s(context, nodes, {condition = math})
end

-- TODO: remove me
ls.cleanup()

ls.add_snippets("tex", {
    b({trig = "pic", descr = "include graphics"}, fmta("\\includegraphics[<>]{<>}", {i(1, "width=3in"), i(2)})),
    ba({trig = "beg", descr = "begin environment"}, fmta("\\begin{<>}\n\t<>\n\\end{<>}", {i(1), i(2), rep(1)})),
    ba({trig = "enum", descr = "enumerate"}, fmta("\\begin{enumerate}\n\t\\item <>\n\\end{enumerate}", {i(1)})),
    ba({trig = "item", descr = "itemize"}, fmta("\\begin{itemize}\n\t\\item <>\n\\end{itemize}", {i(1)})),
    ba({trig = "ali", descr = "align"}, fmta("\\begin{align*}\n\t <>\n.\\end{align*}", {i(1)})),
    b({trig = "pac", descr = "package"}, fmta("\\usepackage{<>}", {i(1)})),
    mai({trig = "=>", descr = "implies"}, t("\\implies ")),
    mai({trig = "->", descr = "to"}, t("\\to ")),
    mai({trig = "!>", descr = "mapsto"}, t("\\mapsto ")),
    mai({trig = "=<", descr = "implied by"}, t("\\impliedby ")),
    mai({trig = "iff", descr = "iff"}, t("\\iff ")),
    mai({trig = "inn", descr = "in"}, t("\\in ")),
    mai({trig = "td", descr = "to the ... power"}, fmta("^{<>}", {i(1)})),
    mai({trig = "sr", descr = "squared"}, t("^2")),
    mai({trig = "invs", descr = "inverse"}, t("^{-1}")),
    mai({trig = "compl", descr = "complement"}, t("^{c}")),
    mai({trig = "cb", descr = "cubed"}, t("^3")),
    mai({trig = "sq", descr = "sqrt()"}, fmta("\\sqrt{<>}", {i(1)})),
    mai({trig = "norm", descr = "norm"}, fmta("\\|<>\\|", {i(1)})),
    mai({trig = "**", descr = "cdot"}, t("\\cdot ")),
    mai({trig = "xx", descr = "cross"}, t("\\times ")),
    mai({trig = "EE", descr = "exists"}, t("\\exists ")),
    mai({trig = "AA", descr = "forall"}, t("\\forall ")),
    mai({trig = "RR", descr = "Real Numbers"}, t("\\mathbb{R}")),
    mai({trig = "QQ", descr = "Rational Numbers"}, t("\\mathbb{Q}")),
    mai({trig = "ZZ", descr = "Integers"}, t("\\mathbb{Z}")),
    mai({trig = ">>", descr = ">>"}, t("\\gg ")),
    mai({trig = "<<", descr = "<<"}, t("\\ll ")),
    mai({trig = "~~", descr = "~"}, t("\\sim ")),
    mai({trig = "!=", descr = "equals"}, t("\\neq ")),
    mai({trig = ">=", descr = "geq"}, t("\\geq ")),
    mai({trig = "<=", descr = "leq"}, t("\\leq ")),
    mai({trig = "||", descr = "mid"}, t(" \\mid ")),
    mai({trig = "\\\\\\", descr = "setminus"}, t("\\setminus ")),
    -- xnn -> x_n
    -- yii -> y_i
    -- xp1 -> x_{n+1}

    -- should both only expand if end of trigger matches word boundary
    a({trig = "mk", descr = "math"}, fmta("$<>$", {i(1)})),
    -- should take visual input
    a({trig = "dm", descr = "math"}, fmta("\\[\n<>\n.\\] <>", {i(1), i(0)})),
    a({trig = ";verb", descr = "verb"}, fmta("\\verb|<>| <>", {i(1), i(0)})),
    b({trig = "fig", descr = "include figure"}, fmta("\\begin{figure}[ht]\n\\centering\n\\includegraphics[width=0.5\\linewidth]{<>}\n\\caption{<>}\\label{fig:<>}\n\\end{figure}\n<>", {i(3), i(2), i(1), i(0)})),

    mai({trig = "//", descr = "fraction"}, fmta("\\frac{<>}{<>}", {i{1}, i{2}})),

    -- should only expand if end of trigger matches word boundary
    a({trig = "vb", descr = "verb"}, fmta("\\verb|<>| ", {i(1)})),
    mai({trig = "set", descr = "set"}, fmta("\\{<>\\}", {i(1)})),

    -- greek
    mai({trig = ";a", descr = "alpha"}, t("α")),
})

-- snippet template "Basic template" b
-- \documentclass{article}

-- \usepackage[utf8]{inputenc}
-- \usepackage{amsmath, amssymb}
-- \usepackage[margin=1in]{geometry}
-- \usepackage{graphicx}
-- \usepackage[shortlabels]{enumitem}

-- \begin{document}
-- 	$0
-- \end{document}
-- endsnippet

-- snippet table "Table environment" b
-- \begin{table}[${1:htpb}]
-- 	\centering
-- 	\caption{${2:caption}}
-- 	\label{tab:${3:label}}
-- 	\begin{tabular}{${5:c}}
-- 	$0${5/((?<=.)c|l|r)|./(?1: & )/g}
-- 	\end{tabular}
-- \end{table}
-- endsnippet

-- snippet fig "Figure environment" b
-- \begin{figure}[${1:htpb}]
-- 	\centering
-- 	${2:\includegraphics[width=0.8\textwidth]{$3}}
-- 	\caption{${4:$3}}
-- 	\label{fig:${5:${3/\W+/-/g}}}
-- \end{figure}
-- endsnippet

-- snippet mk "Math" wA
-- $${1}$`!p
-- if t[2] and t[2][0] not in [',', '.', '?', '-', ' ', ')']:
-- 	snip.rv = ' '
-- else:
-- 	snip.rv = ''
-- `$2
-- endsnippet

-- snippet / "Fraction" i
-- \\frac{${VISUAL}}{$1}$0
-- endsnippet

-- context "math()"
-- snippet '((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/' "symbol frac" wrA
-- \\frac{`!p snip.rv = match.group(1)`}{$1}$0
-- endsnippet

-- priority 1000
-- context "math()"
-- snippet '^.*\)/' "() frac" wrA
-- `!p
-- stripped = match.string[:-1]
-- depth = 0
-- i = len(stripped) - 1
-- while True:
-- 	if stripped[i] == ')': depth += 1
-- 	if stripped[i] == '(': depth -= 1
-- 	if depth == 0: break;
-- 	i-=1
-- snip.rv = stripped[0:i] + "\\frac{" + stripped[i+1:-1] + "}"
-- `{$1}$0
-- endsnippet

-- context "math()"
-- snippet '([A-Za-z])(\d)' "auto subscript" wrA
-- `!p snip.rv = match.group(1)`_`!p snip.rv = match.group(2)`
-- endsnippet

-- context "math()"
-- snippet '([A-Za-z])_(\d\d)' "auto subscript2" wrA
-- `!p snip.rv = match.group(1)`_{`!p snip.rv = match.group(2)`}
-- endsnippet

-- snippet == "equals" iA
-- &= $1 \\\\
-- endsnippet

-- context "math()"
-- snippet ceil "ceil" iA
-- \left\lceil $1 \right\rceil $0
-- endsnippet

-- context "math()"
-- snippet floor "floor" iA
-- \left\lfloor $1 \right\rfloor$0
-- endsnippet

-- snippet pmat "pmat" iA
-- \begin{pmatrix} $1 \end{pmatrix} $0
-- endsnippet

-- snippet bmat "bmat" iA
-- \begin{bmatrix} $1 \end{bmatrix} $0
-- endsnippet

-- context "math()"
-- snippet () "left( right)" iA
-- \left( ${1:${VISUAL}} \right) $0
-- endsnippet

-- context "math()"
-- snippet <> "left< right>" iA
-- \langle ${1:${VISUAL}} \rangle $0
-- endsnippet

-- snippet lr "left( right)" i
-- \left( ${1:${VISUAL}} \right) $0
-- endsnippet

-- snippet lr( "left( right)" i
-- \left( ${1:${VISUAL}} \right) $0
-- endsnippet

-- snippet lr| "left| right|" i
-- \left| ${1:${VISUAL}} \right| $0
-- endsnippet

-- snippet lr{ "left\{ right\}" i
-- \left\\{ ${1:${VISUAL}} \right\\} $0
-- endsnippet

-- snippet lrb "left\{ right\}" i
-- \left\\{ ${1:${VISUAL}} \right\\} $0
-- endsnippet

-- snippet lr[ "left[ right]" i
-- \left[ ${1:${VISUAL}} \right] $0
-- endsnippet

-- snippet lra "leftangle rightangle" iA
-- \left<${1:${VISUAL}} \right>$0
-- endsnippet

-- context "math()"
-- snippet conj "conjugate" iA
-- \overline{$1}$0
-- endsnippet

-- context "math()"
-- snippet sum "sum" w
-- \sum_{n=${1:1}}^{${2:\infty}} ${3:a_n z^n}
-- endsnippet

-- snippet taylor "taylor" w
-- \sum_{${1:k}=${2:0}}^{${3:\infty}} ${4:c_$1} (x-a)^$1 $0
-- endsnippet

-- snippet lim "limit" w
-- \lim_{${1:n} \to ${2:\infty}} 
-- endsnippet

-- snippet limsup "limsup" w
-- \limsup_{${1:n} \to ${2:\infty}} 
-- endsnippet

-- snippet prod "product" w
-- \prod_{${1:n=${2:1}}}^{${3:\infty}} ${4:${VISUAL}} $0
-- endsnippet

-- snippet part "d/dx" w
-- \frac{\partial ${1:V}}{\partial ${2:x}} $0
-- endsnippet

-- snippet __ "subscript" iA
-- _{$1}$0
-- endsnippet

-- snippet ooo "\infty" iA
-- \infty
-- endsnippet

-- snippet rij "mrij" i
-- (${1:x}_${2:n})_{${3:$2}\\in${4:\\N}}$0
-- endsnippet

-- snippet plot "Plot" w
-- \begin{figure}[$1]
-- 	\centering
-- 	\begin{tikzpicture}
-- 		\begin{axis}[
-- 			xmin= ${2:-10}, xmax= ${3:10},
-- 			ymin= ${4:-10}, ymax = ${5:10},
-- 			axis lines = middle,
-- 		]
-- 			\addplot[domain=$2:$3, samples=${6:100}]{$7};
-- 		\end{axis}
-- 	\end{tikzpicture}
-- 	\caption{$8}
-- 	\label{${9:$8}}
-- \end{figure}
-- endsnippet

-- snippet nn "Tikz node" w
-- \node[$5] (${1/[^0-9a-zA-Z]//g}${2}) ${3:at (${4:0,0}) }{$${1}$};
-- $0
-- endsnippet

-- context "math()"
-- snippet mcal "mathcal" iA
-- \mathcal{$1}$0
-- endsnippet

-- snippet lll "l" iA
-- \ell
-- endsnippet

-- context "math()"
-- snippet nabl "nabla" iA
-- \nabla 
-- endsnippet

-- priority 100
-- context "math()"
-- snippet '(?<!\\)(sin|cos|tan|arccot|cot|csc|ln|log|exp|star|perp)' "ln" rwA
-- \\`!p snip.rv = match.group(1)`
-- endsnippet

-- priority 300
-- context "math()"
-- snippet dint "integral" wA
-- \int_{${1:-\infty}}^{${2:\infty}} ${3:${VISUAL}} $0
-- endsnippet

-- priority 200
-- context "math()"
-- snippet '(?<!\\)(arcsin|arccos|arctan|arccot|arccsc|arcsec|zeta|int)' "ln" rwA
-- \\`!p snip.rv = match.group(1)`
-- endsnippet

-- priority 200
-- context "math()"
-- snippet '(?<!\\)pi' "pi" rwA
-- \pi 
-- endsnippet

-- priority 100
-- context "math()"
-- snippet qq "quad" A
-- ,\quad 
-- endsnippet


-- priority 200
-- context "math()"
-- snippet <-> "leftrightarrow" iA
-- \leftrightarrow
-- endsnippet

-- context "math()"
-- snippet cc "subset" Ai
--  \subset 
-- endsnippet

-- snippet notin "not in " iA
-- \not\in 
-- endsnippet

-- context "math()"
-- snippet inn "in " iA
-- \in 
-- endsnippet

-- context "math()"
-- snippet NN "n" iA
-- \mathbb{N}
-- endsnippet

-- snippet Nn "cap" iA
-- \cap 
-- endsnippet

-- snippet UU "cup" iA
-- \cup 
-- endsnippet

-- snippet uuu "bigcup" iA
-- \bigcup_{${1:i \in ${2: I}}} $0
-- endsnippet

-- snippet nnn "bigcap" iA
-- \bigcap_{${1:i \in ${2: I}}} $0
-- endsnippet

-- snippet OO "emptyset" iA
-- \emptyset
-- endsnippet

-- snippet RR "real" iA
-- \mathbb{R}
-- endsnippet

-- snippet QQ "Q" iA
-- \mathbb{Q}
-- endsnippet

-- snippet ZZ "Z" iA
-- \mathbb{Z}
-- endsnippet

-- snippet CC "C" iA
-- \mathbb{C}
-- endsnippet

-- snippet <! "normal" iA
-- \triangleleft 
-- endsnippet

-- # snippet <> "hokje" iA
-- # \diamond 
-- # endsnippet


-- # context "math()"
-- # snippet '(?<!i)sts' "text subscript" irA
-- # _\text{$1} $0
-- # endsnippet

-- context "math()"
-- snippet tt "text" iA
-- \text{$1}$0
-- endsnippet

-- context "math()"
-- snippet case "cases" wA
-- \begin{cases}
-- 	$1
-- \end{cases}
-- endsnippet

-- snippet SI "SI" iA
-- \SI{$1}{$2}
-- endsnippet

-- snippet bigfun "Big function" iA
-- \begin{align*}
-- 	$1: $2 &\longrightarrow $3 \\\\
-- 	$4 &\longmapsto $1($4) = $0
-- .\end{align*}
-- endsnippet

-- snippet cvec "column vector" iA
-- \begin{pmatrix} ${1:x}_${2:1}\\\\ \vdots\\\\ $1_${2:n} \end{pmatrix}
-- endsnippet

-- priority 10
-- context "math()"
-- snippet "bar" "bar" riA
-- \overline{$1}$0
-- endsnippet

-- priority 100
-- context "math()"
-- snippet "([a-zA-Z])bar" "bar" riA
-- \overline{`!p snip.rv=match.group(1)`}
-- endsnippet

-- priority 10
-- context "math()"
-- snippet "hat" "hat" riA
-- \hat{$1}$0
-- endsnippet

-- priority 100
-- context "math()"
-- snippet "([a-zA-Z])hat" "hat" riA
-- \hat{`!p snip.rv=match.group(1)`}
-- endsnippet

-- snippet letw "let omega" iA
-- Let $\Omega \subset \C$ be open.
-- endsnippet


-- snippet HH "H" iA
-- \mathbb{H}
-- endsnippet

-- snippet DD "D" iA
-- \mathbb{D}
-- endsnippet

-- # vim:ft=snippets
