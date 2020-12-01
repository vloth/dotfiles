call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mcchrish/nnn.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'Olical/conjure', {'tag': 'v4.5.0'}

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

let g:gitgutter_sign_added="˖"            | let g:gitgutter_sign_modified="◈"
let g:gitgutter_sign_modified_removed="▰" | let g:gitgutter_sign_removed="྾"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap ge <Plug>(coc-rename)
nmap ga <Plug>(coc-codeaction)
vmap ga <Plug>(coc-codeaction-selected)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Organize :call CocAction('runCommand', 'editor.action.organizeImport')

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
