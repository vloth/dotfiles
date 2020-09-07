call plug#begin('~/.local/share/nvim/plugged')

"base
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'mcchrish/nnn.vim'
" Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
"git
Plug 'airblade/vim-gitgutter'

call plug#end()
