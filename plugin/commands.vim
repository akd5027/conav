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
" Opens the related source/header file in a split.
command SplitSourceHeader call conav#SplitSourceHeader()

""
" Does a fuzzy search across all files beneath the provided path relative to
" the ViM working directory. If the current buffer is not a file then the
" current working directory of ViM will be used.
command -nargs=? FileSearch call conav#FileSearch(<f-args>)

""
" Does a fuzzy search across all files beneath the current buffers directory.
"
" If the current buffer is not a file then the current working directory of
" ViM will be used.
command FileSearchCurrent call conav#FileSearch(expand('%:h'))
