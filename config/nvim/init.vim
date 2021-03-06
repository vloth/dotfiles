call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mcchrish/nnn.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'Olical/conjure'
Plug 'junegunn/goyo.vim'
Plug 'bfontaine/zprint.vim'
Plug 'guns/vim-clojure-static'
Plug 'luochen1990/rainbow'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'rescript-lang/vim-rescript', { 'for': 'rescript' }

call plug#end()

au BufRead,BufNewFile *.res set filetype=rescript

if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
endif
let g:conjure#client#racket#stdio#command = "racket/base"

" light theme
" let g:rainbow_conf = { 'ctermfgs': ['DarkBlue', 'Magenta', 'Black', 'Red', 'DarkGray', 'DarkGreen', 'DarkYellow'] }
let g:rainbow_active = 0

let g:sexp_mappings = {
          \ 'sexp_swap_list_backward':     '',
          \ 'sexp_swap_list_forward':      '',
          \ 'sexp_swap_element_backward':  '',
          \ 'sexp_swap_element_forward':   '',
          \ }

let mapleader=" " | let maplocalleader=";"
set nonumber
  \ nobackup noswapfile
  \ ignorecase smartcase
  \ expandtab tabstop=2 shiftwidth=2 softtabstop=2
  \ backspace=indent,eol,start
  \ hidden
  \ completeopt=longest wildmenu
  \ timeoutlen=1000 ttimeoutlen=0

nmap <leader>m @@

nmap <silent> <leader>rr :source $MYVIMRC<cr>
nnoremap <leader>q :b # <bar> :bd! # <CR>
nmap <c-c> :set hlsearch!<cr>
vmap <silent> <leader>y :<cr>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \|<cr>
nmap <leader>p d:let @*=expand("%:p")<CR>

let g:coc_global_extensions = ['coc-conjure']
nmap <silent><localleader>f :%!joker --format %<cr>

let g:nnn#set_default_mappings=0 | nnoremap <silent> <leader>e :execute "NnnPicker " . expand('%:~:.')<CR>
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = { '<c-t>': 'tab split', '<c-x>': 'split', '<c-v>': 'vsplit' }
let g:nnn#command = 'nnn -o'

nmap <leader>f :Files<cr> 
nmap <leader>g :GFiles?<cr> 
nmap <leader><leader> :Buffers<cr> 
nmap <leader>sw :Rg <C-R><C-W><CR> 
nmap <leader>ss :Rg! 

let g:gitgutter_sign_added="˖"           | let g:gitgutter_sign_modified="𝜕"
let g:gitgutter_sign_modified_removed="𝑥" | let g:gitgutter_sign_removed="྾"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap ge <Plug>(coc-rename)
nmap ga <Plug>(coc-codeaction)
vmap ga <Plug>(coc-codeaction-selected)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Organize :call CocAction('runCommand', 'editor.action.organizeImport')
nmap <leader>z :Zen<cr> 

let g:goyo_width = 120
command! -nargs=0 Zen Goyo


function! s:goyo_enter()
  "if executable('tmux') && strlen($TMUX)
  "silent !tmux set status off
  "silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  "endif
endfunction

function! s:goyo_leave()
  "if executable('tmux') && strlen($TMUX)
  "silent !tmux set status on
  "silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  "endif
  source $HOME/vloth/dotfiles/themes/challenger_deep.vim
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
let $FZF_DEFAULT_OPTS = '--height 70% --reverse'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'highlight': 'Comment' } }
let g:fzf_action = { 'ctrl-q': 'wall | bdelete', 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

source $HOME/vloth/dotfiles/themes/challenger_deep.vim
