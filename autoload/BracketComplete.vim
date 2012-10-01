" BracketComplete.vim: Insert mode completion that completes text inside various brackets.
"
" DEPENDENCIES:
"   - MotionComplete.vim autoload script
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	02-Oct-2012	file creation

let s:openBrackets  = '[({<'
let s:closeBrackets = '])}>'
let s:bracketPattern = printf('[%s][^%s]*\%%#', s:openBrackets, s:openBrackets)
function! BracketComplete#Expr()
    let l:bracketCol = searchpos(s:bracketPattern, 'bnW', line('.'))[1]
    if l:bracketCol == 0
	return "\<C-\>\<C-o>\<Esc>" | " Beep.
    endif

    let l:startBracket = strpart(getline('.'), l:bracketCol - 1, 1)
    let l:endBracket = s:closeBrackets[stridx(s:openBrackets, l:startBracket)]   " Note: As these are all ASCII, byte-arithmetic is okay.
    let l:hasEndBracket = (search('\%#\_s*\V' . l:endBracket, 'cnW') != 0)
"****Dechomsg '****' string(l:startBracket) string(l:endBracket) l:hasEndBracket
    " Use the inner text object when we're just filling in text between existing
    " brackets; otherwise, include the closing bracket in the match.
    let [l:startCol, l:innerOuter] = (l:hasEndBracket ? [l:bracketCol + 1, 'i'] : [l:bracketCol, 'a'])
    return MotionComplete#Expr(l:innerOuter . l:startBracket, [l:startCol, col('.')])
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
