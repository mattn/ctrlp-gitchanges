if exists('g:loaded_ctrlp_gitchanges') && g:loaded_ctrlp_gitchanges
  finish
endif
let g:loaded_ctrlp_gitchanges = 1

let s:gitchanges_var = {
\  'init':   'ctrlp#gitchanges#init()',
\  'accept': 'ctrlp#acceptfile',
\  'lname':  'gitchanges',
\  'sname':  'gitchanges',
\  'type':   'path',
\  'sort':   0,
\  'nolim':  1,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:gitchanges_var)
else
  let g:ctrlp_ext_vars = [s:gitchanges_var]
endif

function! ctrlp#gitchanges#init()
  return map(filter(split(system('git status -s'), "\n"), 'v:val !~ "^?"'), "v:val[3:]")
endfunc

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#gitchanges#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
