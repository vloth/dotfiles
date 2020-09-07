call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'mcchrish/nnn.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'airblade/vim-gitgutter'

call plug#end()

let mapleader=" " | let maplocalleader=";"

nnoremap rr :source ~/.config/nvim/init.vim<cr>
let g:theme_bg='235'
let g:theme_accent1='10'  | let g:theme_accent2='11'
let g:theme_neutral='240' | let g:theme_neutral2='243' | let g:theme_black='16'
let g:theme_error='9'     | let g:theme_warn='3'       | let g:theme_info='4'    | let g:theme_success='2' 
source ~/.config/nvim/themes/gruvbox.vim

set nonumber
  \ nobackup noswapfile
  \ ignorecase smartcase
  \ expandtab tabstop=2 shiftwidth=2 softtabstop=2
  \ backspace=indent,eol,start
  \ hidden

nnoremap <c-c> :set hlsearch!<cr>
nnoremap <leader>c :bd<cr>
nnoremap <tab> :bnext<cr> | nnoremap <s-tab> :bprevious<cr>

vnoremap <silent> <leader>y :<cr>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<cr>

let g:nnn#set_default_mappings=0 | nnoremap <silent> <leader>e :NnnPicker %<CR>
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
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
nnoremap <leader>f :Files<cr> | nnoremap <leader>g :GFiles<cr> | nnoremap <leader>sw :Rg <C-R><C-W><CR> | nnoremap <leader>ss :Rg 

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr> | nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr> | nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
set timeoutlen=1000 ttimeoutlen=0

let g:gitgutter_sign_added="˖" | let g:gitgutter_sign_modified="◈"
let g:gitgutter_sign_modified_removed="◬" | let g:gitgutter_sign_removed="྾"
