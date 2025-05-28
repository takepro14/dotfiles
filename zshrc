# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Environment variables
export LANG=en_US.UTF-8
export EDITOR=vim
export PURE_PROMPT_SYMBOL="$"
export PATH="$HOME/go/bin:$PATH"

# Options
setopt nobeep
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
stty -ixon # Disable XON/XOFF flow control to allow Ctrl+S for history search.

# Keymaps
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey -e # enable emacs style key bind

# Aliases
alias ls='ls -G'
alias ll="ls -lhG -D '%y-%m-%d %H:%M'"
alias la="ls -lahG -D '%y-%m-%d %H:%M'"

# Plugins
source ~/.zplug/init.zsh
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo
    zplug install
  fi
fi
zplug load

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
