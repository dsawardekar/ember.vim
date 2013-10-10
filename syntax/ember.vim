if exists('b:current_syntax') && b:current_syntax == 'handlebars.ember'
  finish
end

" include keywords
syn keyword emberHbsInclude outlet partial render containedin=hbsHandlebars

" helpers
syn keyword emberHbsHelper view input textarea containedin=hbsHandlebars

" bindings
syn keyword emberHbsBinding bind-attr containedin=hbsHandlebars

" actions
syn keyword emberHbsAction action containedin=hbsHandlebars

" attributes
syn keyword emberHbsArg containedin=hbsHandlebars size src start target text type url disabled checked name this
syn keyword emberHbsArg containedin=hbsHandlebars valign value vlink vspace width wrap cols rows
syn match emberHbsArg containedin=hbsHandlebars '\v\i+Binding'
syn keyword htmlArg containedin=htmlTag bind-attr bindAttr
syn match emberAttrDelim containedin=htmlTag '{{'
syn match emberAttrDelim containedin=htmlTag '}}'

" highlighting
hi def link emberHbsInclude Include
hi def link emberHbsHelper Function
hi def link emberHbsBinding Identifier
hi def link emberHbsAction Define
hi def link emberHbsArg Type
hi def link emberAttrDelim Delimiter

" default styles
if !exists('g:ember_handlebars_no_default_styles')
  hi htmlArg guifg=3 ctermfg=3
  hi Delimiter guifg=4 ctermfg=4
end

let b:current_syntax = 'handlebars.ember'
