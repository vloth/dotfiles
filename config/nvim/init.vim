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

set nonumber
  \ nobackup noswapfile
  \ ignorecase smartcase
  \ expandtab tabstop=2 shiftwidth=2 softtabstop=2
  \ backspace=indent,eol,start
  \ hidden
  \ completeopt=longest wildmenu
  \ timeoutlen=1000 ttimeoutlen=0

nmap <silent> <leader>rr :source $MYVIMRC<cr>
nmap <c-c> :set hlsearch!<cr>
nmap <leader>c :bd<cr>
nmap <tab> :bnext<cr> | nnoremap <s-tab> :bprevious<cr>
vmap <silent> <leader>y :<cr>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<cr>

let g:nnn#set_default_mappings=0 | nnoremap <silent> <leader>e :NnnPicker %<CR>
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
nmap <leader>f :Files<cr> 
nmap <leader>g :GFiles<cr> 
nmap <leader>sw :Rg <C-R><C-W><CR> 
nmap <leader>ss :Rg 

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr> | nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>   | nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

let g:gitgutter_sign_added="˖"            | let g:gitgutter_sign_modified="◈"
let g:gitgutter_sign_modified_removed="▰" | let g:gitgutter_sign_removed="྾"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
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

source ~/.config/nvim/fzf-rg.vim
source ~/.config/nvim/themes/gruvbox.vim
source ~/.config/nvim/themes/base.vim
