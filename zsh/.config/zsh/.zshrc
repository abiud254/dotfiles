### ---- ZSH HOME -----------------------------------
# export ZDOTDIR=$HOME/.config/zsh

### XDG VARIABLES
export XDG_SESSION_TYPE=X11
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
# export XDG_RUNTIME_DIR=$HOME/.var/run

### EXPORT OTHER VARIABLES
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/"gtk-2.0"/gtkrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
# export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

### JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/java-22-openjdk"

### FLUTTER PATH VARIABLES
# export ANDROID_HOME="$HOME/DEV/FLUTTER/SDK"
# export PATH=$PATH:"$ANDROID_HOME/flutter/bin" # flutter-sdk
# export PATH=$PATH:"$ANDROID_HOME/cmdline-tools/latest/bin" # cmdline-tools
# export PATH=$PATH:"$ANDROID_HOME/platform-tools" # platform-tools

### EXPORT ALIAS VARIABLES
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias adb='HOME="$XDG_DATA_HOME"/android adb'
# alias mysql-workbench="mysql-workbench --configdir=$XDG_DATA_HOME/mysql/workbench"

### SET DEFAULT TERMINAL
export TERMINAL=/usr/bin/alacritty

### SET DEFAULT EDITOR
export EDITOR=/usr/bin/nvim

#########################
#### PATH VARIABLES
#########################
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$JAVA_HOME/bin"
export PATH=$PATH:"$HOME/.tmuxifier/bin"

####################################################################################################
### ---- autocompletions -----------------------------------
fpath=(~/.zsh/site-functions $fpath)
autoload -Uz compinit && compinit

### ---- Completion options and styling -----------------------------------
zstyle ':completion:*' menu select # selectable menu
#zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'  # case insensitive completion
zstyle ':completion:*' list-colors '' # colorize completion lists
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01' # colorize kill list

### zcompdump
##You must manually create the $XDG_CACHE_HOME/zsh directory if it doesn't exist yet.
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION" 

### ---- HISTORY ------------------------------------------
### -------------------------------------------------------
# History file for zsh
HISTFILE=$ZDOTDIR/.zsh_history

# How many commands to store in history
HISTSIZE=100000
SAVEHIST=100000

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file

# History Search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

### ------ ALIASES ---------------------------
### ------------------------------------------

# ---- switched to abbreviations ------------
alias gst="git status"
alias grep='grep --color'
# ----- eza ---------------------------------
alias ls="eza --icons --group-directories-first -l"
alias ll="eza --icons --group-directories-first -la"
# ----- neovim ---------------------------------
alias v="nvim"

### ----------------------------------------------------------------------------

### ---- Starship -----------------------------------
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# ------ Zoxide -------------------------------------
eval "$(zoxide init --cmd cd zsh)"

### --- ZSH Syntax HIghlighting ------------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### --- ZSH AutoSuggestions ---------------------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

### VSCODE Terminal Integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

### Tmux Default Session
# if command -v tmux &> /dev/null; then
#     if [ -z "$TMUX" ]; then
#         # Kill any existing session named 'default' (ignore error if it doesn't exist)
#         tmux kill-session -t default 2>/dev/null
#         # Start a new session named 'default'
#         tmux new-session -s default
#     fi
# fi
