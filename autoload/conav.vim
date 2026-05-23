let s:plugin = maktaba#plugin#Get('conav')

let s:source_extensions = #{
      \c: ['c'],
      \cpp: ['cc', 'cpp'],
    \}

function! s:AcquireSiblingFile() abort
  let root = expand('%:r')

  if expand('%:e') ==# 'h'
    for ext in s:source_extensions['c'] + s:source_extensions['cpp']
      let target_file = l:root .. '.' .. l:ext
      if filereadable(l:target_file)
        return l:target_file
      endif
    endfor
  else
    let target_file = l:root .. '.h'
    if filereadable(l:target_file)
      return l:target_file
    endif
  endif

  throw 'Could not find associated source/header'
endfunction

""
" @public
" Swiches between the current file and its related source/header file.
"
" C and C++ files are supported, in the event that 
function! conav#ToggleSourceHeader()
  execute 'edit ' .. s:AcquireSiblingFile()
endfunction

""
" @public
" Opens the sibling file in a split buffer
function! conav#SplitSourceHeader()
  execute 'vertical split ' .. s:AcquireSiblingFile()
endfunction

""
" @public
" Allows for a fuzzy-search on files beneath the provided [directory].
"
" In the event that no [directory] is provided or the provided directory is
" the empty, the current vim working directory will be used .
function! conav#FileSearch(...)
  let dir = get(a:, 1, '.')
  if empty(l:dir)
    let dir = '.'
  endif

  let files = maktaba#syscall#Create(['find', l:dir, '-type', 'f', '-not', '-name', '*.sw[op]']).Call().stdout
        \->split('\n')
        \->map('substitute(v:val, "^\./", "", "")')

  call fpop#FilePicker(l:files)
endfunction
