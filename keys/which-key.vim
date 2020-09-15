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
let g:which_key_map['*'] = 'rg raw under cursor'
let g:which_key_map['/'] = 'rg raw in project'
let g:which_key_map['.'] = [ ':e $MYVIMRC'       , 'open init' ]
let g:which_key_map['p'] = [ '<C-^>'             , 'previous buffer' ]
let g:which_key_map['q'] = [ 'q'                 , 'quit' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'     , 'ranger' ]

" Group mappings

let g:which_key_map.f = {
      \ 'name' : '+search'  ,
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
      \ 'w' : [':Windows'   , 'search windows'],
      \ 'y' : [':Filetypes' , 'file types'],
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : [':bdelete'  , 'delete buffer'],
      \ 'l' : ['Buffers'   , 'list buffers'],
      \ 'o' : [':BufOnly'  , 'delete other'],
      \ 'p' : ['<C-^>'     , 'previous'],
      \ }

let g:which_key_map.t = {
      \ 'name' : '+tabline'   ,
      \ 'c' : [':tabnew'      , 'create tab'],
      \ 'd' : [':tabclose'    , 'delete tab'],
      \ 'n' : [':tabNext'     , 'next tab'],
      \ 'p' : [':tabprevious' , 'prev tab'],
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

let g:which_key_map.s = {
      \ 'name' : '+find & replace' ,
      \ 'b' : [':Farr --source=vimgrep'    , 'buffer'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }

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

