" TODO: Add this config for AgRaw and RgRaw,

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>,
"   \                    fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                    <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

let g:coc_fzf_preview = 'right:50%'

" Delete buffers (:BD)
" https://github.com/junegunn/fzf.vim/pull/733
function! s:format_buffer(b)
  let l:name = bufname(a:b)
  let l:name = empty(l:name) ? '[No Name]' : fnamemodify(l:name, ":p:~:.")
  let l:flag = a:b == bufnr('')  ? '%' :
          \ (a:b == bufnr('#') ? '#' : ' ')
  let l:modified = getbufvar(a:b, '&modified') ? ' [+]' : ''
  let l:readonly = getbufvar(a:b, '&modifiable') ? '' : ' [RO]'
  let l:extra = join(filter([l:modified, l:readonly], '!empty(v:val)'), '')
  return substitute(printf("[%s] %s\t%s\t%s", a:b, l:flag, l:name, l:extra), '^\s*\|\s*$', '', 'g')
endfunction

function! s:delete_buffers()
  let l:preview_window = get(g:, 'fzf_preview_window', &columns >= 120 ? 'right': '')
  let l:options = [
  \   '-m',
  \   '--tiebreak=index',
  \   '-d', '\t',
  \   '--prompt', 'Delete> '
  \ ]
  if len(l:preview_window)
    let l:options = extend(l:options, get(fzf#vim#with_preview(
          \   {"placeholder": "{2}"},
          \   l:preview_window
          \ ), 'options', []))
  endif


  return fzf#run(fzf#wrap({
  \ 'source':  map(
  \   filter(
  \     range(1, bufnr('$')),
  \     {_, nr -> buflisted(nr) && !getbufvar(nr, "&modified")}
  \   ),
  \   {_, nr -> s:format_buffer(nr)}
  \ ),
  \ 'sink*': {
  \   lines -> execute('bdelete ' . join(map(lines, {
  \     _, line -> substitute(split(line)[0], '^\[\|\]$', '', 'g')
  \   })), 'silent!')
  \ },
  \ 'options': l:options,
  \}))
endfunction

command! Bd call s:delete_buffers()

" Dracula colors
let g:fzf_colors = {
\ 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal'],
\ 'hl': ['fg', 'Search'],
\ 'fg+': ['fg', 'Normal'],
\ 'bg+': ['bg', 'CursorLine'],
\ 'hl+': ['fg', 'DraculaOrange'],
\ 'info': ['fg', 'DraculaPurple'],
\ 'border': ['fg', 'Ignore'],
\ 'prompt': ['fg', 'DraculaGreen'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker': ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }
