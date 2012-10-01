" BracketComplete.vim: Insert mode completion that completes text inside various brackets.
"
" DEPENDENCIES:
"   - Requires Vim 7.0 or higher.
"   - BracketComplete.vim autoload script
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	02-Oct-2012	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_BracketComplete') || (v:version < 700)
    finish
endif
let g:loaded_BracketComplete = 1

"- mappings --------------------------------------------------------------------

inoremap <script> <expr> <Plug>(BracketComplete) BracketComplete#Expr()
if ! hasmapto('<Plug>(BracketComplete)', 'i')
    imap <C-x>) <Plug>(BracketComplete)
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
