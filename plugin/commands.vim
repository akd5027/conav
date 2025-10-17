""
" @section Commands
"
" fpop-provided commands that be used in custom mappings or invoked directly.
" Commands provide 
let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif

""
" Switches between header and source file.
command ToggleSourceHeader call conav#ToggleSourceHeader()

""
" Switches between header and source file.
command SplitSourceHeader call conav#SplitSourceHeader()

""
" Switches between header and source file.
command -nargs=? FileSearch call conav#FileSearch(<f-args>)

""
" Switches between header and source file.
command FileSearchCurrent call conav#FileSearch(expand('%:h'))
