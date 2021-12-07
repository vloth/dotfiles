# zsh init
export ZSH="/Users/franciscoberrocal/.oh-my-zsh"
ZSH_THEME="lambda"

# nvim 
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias vimdiff='nvim -d'
export EDITOR=nvim

# clojure
alias clj='clojure'

# tmux
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false

# config
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

HISTSIZE=10000000                # history size
SAVEHIST=10000000                # history save size
DISABLE_AUTO_TITLE="true"        # avoid window rename
KEYTIMEOUT=1                     # remove delay

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 } # skip history of failed commands

# plugins
plugins=(git vi-mode fasd zsh-autosuggestions tmux)

# platform version managers
eval "$(fnm env)"
[ -s "/Users/franciscoberrocal/.jabba/jabba.sh" ] && source "/Users/franciscoberrocal/.jabba/jabba.sh"

# init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# gpg
export GPG_TTY=$(tty)

# fzf key binding and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
--color=fg:#d0d0d0,hl:#5f87af --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff
--color=info:#23d18b,prompt:#d7005f,pointer:#bc3fbc
--color=marker:#87ff00,spinner:#bc3fbc,header:#e2e210'

