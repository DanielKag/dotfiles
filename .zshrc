# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#FZF_TAB
source ~/repos/fzf-tab/fzf-tab.plugin.zsh

# Rust
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
# configure rust environment
#
# - autocomplete
# - rust-analyzer
# - cargo audit
# - cargo-nextest
# - cargo fmt
# - cargo clippy
# - cargo edit
#
source $HOME/.cargo/env
if [ ! -f "$HOME/.config/rustlang/autocomplete/rustup" ]; then
  mkdir -p ~/.config/rustlang/autocomplete
  rustup completions zsh rustup >> ~/.config/rustlang/autocomplete/rustup
fi
# source "$HOME/.config/rustlang/autocomplete/rustup"
if ! command -v rust-analyzer &> /dev/null
then
  brew install rust-analyzer
fi
if ! cargo audit --version &> /dev/null; then
  cargo install cargo-audit --features=fix
fi
if ! cargo nextest --version &> /dev/null; then
  cargo install cargo-nextest
fi
if ! cargo fmt --version &> /dev/null; then
  rustup component add rustfmt
fi
if ! cargo clippy --version &> /dev/null; then
  rustup component add clippy
fi
if ! ls ~/.cargo/bin | grep 'cargo-upgrade' &> /dev/null; then
  cargo install cargo-edit
fi




# Path to your oh-my-zsh installation.
export ZSH="/Users/danielk/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
 zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting npm yarn node)

source $ZSH/oh-my-zsh.sh
source ~/.alias.sh

# Bad performances when loading zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ========================================= FZF config ====================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh
source $HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g '!.git/'' # Use rip-grep on FZF
# export FZF_DEFAULT_COMMAND='rg --files --follow --hidden' # Use rip-grep on FZF
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --bind esc:abort --reverse --color=fg:#d0d0d0,bg:#121212,hl:#5f87af --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'
# =========================================================================================================

# RPROMPT="%{$fg[yellow]%}[%*]"
# === vim mode
bindkey -v
export KEYTIMEOUT=1


# auto-suggest 
bindkey '^ ' autosuggest-accept


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#source ~/repos/fzf-tab/fzf-tab.plugin.zsh

# source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
eval "$(fnm env --use-on-cd)"

export PATH="/Users/danielk/.local/bin:$PATH"
export PATH="/Users/danielk/repos/git-fuzzy/bin:$PATH"

export EDITOR="vim"


confirm() {
    echo "About to run:" 
    echo "$*"
    read "reply?Continue? [N/y]"
    if [[ "$reply" =~ ^[Yy]$ ]]; then
      "$@"
    else
      echo 'cancel'
    fi
}

