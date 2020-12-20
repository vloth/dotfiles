export ZSH="~/.oh-my-zsh"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
DISABLE_UNTRACKED_FILES_DIRTY="true"
KEYTIMEOUT=1
HISTSIZE=10000000
SAVEHIST=10000000
VISUAL=nvim
EDITOR=nvim

setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_reduce_blanks

export VISUAL EDITOR=nvim
export EDITOR
export PATH="/usr/local/opt/nss/bin:/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export BAT_THEME="Dracula"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
    echo "Creating a zgen save"
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/z
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/tmuxinator
    zgen load subnixr/minimal
    zgen load zsh-users/zsh-autosuggestions
    zgen load djui/alias-tips
    zgen save
fi

MNML_USER_CHAR=''
MNML_OK_COLOR=4
MNML_INSERT_CHAR=''
MNML_PROMPT=(mnml_status mnml_keymap)
MNML_RPROMPT=()
MNML_INFOLN=()
MNML_MAGICENTER=()

zstyle ':completion:*' menu select
source ~/.alias
# source $HOME/jdks/setup-zulu-11.sh
eval "$(jenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'
