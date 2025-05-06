let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.colorscheme      = 'one'

let g:lightline.tabline          = {'left': [['buffers']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" let g:lightline.active           = {'left':[ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified', 'fugitive' ] ]}
let g:lightline.active           = {'left':[ [ 'mode', 'paste' ], [ 'readonly', 'smart_filename', 'modified', 'fugitive' ] ]}
let g:lightline.component_function = {
    \   'fugitive' : 'LightlineFugitive',
    \   'smart_filename' : 'LightlineFilename'
    \ }

function! LightlineFugitive()
  if exists('*FugitiveStatusline')
    let branch = FugitiveStatusline()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  let filename = expand('%:t')
  if filename == ''
    return '[No Name]'
  endif

  " Get list of all buffers
  let buflist = map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)')

  " Check for duplicate filenames in different directories
  let duplicates = {}
  for buf in buflist
    let name = fnamemodify(buf, ':t')
    if name != ''
      let duplicates[name] = get(duplicates, name, 0) + 1
    endif
  endfor

  " If this filename exists more than once, show parent directory too
  if get(duplicates, filename, 0) > 1
    return expand('%:p:h:t') . '/' . filename
  else
    return filename
  endif
endfunction

set showtabline=2
