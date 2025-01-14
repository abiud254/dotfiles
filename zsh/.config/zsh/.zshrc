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

### NPM VARIABLES
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm

### JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/java-23-openjdk/"

### GO
export GOPATH="$XDG_DATA_HOME"/go

### FLUTTER PATH VARIABLES
export ANDROID_HOME="$HOME/DEV/Tools/android-sdk/"
# export ANDROID_AVD_HOME="$HOME/.android/avd"
export PATH=$PATH:"$HOME/DEV/Tools/flutter/bin/" # flutter-sdk
export PATH=$PATH:"$ANDROID_HOME/cmdline-tools/latest/bin" # cmdline-tools
export PATH=$PATH:"$ANDROID_HOME/platform-tools" # platform-tools

### EXPORT ALIAS VARIABLES
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias adb='HOME="$XDG_DATA_HOME"/android adb'
# alias mysql-workbench="mysql-workbench --configdir=$XDG_DATA_HOME/mysql/workbench"

### PIPENV
export PIPENV_SHELL_FANCY=1

### PYENV
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv

### SET DEFAULT TERMINAL
# export TERMINAL=/usr/bin/alacritty
export TERMINAL=/sbin/ghostty
export TERMCMD="ghostty"

### SET DEFAULT EDITOR
export EDITOR=/usr/bin/nvim

#########################
#### PATH VARIABLES
#########################
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.local/share/cargo/bin/"
export PATH=$PATH:"$JAVA_HOME/bin"
export PATH=$PATH:"$HOME/.tmuxifier/bin"
# My Scripts
export PATH=$PATH:"$HOME/.config/rclone/scripts/mount/"
export PATH=$PATH:"$HOME/.config/rclone/scripts/unmount/"
export PATH=$PATH:"$HOME/.config/dunst/scripts/"

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
# ----- keepassxc-cli -----------------------
alias kp-search="keepassxc-cli search /home/abiudy/Documents/KeePassXC/Passwords.kdbx"
alias kp-show="keepassxc-cli show /home/abiudy/Documents/KeePassXC/Passwords.kdbx --all"
alias kp-clip="keepassxc-cli clip /home/abiudy/Documents/KeePassXC/Passwords.kdbx"
alias kp-clip-a="keepassxc-cli clip /home/abiudy/Documents/KeePassXC/Passwords.kdbx -a"
# ----- obsidian.nvim -----------------------
alias notes="nvim ~/Desktop/Obsidian/"


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

# pnpm
export PNPM_HOME="/home/abiudy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

### --- Yazi -----------------------------------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
source "$ZDOTDIR"/.yazi.sh

### Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"
