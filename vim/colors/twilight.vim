" Vim color file
"
" Converted from Textmate theme Twilight using Coloration v0.2.4
"   http://github.com/sickill/coloration
" 256-color Terminal support added with Vim-toCterm
"   http://shawncplus.github.com/Vim-toCterm
"
" Slightly adjusted thereafter:
"   NonText background matches Normal
"   TabLine* match StatusLine*

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Twilight"

hi Cursor  guifg=NONE guibg=#a7a7a7 ctermbg=248 gui=NONE cterm=NONE
hi Visual  guifg=NONE guibg=#3c4043 ctermbg=238 gui=NONE cterm=NONE
hi CursorLine  guifg=NONE guibg=#1b1b1b ctermbg=234 gui=NONE cterm=NONE
hi CursorColumn  guifg=NONE guibg=#1b1b1b ctermbg=234 gui=NONE cterm=NONE
hi LineNr  guifg=#868686 ctermfg=102 guibg=#141414 ctermbg=233 gui=NONE cterm=NONE
hi VertSplit  guifg=#3f3f3f ctermfg=237 guibg=#3f3f3f ctermbg=237 gui=NONE cterm=NONE
hi MatchParen  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi StatusLine  guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=bold
hi StatusLineNC  guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=NONE cterm=NONE
hi TabLine  guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=NONE cterm=NONE
hi TabLineFill  guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=NONE cterm=NONE
hi TabLineSel  guifg=#f8f8f8 ctermfg=15 guibg=#3f3f3f ctermbg=237 gui=bold
hi Pmenu  guifg=#9b703f ctermfg=95 guibg=NONE gui=NONE cterm=NONE
hi PmenuSel  guifg=NONE guibg=#3c4043 ctermbg=238 gui=NONE cterm=NONE
hi IncSearch  guifg=NONE guibg=#343a44 ctermbg=237 gui=NONE cterm=NONE
hi Search  guifg=NONE guibg=#343a44 ctermbg=237 gui=NONE cterm=NONE
hi Directory  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi Folded  guifg=#5f5a60 ctermfg=59 guibg=#141414 ctermbg=233 gui=NONE cterm=NONE

hi Normal  guifg=#f8f8f8 ctermfg=15 guibg=#141414 ctermbg=233 gui=NONE cterm=NONE
hi Boolean  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi Character  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi Comment  guifg=#5f5a60 ctermfg=59 guibg=NONE gui=italic
hi Conditional  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi Constant  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi Define  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi Float  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi Function  guifg=#9b703f ctermfg=95 guibg=NONE gui=NONE cterm=NONE
hi Identifier  guifg=#f9ee98 ctermfg=228 guibg=NONE gui=NONE cterm=NONE
hi Keyword  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi Label  guifg=#8f9d6a ctermfg=107 guibg=NONE gui=NONE cterm=NONE
hi NonText  guifg=#4f4f4f ctermfg=239 guibg=#141414 ctermbg=233 gui=NONE cterm=NONE
hi Number  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi Operator  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi PreProc  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi Special  guifg=#f8f8f8 ctermfg=15 guibg=NONE gui=NONE cterm=NONE
hi SpecialKey  guifg=#4f4f4f ctermfg=239 guibg=#1b1b1b ctermbg=234 gui=NONE cterm=NONE
hi Statement  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi StorageClass  guifg=#f9ee98 ctermfg=228 guibg=NONE gui=NONE cterm=NONE
hi String  guifg=#8f9d6a ctermfg=107 guibg=NONE gui=NONE cterm=NONE
hi Tag  guifg=#9b703f ctermfg=95 guibg=NONE gui=NONE cterm=NONE
hi Title  guifg=#f8f8f8 ctermfg=15 guibg=NONE gui=bold
hi Todo  guifg=#5f5a60 ctermfg=59 guibg=NONE gui=inverse,bold,italic
hi Type  guifg=#9b703f ctermfg=95 guibg=NONE gui=NONE cterm=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi rubyFunction  guifg=#9b703f ctermfg=95 guibg=NONE gui=NONE cterm=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi rubySymbol  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi rubyConstant  guifg=#9b859d ctermfg=246 guibg=NONE gui=NONE cterm=NONE
hi rubyStringDelimiter  guifg=#8f9d6a ctermfg=107 guibg=NONE gui=NONE cterm=NONE
hi rubyBlockParameter  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE cterm=NONE
hi rubyInstanceVariable  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE cterm=NONE
hi rubyInclude  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi rubyGlobalVariable  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE cterm=NONE
hi rubyRegexp  guifg=#e9c062 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi rubyRegexpDelimiter  guifg=#e9c062 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi rubyEscape  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi rubyControl  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi rubyClassVariable  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE cterm=NONE
hi rubyOperator  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi rubyException  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE cterm=NONE
hi rubyPseudoVariable  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE cterm=NONE
hi rubyRailsUserClass  guifg=#9b859d ctermfg=246 guibg=NONE gui=NONE cterm=NONE
hi rubyRailsARAssociationMethod  guifg=#dad085 ctermfg=186 guibg=NONE gui=NONE cterm=NONE
hi rubyRailsARMethod  guifg=#dad085 ctermfg=186 guibg=NONE gui=NONE cterm=NONE
hi rubyRailsRenderMethod  guifg=#dad085 ctermfg=186 guibg=NONE gui=NONE cterm=NONE
hi rubyRailsMethod  guifg=#dad085 ctermfg=186 guibg=NONE gui=NONE cterm=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi erubyComment  guifg=#5f5a60 ctermfg=59 guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#dad085 ctermfg=186 guibg=NONE gui=NONE cterm=NONE
hi htmlTag  guifg=#ac885b ctermfg=137 guibg=NONE gui=NONE cterm=NONE
hi htmlEndTag  guifg=#ac885b ctermfg=137 guibg=NONE gui=NONE cterm=NONE
hi htmlTagName  guifg=#ac885b ctermfg=137 guibg=NONE gui=NONE cterm=NONE
hi htmlArg  guifg=#ac885b ctermfg=137 guibg=NONE gui=NONE cterm=NONE
hi htmlSpecialChar  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi javaScriptFunction  guifg=#f9ee98 ctermfg=228 guibg=NONE gui=NONE cterm=NONE
hi javaScriptRailsFunction  guifg=#dad085 ctermfg=186 guibg=NONE gui=NONE cterm=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi yamlKey  guifg=#9b703f ctermfg=95 guibg=NONE gui=NONE cterm=NONE
hi yamlAnchor  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE cterm=NONE
hi yamlAlias  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE cterm=NONE
hi yamlDocumentHeader  guifg=#8f9d6a ctermfg=107 guibg=NONE gui=NONE cterm=NONE
hi cssURL  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE cterm=NONE
hi cssFunctionName  guifg=#dad085 ctermfg=186 guibg=NONE gui=NONE cterm=NONE
hi cssColor  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi cssPseudoClassId  guifg=#9b703f ctermfg=95 guibg=NONE gui=NONE cterm=NONE
hi cssClassName  guifg=#9b703f ctermfg=95 guibg=NONE gui=NONE cterm=NONE
hi cssValueLength  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi cssCommonAttr  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE cterm=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE cterm=NONE
