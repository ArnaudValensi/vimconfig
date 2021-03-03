" Leader Key Maps

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=500

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" " Change the colors if you want
" highlight default link WhichKey          Operator
" highlight default link WhichKeySeperator DiffAdded
" highlight default link WhichKeyGroup     Identifier
" highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map[' '] = [ ':Buffers'          , 'list buffers' ]
let g:which_key_map['d'] = [ ':Bd'               , 'list buffers delete' ]
let g:which_key_map['*'] = 'rg raw under cursor'
let g:which_key_map['/'] = 'rg raw in project'
let g:which_key_map['.'] = [ ':e $MYVIMRC'       , 'open init' ]
let g:which_key_map['q'] = [ 'q'                 , 'quit' ]

" Group mappings

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : [':bdelete'  , 'delete buffer'],
      \ 'l' : ['Buffers'   , 'list buffers'],
      \ 'o' : [':BufOnly'  , 'delete other'],
      \ 'p' : ['<C-^>'     , 'previous'],
      \ }

let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition (gd)'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation (gi)'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename (rr)'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references (gr)'],
      \ 's' : [':CocList -I symbols'                 , 'search symbols'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition (gy)'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

let g:which_key_map.f = {
      \ 'name' : '+find'  ,
      \ '/' : [':History/'  , 'history'],
      \ ';' : [':Commands'  , 'commands'],
      \ 'a' : [':Ag'        , 'text ag'],
      \ 'A' : [':Ag!'       , 'text ag fullscreen'],
      \ 'b' : [':BLines'    , 'current buffer'],
      \ 'B' : [':Buffers'   , 'opened buffers'],
      \ 'c' : [':Commits'   , 'commits'],
      \ 'C' : [':BCommits'  , 'buffer commits'],
      \ 'f' : [':GFiles'    , 'git files'],
      \ 'F' : [':GFiles?'   , 'modified git files'],
      \ 'g' : [':Files'     , 'files'],
      \ 'h' : [':History'   , 'file history'],
      \ 'H' : [':History:'  , 'command history'],
      \ 'l' : [':Lines'     , 'lines'] ,
      \ 'm' : [':Marks'     , 'marks'] ,
      \ 'M' : [':Maps'      , 'normal maps'] ,
      \ 'p' : [':Helptags'  , 'help tags'] ,
      \ 'P' : [':Tags'      , 'project tags'],
      \ 's' : [':Snippets'  , 'snippets'],
      \ 'S' : [':Colors'    , 'color schemes'],
      \ 'r' : [':Rg'        , 'text rg'],
      \ 'R' : [':Rg!'       , 'text rg fullscreen'],
      \ 'u' : ['<Plug>(coc-references)' , 'usage'],
      \ 'w' : [':Windows'   , 'search windows'],
      \ 'y' : [':Filetypes' , 'file types'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'd' : [':GitGutterPreviewHunk'  , 'previous diff'],
      \ 'n' : [':GitGutterNextHunk'  , 'next diff'],
      \ 'p' : [':GitGutterPrevHunk'  , 'previous diff'],
      \ }

let g:which_key_map.m = [':make', 'make']

" Stamp
" https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
" nnoremap S ciw<C-r>0<Esc>
" vnoremap S "_d"0P

" https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/11993928#11993928
" nnoremap <leader>d "_d
" xnoremap <leader>d "_d
" xnoremap <leader>p "_dP
let g:which_key_map.p = 'paste yank register ("0p)'
noremap <leader>p "0p

let g:which_key_map.r = {
      \ 'name' : '+replace' ,
      \ 'P' : [':Farr --source=vimgrep' , 'in project (Far)'],
      \ }

nnoremap <Leader>rf :%s///g<Left><Left>
let g:which_key_map.r.f = 'in file'

xnoremap <Leader>rs :s///g<Left><Left>
let g:which_key_map.r.s = 'in selection'

nnoremap <Leader>re :.,$s///g<Left><Left>
let g:which_key_map.r.e = 'to end of file'

nnoremap <leader>rp :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:which_key_map.r.p = 'in project (CocSearch)'

let g:which_key_map.t = {
      \ 'name' : '+tabline'   ,
      \ 'c' : [':tabnew'      , 'create tab'],
      \ 'd' : [':tabclose'    , 'delete tab'],
      \ 'n' : [':tabNext'     , 'next tab'],
      \ 'p' : [':tabprevious' , 'prev tab'],
      \ }

let g:which_key_map.u = {
      \ 'name' : '+utils' ,
      \ 'n' : [':NV!'    , 'notational-fzf'],
      \ 'r' : [':RnvimrToggle'    , 'ranger'],
      \ }

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other window'],
      \ 'd' : ['<C-W>c'     , 'delete window'],
      \ '-' : ['<C-W>s'     , 'split window below'],
      \ '|' : ['<C-W>v'     , 'split window right'],
      \ '2' : ['<C-W>v'     , 'layout double columns'],
      \ 'h' : ['<C-W>h'     , 'window left'],
      \ 'j' : ['<C-W>j'     , 'window below'],
      \ 'l' : ['<C-W>l'     , 'window right'],
      \ 'k' : ['<C-W>k'     , 'window up'],
      \ 'o' : ['<C-W>o'     , 'only'],
      \ '=' : ['<C-W>='     , 'balance window'],
      \ 's' : ['<C-W>s'     , 'split window below'],
      \ 'v' : ['<C-W>v'     , 'split window below'],
      \ '?' : ['Windows'    , 'fzf window'],
      \ }

let g:which_key_map.u.f = {
      \ 'name' : '+copy file path' ,
      \ }

nnoremap <Leader>ufp :let @+ = expand("%:p")<cr>
nnoremap <Leader>ufd :let @+ = expand("%:h")<cr>
nnoremap <Leader>uff :let @+ = expand("%:t")<cr>
let g:which_key_map.u.f.p = 'full'
let g:which_key_map.u.f.d = 'directory'
let g:which_key_map.u.f.f = 'file'

" let g:which_key_map['<tab>'] = 'previous buffer'
nnoremap <leader><tab> <C-^>

" " g is for git
" let g:which_key_map.g = {
"       \ 'name' : '+git' ,
"       \ 'a' : [':Git add .'                        , 'add all'],
"       \ 'A' : [':Git add %'                        , 'add current'],
"       \ 'b' : [':Git blame'                        , 'blame'],
"       \ 'B' : [':GBrowse'                          , 'browse'],
"       \ 'c' : [':Git commit'                       , 'commit'],
"       \ 'd' : [':Git diff'                         , 'diff'],
"       \ 'D' : [':Gdiffsplit'                       , 'diff split'],
"       \ 'g' : [':GGrep'                            , 'git grep'],
"       \ 'G' : [':Gstatus'                          , 'status'],
"       \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
"       \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
"       \ 'i' : [':Gist -b'                          , 'post gist'],
"       \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
"       \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
"       \ 'l' : [':Git log'                          , 'log'],
"       \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
"       \ 'p' : [':Git push'                         , 'push'],
"       \ 'P' : [':Git pull'                         , 'pull'],
"       \ 'r' : [':GRemove'                          , 'remove'],
"       \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
"       \ 'S' : [':!git status'                      , 'status'],
"       \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
"       \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
"       \ 'v' : [':GV'                               , 'view commits'],
"       \ 'V' : [':GV!'                              , 'view buffer commits'],
"       \ }

" " l is for language server protocol
" let g:which_key_map.l = {
"       \ 'name' : '+lsp' ,
"       \ '.' : [':CocConfig'                          , 'config'],
"       \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
"       \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
"       \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
"       \ 'b' : [':CocNext'                            , 'next action'],
"       \ 'B' : [':CocPrev'                            , 'prev action'],
"       \ 'c' : [':CocList commands'                   , 'commands'],
"       \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
"       \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
"       \ 'e' : [':CocList extensions'                 , 'extensions'],
"       \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
"       \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
"       \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
"       \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
"       \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
"       \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
"       \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
"       \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
"       \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
"       \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
"       \ 'O' : [':CocList outline'                    , 'outline'],
"       \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
"       \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
"       \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
"       \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
"       \ 'R' : ['<Plug>(coc-references)'              , 'references'],
"       \ 's' : [':CocList -I symbols'                 , 'references'],
"       \ 'S' : [':CocList snippets'                   , 'snippets'],
"       \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
"       \ 'u' : [':CocListResume'                      , 'resume list'],
"       \ 'U' : [':CocUpdate'                          , 'update CoC'],
"       \ 'v' : [':Vista!!'                            , 'tag viewer'],
"       \ 'z' : [':CocDisable'                         , 'disable CoC'],
"       \ 'Z' : [':CocEnable'                          , 'enable CoC'],
"       \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

