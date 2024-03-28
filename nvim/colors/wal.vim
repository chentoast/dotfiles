" wal.vim -- Vim color scheme.
" Author:       Dylan Araps
" Webpage:      https://github.com/dylanaraps/wal
" Description:  A colorscheme that uses your terminal colors, made to work with 'wal'.

hi clear
set background=dark

if exists('syntax_on')
    syntax reset
endif

" Colorscheme name
let g:colors_name = 'wal'

" highlight groups {{{

let s:bg = 0
let s:fg = 7
let s:red = 1
let s:green = 2
let s:yellow = 3
let s:blue = 4
let s:purple = 5
let s:cyan = 6
let s:grey = 8

function! SetHighlight(group, bg, fg, ...)
  if a:0 > 0
    let l:extra = a:1
  else
    let l:extra = ""
  endif

  exe 'hi '..a:group..' ctermbg='..a:bg..' ctermfg='..a:fg..' '..l:extra
endfunction

" " set t_Co=16
" " builtin highlight groups
" hi Boolean ctermbg=NONE ctermfg=1
" hi Character ctermbg=NONE ctermfg=1
" hi ColorColumn ctermbg=4 ctermfg=0
" hi Comment ctermbg=NONE ctermfg=8
" hi Conditional ctermbg=NONE ctermfg=5
" hi Constant ctermbg=NONE ctermfg=3
" hi Cursor ctermbg=NONE ctermfg=0
" hi CursorColumn ctermbg=8 ctermfg=8
" hi CursorLine ctermbg=2 ctermfg=0
" hi CursorLineNr ctermbg=NONE ctermfg=7
" hi Define ctermbg=NONE ctermfg=5
" hi Delimiter ctermbg=NONE ctermfg=5
" hi DiffAdd ctermbg=NONE ctermfg=2
" hi DiffChange ctermbg=NONE ctermfg=8
" hi DiffDelete ctermbg=NONE ctermfg=1
" hi DiffText ctermbg=NONE ctermfg=4
" hi Directory ctermbg=NONE ctermfg=4
" hi Error ctermbg=1 ctermfg=7
" hi ErrorMsg ctermbg=NONE ctermfg=8
" hi Float ctermbg=NONE ctermfg=5
" hi FoldColumn ctermbg=NONE ctermfg=7
" hi Folded ctermbg=NONE ctermfg=8
" hi Function ctermbg=NONE ctermfg=2 cterm=BOLD
" hi Identifier ctermbg=NONE ctermfg=1 cterm=BOLD
" hi Ignore ctermbg=7 ctermfg=0
" hi IncSearch ctermbg=3 ctermfg=0
" hi Include ctermbg=NONE ctermfg=4
" hi Keyword ctermbg=NONE ctermfg=5
" hi Label ctermbg=NONE ctermfg=3
" hi LineNr ctermbg=NONE ctermfg=7
" hi MatchParen ctermbg=0 ctermfg=1
" hi ModeMsg ctermbg=NONE ctermfg=2
" hi ModeMsg ctermbg=NONE ctermfg=8
" hi MoreMsg ctermbg=NONE ctermfg=2
" hi NonText ctermbg=NONE ctermfg=0
" hi Normal ctermbg=NONE ctermfg=7
" hi Number ctermbg=NONE ctermfg=3
" hi Operator ctermbg=NONE ctermfg=6
" hi Pmenu ctermbg=0 ctermfg=7
" hi PmenuSbar ctermbg=0 ctermfg=7
" hi PmenuSel ctermbg=4 ctermfg=0
" hi PmenuThumb ctermbg=8 ctermfg=8
" hi PreProc ctermbg=NONE ctermfg=3
" hi Question ctermbg=NONE ctermfg=4
" hi Repeat ctermbg=NONE ctermfg=3
" hi Search ctermbg=3 ctermfg=0
" hi Special ctermbg=NONE ctermfg=6
" hi SpecialChar ctermbg=NONE ctermfg=5
" hi SpecialKey ctermbg=NONE ctermfg=8
" hi SpellBad ctermbg=NONE ctermfg=1 cterm=underline
" hi SpellCap ctermbg=NONE ctermfg=4 cterm=underline
" hi SpellLocal ctermbg=NONE ctermfg=5 cterm=underline
" hi SpellRare ctermbg=NONE ctermfg=6 cterm=underline
" hi Statement ctermbg=NONE ctermfg=1
" hi StatusLine cterm=bold ctermbg=NONE ctermfg=7
" hi StatusLineNC cterm=NONE ctermbg=NONE ctermfg=8
" hi String ctermbg=NONE ctermfg=2
" hi Structure ctermbg=NONE ctermfg=5
" hi TabLine ctermbg=NONE ctermfg=8
" hi TabLineFill cterm=NONE ctermbg=NONE ctermfg=8
" hi TabLineSel ctermbg=4 ctermfg=0
" hi Tag ctermbg=NONE ctermfg=3
" hi TermCursorNC ctermbg=3 ctermfg=0
" hi Title ctermbg=NONE ctermfg=4
" hi Todo ctermbg=NONE ctermfg=2
" hi Type ctermbg=NONE ctermfg=3
" hi Underlined ctermbg=NONE ctermfg=1 cterm=underline
" hi VertSplit cterm=NONE ctermbg=NONE ctermfg=8
" hi Visual ctermbg=0 ctermfg=15 cterm=reverse term=reverse
" hi VisualNOS ctermbg=NONE ctermfg=1
" hi WarningMsg ctermbg=1 ctermfg=0
" hi WildMenu ctermbg=2 ctermfg=0
" hi helpLeadBlank ctermbg=NONE ctermfg=7
" hi helpNormal ctermbg=NONE ctermfg=7
" hi signColumn ctermbg=NONE ctermfg=4

call SetHighlight("Boolean", "NONE", s:yellow)
call SetHighlight("Character", "NONE", s:green)
call SetHighlight("ColorColumn", s:blue, s:bg)
call SetHighlight("Comment", "NONE", s:grey, "cterm=italic")
call SetHighlight("Conditional", "NONE", s:purple)
call SetHighlight("Constant", "NONE", s:cyan)
call SetHighlight("Cursor", "NONE", s:bg)
call SetHighlight("CursorColumn", s:grey, s:grey)
call SetHighlight("CursorLine", s:green, s:bg)
call SetHighlight("CursorLineNr", "NONE", s:yellow, "cterm=NONE")
call SetHighlight("Define", "NONE", s:purple)
call SetHighlight("Delimiter", "NONE", s:purple)
call SetHighlight("DiffAdd", "NONE", s:green)
call SetHighlight("DiffChange", "NONE", s:grey)
call SetHighlight("DiffDelete", "NONE", s:red)
call SetHighlight("DiffText", "NONE", s:blue)
call SetHighlight("Directory", "NONE", s:blue)
call SetHighlight("Error", "NONE", s:red)
call SetHighlight("ErrorMsg", "NONE", s:red)
call SetHighlight("Float", "NONE", s:yellow)
call SetHighlight("FoldColumn", "NONE", s:fg)
call SetHighlight("Folded", "NONE", s:grey)
call SetHighlight("Function", "NONE", s:blue, "cterm=BOLD")
call SetHighlight("Identifier", "NONE", s:red, "cterm=BOLD")
call SetHighlight("Ignore", s:fg, s:bg)
call SetHighlight("IncSearch", s:blue, s:bg, "cterm=NONE")
call SetHighlight("Include", "NONE", s:blue)
call SetHighlight("Keyword", "NONE", s:red)
call SetHighlight("Label", "NONE", s:purple)
call SetHighlight("LineNr", "NONE", s:fg)
call SetHighlight("MatchParen", "NONE", s:red)
call SetHighlight("ModeMsg", "NONE", s:green)
call SetHighlight("ModeMsg", "NONE", s:grey)
call SetHighlight("MoreMsg", "NONE", s:green)
call SetHighlight("NonText", "NONE", s:bg)
call SetHighlight("Normal", "NONE", s:fg)
call SetHighlight("Number", "NONE", s:yellow)
call SetHighlight("Operator", "NONE", s:purple)
call SetHighlight("Pmenu", s:bg, s:fg)
call SetHighlight("PmenuSbar", s:bg, s:fg)
call SetHighlight("PmenuSel", s:blue, s:bg)
call SetHighlight("PmenuThumb", s:grey, s:grey)
call SetHighlight("PreProc", "NONE", s:yellow)
call SetHighlight("Question", "NONE", s:blue)
call SetHighlight("QuickFixLine", "NONE", s:yellow, "cterm=underline")
call SetHighlight("Repeat", "NONE", s:purple)
call SetHighlight("Search", s:yellow, s:bg)
call SetHighlight("Special", "NONE", s:cyan)
call SetHighlight("SpecialChar", "NONE", s:purple)
call SetHighlight("SpecialKey", "NONE", s:grey)
call SetHighlight("SpellBad", "NONE", s:red, "cterm=underline")
call SetHighlight("SpellCap", "NONE", s:blue, "cterm=underline")
call SetHighlight("SpellLocal", "NONE", s:purple, "cterm=underline")
call SetHighlight("SpellRare", "NONE", s:cyan, "cterm=underline")
call SetHighlight("Statement", "NONE", s:purple)
call SetHighlight("StatusLine", "NONE", s:fg, "cterm=bold")
call SetHighlight("StatusLineNC", "NONE", s:grey, "cterm=NONE")
call SetHighlight("String", "NONE", s:green)
call SetHighlight("Structure", "NONE", s:yellow)
call SetHighlight("TabLine", "NONE", s:grey)
call SetHighlight("TabLineFill", "NONE", s:grey, "cterm=NONE")
call SetHighlight("TabLineSel", s:blue, s:bg)
call SetHighlight("Tag", "NONE", s:yellow)
call SetHighlight("TermCursorNC", s:yellow, s:bg)
call SetHighlight("Title", "NONE", s:blue)
call SetHighlight("Todo", "NONE", s:green)
call SetHighlight("Type", "NONE", s:yellow)
call SetHighlight("Underlined", "NONE", s:red, "cterm=underline")
call SetHighlight("VertSplit", "NONE", s:grey, "cterm=NONE")
call SetHighlight("Visual", s:bg, s:fg, "cterm=reverse")
call SetHighlight("VisualNOS", "NONE", s:red)
call SetHighlight("WarningMsg", s:red, s:bg)
call SetHighlight("WildMenu", s:green, s:bg)
call SetHighlight("helpLeadBlank", "NONE", s:fg)
call SetHighlight("helpNormal", "NONE", s:fg)
call SetHighlight("signColumn", "NONE", s:blue)

" Treesitter
" call SetHighlight("TSError", "NONE", s:red)
" call SetHighlight("TSPunctDelimitter", "NONE", s:cyan)
" call SetHighlight("TSPunctSpecial", "NONE", s:cyan)
" call SetHighlight("TSConstant", "NONE", s:yellow)
" call SetHighlight("TSConstBuiltin", "NONE", s:blue)
" call SetHighlight("TSContMacro", "NONE", s:purple)
" call SetHighlight("TSString", "NONE", s:green)
" call SetHighlight("TSStringRegex", "NONE", s:red)
" call SetHighlight("TSCharacter", "NONE", s:green)
" call SetHighlight("TSNumber", "NONE", s:yellow)
" call SetHighlight("TSBoolean", "NONE", s:yellow)
" call SetHighlight("TSFloat", "NONE", s:yellow)
" call SetHighlight("TSAnnotation", "NONE", s:blue)
" call SetHighlight("TSAttribute", "NONE", s:yellow)
" call SetHighlight("TSNamespace", "NONE", s:blue)
" call SetHighlight("TSFunctionBuiltin", "NONE", s:blue)
" call SetHighlight("TSFunction", "NONE", s:blue)
" call SetHighlight("TSFuncMacro", "NONE", s:blue)
" call SetHighlight("TSParameter", "NONE", s:red)
" call SetHighlight("TSParameterReference", "NONE", s:red)
" call SetHighlight("TSMethod", "NONE", s:blue)
" call SetHighlight("TSField", "NONE", s:yellow)
" call SetHighlight("TSProperty", "NONE", s:red)
" call SetHighlight("TSConstructor", "NONE", s:blue)
" call SetHighlight("TSConditional", "NONE", s:purple)
" call SetHighlight("TSRepeat", "NONE", s:purple)
" call SetHighlight("TSLabel", "NONE", s:purple)
" call SetHighlight("TSKeyword", "NONE", s:purple)
" call SetHighlight("TSKeywordFunction", "NONE", s:purple)
" call SetHighlight("TSKeywordOperator", "NONE", s:cyan)
" call SetHighlight("TSOperator", "NONE", s:cyan)
" call SetHighlight("TSExeption", "NONE", s:red)
" call SetHighlight("TSType", "NONE", s:blue)
" call SetHighlight("TSTypeBuiltin", "NONE", s:red)
" call SetHighlight("TSStructure", "NONE", s:yellow)
" call SetHighlight("TSInclude", "NONE", s:red)
" call SetHighlight("TSVariable", "NONE", s:fg)
" call SetHighlight("TSVariableBuiltin", "NONE", s:blue)
" call SetHighlight("TSStrong", "NONE", s:purple)
" call SetHighlight("TSEmphasis", "NONE", s:cyan)
" call SetHighlight("TSUnderline", "NONE", s:yellow)
" call SetHighlight("TSTitle", "NONE", s:yellow)
" call SetHighlight("TSLiteral", "NONE", s:green)
" call SetHighlight("TSUri", "NONE", s:green)

" Language and Plugin specific stuff
hi IndentBlanklineChar cterm=nocombine ctermbg=NONE ctermfg=8

hi Typedef ctermbg=NONE ctermfg=3
hi vimUserCommand ctermbg=NONE ctermfg=1 cterm=BOLD
    hi link vimMap vimUserCommand
    hi link vimLet vimUserCommand
    hi link vimCommand vimUserCommand
    hi link vimFTCmd vimUserCommand
    hi link vimAutoCmd vimUserCommand
    hi link vimNotFunc vimUserCommand
hi vimNotation ctermbg=NONE ctermfg=4
hi vimMapModKey ctermbg=NONE ctermfg=4
hi vimBracket ctermbg=NONE ctermfg=7
hi vimCommentString ctermbg=NONE ctermfg=8
hi htmlLink ctermbg=NONE ctermfg=1 cterm=underline
hi htmlBold ctermbg=NONE ctermfg=3 cterm=BOLD
hi htmlItalic ctermbg=NONE ctermfg=5
hi htmlEndTag ctermbg=NONE ctermfg=7
hi htmlTag ctermbg=NONE ctermfg=7
hi htmlTagName ctermbg=NONE ctermfg=1 cterm=BOLD
hi htmlH1 ctermbg=NONE ctermfg=7
    hi link htmlH2 htmlH1
    hi link htmlH3 htmlH1
    hi link htmlH4 htmlH1
    hi link htmlH5 htmlH1
    hi link htmlH6 htmlH1
hi cssMultiColumnAttr ctermbg=NONE ctermfg=2
    hi link cssFontAttr cssMultiColumnAttr
    hi link cssFlexibleBoxAttr cssMultiColumnAttr
hi cssBraces ctermbg=NONE ctermfg=7
    hi link cssAttrComma cssBraces
hi cssValueLength ctermbg=NONE ctermfg=7
hi cssUnitDecorators ctermbg=NONE ctermfg=7
hi cssValueNumber ctermbg=NONE ctermfg=7
    hi link cssValueLength cssValueNumber
hi cssNoise ctermbg=NONE ctermfg=8
hi cssTagName ctermbg=NONE ctermfg=1
hi cssFunctionName ctermbg=NONE ctermfg=4
hi scssSelectorChar ctermbg=NONE ctermfg=7
hi scssAttribute ctermbg=NONE ctermfg=7
    hi link scssDefinition cssNoise
hi sassidChar ctermbg=NONE ctermfg=1
hi sassClassChar ctermbg=NONE ctermfg=5
hi sassInclude ctermbg=NONE ctermfg=5
hi sassMixing ctermbg=NONE ctermfg=5
hi sassMixinName ctermbg=NONE ctermfg=4
hi javaScript ctermbg=NONE ctermfg=7
hi javaScriptBraces ctermbg=NONE ctermfg=7
hi javaScriptNumber ctermbg=NONE ctermfg=5
hi markdownH1 ctermbg=NONE ctermfg=7
    hi link markdownH2 markdownH1
    hi link markdownH3 markdownH1
    hi link markdownH4 markdownH1
    hi link markdownH5 markdownH1
    hi link markdownH6 markdownH1
hi markdownAutomaticLink ctermbg=NONE ctermfg=2 cterm=underline
    hi link markdownUrl markdownAutomaticLink
hi markdownError ctermbg=NONE ctermfg=7
hi markdownCode ctermbg=NONE ctermfg=3
hi markdownCodeBlock ctermbg=NONE ctermfg=3
hi markdownCodeDelimiter ctermbg=NONE ctermfg=5
hi markdownItalic cterm=Italic
hi markdownBold cterm=Bold
hi xdefaultsValue ctermbg=NONE ctermfg=7
hi rubyInclude ctermbg=NONE ctermfg=4
hi rubyDefine ctermbg=NONE ctermfg=5
hi rubyFunction ctermbg=NONE ctermfg=4
hi rubyStringDelimiter ctermbg=NONE ctermfg=2
hi rubyInteger ctermbg=NONE ctermfg=3
hi rubyAttribute ctermbg=NONE ctermfg=4
hi rubyConstant ctermbg=NONE ctermfg=3
hi rubyInterpolation ctermbg=NONE ctermfg=2
hi rubyInterpolationDelimiter ctermbg=NONE ctermfg=3
hi rubyRegexp ctermbg=NONE ctermfg=6
hi rubySymbol ctermbg=NONE ctermfg=2
hi rubyTodo ctermbg=NONE ctermfg=8
hi rubyRegexpAnchor ctermbg=NONE ctermfg=7
    hi link rubyRegexpQuantifier rubyRegexpAnchor
hi pythonOperator ctermbg=NONE ctermfg=5
hi pythonFunction ctermbg=NONE ctermfg=4
hi pythonRepeat ctermbg=NONE ctermfg=5
hi pythonStatement ctermbg=NONE ctermfg=1 cterm=Bold
hi pythonBuiltIn ctermbg=NONE ctermfg=4
hi phpMemberSelector ctermbg=NONE ctermfg=7
hi phpComparison ctermbg=NONE ctermfg=7
hi phpParent ctermbg=NONE ctermfg=7
hi cOperator ctermbg=NONE ctermfg=6
hi cPreCondit ctermbg=NONE ctermfg=5
