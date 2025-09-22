let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif

let s:prefix = s:plugin.MapPrefix('c')

""
" Opens the sibling file in-place.
execute 'nnoremap <unique> <silent>' s:prefix . 's' ':ToggleSourceHeader<CR>'

""
" Opens the sibling file in a split window.
execute 'nnoremap <unique> <silent>' s:prefix . 'S' ':SplitSourceHeader<CR>'
