" --------------------------------
" Name: Curtailed
" Description: Warm color scheme with a limited palette
" Author: Jack Magnus <jack@2c2d2e.com>
" Source: https://github.com/jadomag/curtailed
" License: BSD-2-Clause-Patent
" --------------------------------

" Utility functions
" --------------------------------

" Initialization: {{{

highlight clear

if exists("syntax_on")
    syntax reset
endif

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
  finish
endif

let g:colors_name = 'curtailed'

" }}}
" Link Function: {{{

" Arguments: from-group, to-group
function! s:Li(from, to)
    execute 'hi! link ' . a:from . ' ' . a:to
endfunction

" }}}
" Highlight Function: {{{

" Arguments: group, guifg, guibg, gui, guisp
function! s:Hl(group, ...)
  let fg = s:none " foreground color
  let bg = s:none " background color
  let special = s:none " special attributes

  " echo a:group . " " .  a:1

  if a:0 >= 1
      let fg = a:1
  endif

  if a:0 >= 2
      let bg = a:2
  endif

  if a:0 >= 3
      let special = a:3
  endif

  let histring = [ 'hi',
              \ a:group,
              \ 'guifg=' . fg,
              \ 'guibg=' . bg,
              \ 'gui=' . special
              \ ]

  " special color
  if a:0 >= 4
    call add(histring, 'guisp=' . a:4)
  endif

  execute join(histring, ' ')
endfunction

" }}}

" General definitions
" --------------------------------

" Palette: {{{

" light
let s:l0 = '#faebd7'
let s:l1 = '#e1d3c1'
let s:l2 = '#c8bcac'

" gray
let s:g0 = '#968d81'

" dark
let s:d2 = '#645e56'
let s:d1 = '#4b4640'
let s:d0 = '#322f2b'

" color
let s:co0 = '#a44646' " red
let s:co1 = '#b19146' " green
let s:co2 = '#C68146' " yellow
let s:co3 = '#648F80' " blue
let s:co4 = '#a56455' " magenta
let s:co5 = '#6EA279' " cyan

" color
let s:co0 = '#BB4B48' " red
let s:co1 = '#A49041' " green
let s:co2 = '#D09217' " yellow
let s:co3 = '#60907F' " blue
let s:co4 = '#B66F80' " magenta
let s:co5 = '#6FA17A' " cyan

if &background == 'light'
  let s:bg0 = s:l0
  let s:bg1 = s:l1
  let s:bg2 = s:l2

  let s:fg0 = s:d0
  let s:fg1 = s:g0
else
  let s:bg0 = s:d0
  let s:bg1 = s:d1
  let s:bg2 = s:d2

  let s:fg0 = s:l0
  let s:fg1 = s:g0
endif

" }}}
" Utility: {{{

let s:none      = 'NONE'

" }}}

" Global definitions
" --------------------------------

" Editor settings: {{{
"
call s:Hl('Normal', s:fg0, s:bg0)
call s:Hl('Cursor', s:none, s:none, 'inverse')
call s:Hl('CursorLine', s:none, s:bg1)

"}}}
" Number column: {{{

call s:Hl('CursorColumn', s:none, s:bg1)
call s:Hl('CursorLineNr', s:co2, s:bg1)
call s:Hl('FoldColumn', s:fg1, s:bg1)
call s:Hl('Folded', s:fg1, s:bg1)
call s:Hl('LineNr', s:fg1, s:bg0)
call s:Hl('SignColumn', s:none, s:bg1)

" }}}
" Window delimiters: {{{

call s:Hl('ColorColumn', s:none, s:bg1)
call s:Hl('TabLine', s:fg1, s:bg1)
call s:Hl('TabLineFill', s:fg1, s:bg1)
call s:Hl('TabLineSel', s:co1, s:bg1)
call s:Hl('VertSplit', s:fg1, s:bg0)

" }}}
" Navigation: {{{

call s:Hl('Directory', s:co4, s:bg0)
call s:Hl('Search', s:fg0, s:bg2)
call s:Hl('IncSearch', s:bg2, s:fg0, 'bold')

" }}}
" Prompt: {{{

call s:Hl('StatusLine', s:fg0, s:bg1)
call s:Hl('StatusLineNC', s:fg1, s:bg1)
call s:Hl('WildMenu', s:co4, s:bg1, 'bold')
call s:Hl('Question', s:co2, s:none, 'bold')
call s:Hl('Title', s:co1, s:none, 'bold')
call s:Hl('ModeMsg', s:co2, s:bg0, 'bold')
call s:Hl('MoreMsg', s:co2, s:bg0, 'bold')

" }}}
" Visual aid: {{{

call s:Hl('MatchParen', s:none, s:bg2, 'bold')
call s:Hl('Visual', s:none, s:bg1)
call s:Hl('VisualNOS', s:none, s:bg1)
call s:Hl('NonText', s:bg1, s:bg0)

call s:Hl('Todo', s:fg0, s:none, 'bold')
call s:Hl('Underlined', s:co4, s:none, 'underline')
call s:Hl('Error', s:bg0, s:co0, 'bold')
call s:Hl('ErrorMsg', s:bg0, s:co0, 'bold')
call s:Hl('WarningMsg', s:co0, s:none, 'bold')
call s:Hl('Ignore', s:none, s:none)
call s:Hl('SpecialKey', s:none, s:bg1)

" }}}
" Variable types: {{{

call s:Hl('Constant', s:co4, s:none)
call s:Li('Character', 'Constant')
call s:Li('Boolean', 'Constant')

call s:Li('Number', 'Constant')
call s:Li('Float', 'Number')

call s:Hl('String', s:co1, s:none)
call s:Li('StringDelimiter', 'String')

call s:Hl('Identifier', s:fg0, s:none)
call s:Li('Function', 'Identifier')

" }}}
" Language constructs: {{{

call s:Hl('Comment', s:fg1, s:none)
call s:Li('SpecialComment', 'Comment')

call s:Hl('Operator', s:fg0, s:none, 'bold')

call s:Hl('Statement', s:co0, s:none)
call s:Li('Conditional', 'Statement')
call s:Li('Exception', 'Statement')
call s:Li('Keyword', 'Statement')
call s:Li('Label', 'Statement')
call s:Li('Repeat', 'Statement')
call s:Li('Structure', 'Statement')
call s:Li('Tag', 'Statement')

call s:Hl('Special', s:co0, s:none)
call s:Li('Debug', 'Special')
call s:Li('Delimiter', 'Special')
call s:Li('SpecialChar', 'Special')
call s:Li('StorageClass', 'Special')

call s:Hl('PreProc', s:co3, s:none)
call s:Li('Define', 'PreProc')
call s:Li('Include', 'PreProc')
call s:Li('Macro', 'PreProc')
call s:Li('PreCondit', 'PreProc')
call s:Li('Typedef', 'PreProc')

call s:Hl('Type', s:co2, s:none)

" }}}
" Diff: {{{

call s:Hl('DiffAdd', s:bg0, s:co1)
call s:Hl('DiffChange', s:bg0, s:co4)
call s:Hl('DiffDelete', s:bg0, s:co0)
call s:Hl('DiffText', s:bg0, s:co2)

" }}}
" Completion menu: {{{

call s:Hl('Pmenu', s:fg0, s:bg1)
call s:Hl('PmenuSel', s:bg1, s:co3)
call s:Hl('PmenuSbar', s:none, s:bg1)
call s:Hl('PmenuThumb', s:none, s:bg2)

" }}}
" Spelling: {{{

call s:Hl('SpellBad', s:none, s:none, 'undercurl', s:co0)
call s:Hl('SpellCap', s:co1, s:none, 'bold')
call s:Hl('SpellLocal', s:none, s:none, 'undercurl', s:co4)
call s:Hl('SpellRare', s:none, s:none, 'undercurl', s:co4)

" }}}
" Neovim: {{{

call s:Hl('RedrawDebugNormal', s:bg0, s:fg0)
call s:Hl('RedrawDebugClear', s:bg0, s:co2)
call s:Hl('RedrawDebugComposed', s:bg0, s:co1)
call s:Hl('RedrawDebugRecompose', s:bg0, s:co0)

call s:Li('NvimFigureBrace', 'Error')
call s:Li('NvimInternalError', 'Error')
call s:Li('NvimInvalidSingleQuotedUnknownEscape', 'Error')
call s:Li('NvimSingleQuotedUnknownEscape', 'Error')

" }}}

" Plugin definitions
" --------------------------------

" ALE: {{{

call s:Hl('ALEError', s:none, s:none, 'undercurl', s:co0)
call s:Hl('ALEErrorSign', s:co0, s:bg1)
call s:Hl('ALEWarning', s:none, s:none, 'undercurl', s:co2)
call s:Hl('ALEWarningSign', s:co2, s:bg1)
call s:Hl('ALEInfo', s:none, s:none)
call s:Hl('ALEInfoSign', s:co4, s:bg1)

" }}}
" EasyMotion: {{{

call s:Li('EasyMotionTarget', 'Search')
call s:Li('EasyMotionTarget2First', 'IncSearch')
call s:Li('EasyMotionTarget2Second', 'Search')
call s:Li('EasyMotionShade', 'Comment')

" }}}
" GitGutter: {{{

call s:Hl('GitGutterAdd', s:co1, s:bg1)
call s:Hl('GitGutterChange', s:co2, s:bg1)
call s:Hl('GitGutterDelete', s:co0, s:bg1)
call s:Hl('GitGutterChangeDelete', s:co0, s:bg1)

" }}}

" Filetype definitions
" --------------------------------

" C: {{{

call s:Li('cTypedef', 'Typedef')

" }}}
" Java: {{{

call s:Hl('javaDocTags', s:co3, s:none)
call s:Hl('javaDocParam', s:fg0, s:none)

" }}}
" Javascript: {{{

call s:Li('javaScriptBraces', 'Normal')
call s:Li('javaScriptFunction', 'Statement')
call s:Li('javaScriptIdentifier', 'Special')
call s:Li('javaScriptMember', 'Identifier')
call s:Li('javaScriptNumber', 'Number')
call s:Li('javaScriptNull', 'Constant')
call s:Li('javaScriptParens', 'Normal')

" }}}
" Lua: {{{

call s:Li('luaIn', 'Normal')
call s:Li('luaFunction', 'Statement')
call s:Li('luaTable', 'Normal')

" }}}
" Markdown: {{{

call s:Hl('markdownH1', s:co1, s:none, 'bold')
call s:Li('markdownH2', 'markdownH1')
call s:Li('markdownH3', 'markdownH1')
call s:Li('markdownH4', 'markdownH1')
call s:Li('markdownH5', 'markdownH1')
call s:Li('markdownH6', 'markdownH1')

call s:Hl('markdownCode', s:co4, s:none)
call s:Li('markdownCodeBlock', 'markdownCode')
call s:Li('markdownCodeDelimiter', 'markdownCode')

call s:Li('markdownBlockquote', 'Comment')
call s:Li('markdownListMarker', 'Comment')
call s:Li('markdownOrderedListMarker', 'Comment')
call s:Li('markdownRule', 'Comment')
call s:Li('markdownHeadingRule', 'Comment')
call s:Li('markdownUrlDelimiter', 'Comment')
call s:Li('markdownLinkDelimiter', 'Comment')
call s:Li('markdownLinkTextDelimiter', 'Comment')
 
call s:Hl('markdownHeadingDelimiter', s:co2, s:none)
call s:Hl('markdownUrl', s:co4, s:none)
call s:Hl('markdownUrlTitleDelimiter', s:co1, s:none)

call s:Hl('markdownLinkText', s:fg1, s:none, 'underline')
call s:Li('markdownIdDeclaration', 'markdownLinkText')

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
