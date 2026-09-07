# ============================================================================
# Powerlevel10k Instant Prompt
# ============================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# Oh-My-Zsh Configuration
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"

# Set theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment to disable auto-update prompts
DISABLE_UPDATE_PROMPT=true

# Plugins - Best practices from popular guides
plugins=(
  git
  docker
  docker-compose
  npm
  node
  pip
  python
  terraform
  kubectl
  command-not-found
  sudo
  copyfile
  copypath
  extract
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# ============================================================================
# User Configuration
# ============================================================================

# Preferred editor
export EDITOR='nvim'
export VISUAL='nvim'

# ============================================================================
# Environment Variables
# ============================================================================

# Python
export PYENV_ROOT="$HOME/.pyenv"

# NVM
export NVM_DIR="$([ -d "$HOME/.nvm" ] && realpath $HOME/.nvm || echo $HOME/.nvm)"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk

# SDK & Tools
export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"
export SDKMAN_DIR="$HOME/.sdkman"

# Modern CLI Tools Configuration
export BAT_THEME='gruvbox-dark'
export BAT_STYLE='numbers,changes,header'

# FZF Configuration
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# FZF Tokyo Night Color Scheme
export FZF_DEFAULT_OPTS="
  --height=40%
  --layout=reverse
  --info=inline
  --border=rounded
  --margin=1
  --padding=1
  --color=fg:#c8d3f5,bg:#222436,hl:#ff966c
  --color=fg+:#c8d3f5,bg+:#2f334d,hl+:#ff966c
  --color=info:#82aaff,prompt:#86e1fc,pointer:#86e1fc
  --color=marker:#c3e88d,spinner:#c3e88d,header:#c3e88d
  --bind='ctrl-/:toggle-preview'
  --bind='ctrl-u:preview-half-page-up'
  --bind='ctrl-d:preview-half-page-down'
  --preview-window=right:60%:wrap
"

export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always --style=numbers --line-range=:500 {}'
  --preview-window=right:60%:wrap
"

export FZF_ALT_C_OPTS="
  --preview 'eza --tree --level=2 --color=always --icons {} | head -200'
"

# Colored man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# ============================================================================
# PATH Configuration
# ============================================================================
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PATH="/Users/eyuelabebe/Library/Python/3.9/bin:$PATH"
export PATH="/Users/eyuelabebe/.antigravity-ide/antigravity-ide/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/eyuelabebe/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# ============================================================================
# ZSH Options
# ============================================================================

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt AUTO_MENU

# Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ============================================================================
# Completions
# ============================================================================
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ============================================================================
# Tool Initialization
# ============================================================================

# Pyenv
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Direnv
if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# FZF
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi

# Zoxide (smart cd)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# SDKMAN
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# iTerm2 Integration
[[ -f "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"

# ============================================================================
# Aliases - Modern CLI Tools
# ============================================================================

# Editor
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# Shell
alias reload='exec zsh'
alias zshconfig='nvim ~/.zshrc'
alias ohmyzsh='cd ~/.oh-my-zsh'

# Modern ls with eza
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons --git-ignore'
alias tree='eza --tree --icons'

# Git-focused listings
alias lsg='eza -lah --icons --git --git-repos --group-directories-first'
alias lg='eza --long --git --no-permissions --no-filesize --no-time --no-user --icons'

# Cat with syntax highlighting
alias cat='bat --paging=never'
alias ccat='/bin/cat'
alias batp='bat --paging=always'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# Quick navigation
alias docs='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'
alias projects='cd ~/Documents/projects'

# Git aliases (enhanced)
alias gs='git status --short --branch'
alias gss='git status'
alias glog='git log --oneline --decorate --graph --all'
alias glg='git log --graph --pretty=format:"%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gtree='git log --graph --all --oneline --decorate | head -20'
alias gbr='git branch -vv'

# Docker
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dimg='docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f'
alias dstop='docker stop $(docker ps -q)'
alias dprune='docker system prune -af --volumes'

# Python
alias python='python3'
alias pip='pip3'

# System
alias path='echo $PATH | tr ":" "\n"'
alias ports='lsof -i -P -n | grep LISTEN'
alias myip='curl -s https://ipinfo.io/ip'

# Global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g NE='2>/dev/null'

# ============================================================================
# Custom Functions
# ============================================================================

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick backup
backup() {
  cp "$1" "$1.bak"
}

# Git clone and cd
gitclone() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# Kill process on port
killport() {
  lsof -ti:"$1" | xargs kill -9
}

# FZF project switcher
proj() {
  local dir
  dir=$(fd --type d --max-depth 3 . ~/Documents/projects 2>/dev/null | fzf --preview 'eza --tree --level=2 --icons {}')
  [[ -n "$dir" ]] && cd "$dir"
}

# FZF git branch checkout
fgb() {
  local branch
  branch=$(git branch -a | fzf | sed 's/^..//' | sed 's#remotes/[^/]*/##')
  [[ -n "$branch" ]] && git checkout "$branch"
}

# Weather
weather() {
  curl -s "wttr.in/${1}?format=3"
}

# AWS RDS Database Connection Helper
awsdb() {
  local env="$1"
  local client="${2:-pgcli}"
  local profile host dbuser dbname

  case "$env" in
    temporaldev)
      profile="nj-dev"
      host="dol-ui-temporal-dev.cluster-ctoqzcdbldcb.us-east-1.rds.amazonaws.com"
      dbuser="appadmindev"
      dbname="dol_ui_temporal_dev"
      ;;
    dev)
      profile="default"
      host="dol-ui-claimant-intake-api-dev.cluster-ctoqzcdbldcb.us-east-1.rds.amazonaws.com"
      dbuser="dev_nj_ui_ro_user"
      dbname="dol_ui_claimant_intake_api_dev"
      ;;
    devrw)
      profile="nj-dev"
      host="dol-ui-claimant-intake-api-dev.cluster-ctoqzcdbldcb.us-east-1.rds.amazonaws.com"
      dbuser="dev_migration_user"
      dbname="dol_ui_claimant_intake_api_dev"
      ;;
    devshadow)
      profile="default"
      host="dol-ui-claimant-intake-api-clone-dev.cluster-ctoqzcdbldcb.us-east-1.rds.amazonaws.com"
      dbuser="dev_nj_ui_rw_user"
      dbname="dol_ui_claimant_intake_api_dev"
      ;;
    test)
      profile="test"
      host="dol-ui-claimant-intake-api-test.cluster-cq76bbpbg78m.us-east-1.rds.amazonaws.com"
      dbuser="test_nj_ui_ro_user"
      dbname="dol_ui_claimant_intake_api_test"
      ;;
    testrw)
      profile="test"
      host="dol-ui-claimant-intake-api-test.cluster-cq76bbpbg78m.us-east-1.rds.amazonaws.com"
      dbuser="test_migration_user"
      dbname="dol_ui_claimant_intake_api_test"
      ;;
    shadowtest)
      profile="test"
      host="dol-ui-claimant-intake-api-clone-test.cluster-cq76bbpbg78m.us-east-1.rds.amazonaws.com"
      dbuser="test_nj_ui_ro_user"
      dbname="dol_ui_claimant_intake_api_test"
      ;;
    prod)
      profile="prod"
      host="dol-ui-claimant-intake-api-prod.cluster-ro-cp8i5gnsjz4s.us-east-1.rds.amazonaws.com"
      dbuser="prod_nj_ui_ro_user"
      dbname="dol_ui_claimant_intake_api_prod"
      ;;
    shadowprod)
      profile="prod"
      host="dol-ui-claimant-intake-api-clone-prod-one.cp8i5gnsjz4s.us-east-1.rds.amazonaws.com"
      dbuser="prod_nj_ui_rw_user"
      dbname="dol_ui_claimant_intake_api_prod"
      ;;
    *)
      echo "Usage: awsdb [dev|devrw|devshadow|test|testrw|shadowtest|prod|shadowprod|temporaldev] [pgcli|psql]"
      return 1
      ;;
  esac

  aws sts get-caller-identity --profile "$profile" &>/dev/null || aws sso login --profile "$profile"

  local token
  token="$(aws rds generate-db-auth-token --profile "$profile" --hostname "$host" --port 5432 --username "$dbuser")"

  PGHOST="$host" PGUSER="$dbuser" PGDATABASE="$dbname" PGPASSWORD="$token" \
  PGPORT=5432 PGSSLMODE=require PGOPTIONS="--search_path=claims,events,intake,lookup,public" \
  "$client"
}

# ============================================================================
# Help Function
# ============================================================================

help-terminal() {
  cat << 'EOF'
╭──────────────────────────────────────────────────────────────────╮
│                    🎨 Enhanced Terminal Guide                    │
╰──────────────────────────────────────────────────────────────────╯

📁 Modern File Browsing:
  ls, ll, la         - Enhanced directory listings with icons
  lsg                - Show git status in file listing
  lg                 - Git status only view
  lt                 - Tree view of directories
  tree [depth]       - Tree view with custom depth

🔍 Fuzzy Finding (FZF):
  CTRL+T             - Search files with preview
  CTRL+R             - Search command history
  ALT+C              - Search and cd to directory
  proj               - Quick project switcher

🗂️ Navigation:
  z <keyword>        - Jump to frequent directories (oh-my-zsh z plugin)
  .. ... ....        - Quick parent directory navigation
  mkcd <dir>         - Create directory and cd into it
  docs, downloads    - Quick navigation shortcuts
  desktop, projects

📝 File Operations:
  cat <file>         - View file with syntax highlighting
  ccat <file>        - Plain cat (no colors)
  batp <file>        - View file with pager
  backup <file>      - Create .bak copy
  extract <archive>  - Extract any archive (oh-my-zsh plugin)

🔧 Git Enhancements:
  gs                 - Git status (compact)
  gss                - Git status (full)
  glog               - Beautiful git log graph
  glg                - Detailed git log with author
  gtree              - Quick git tree view
  gbr                - Show branches with tracking
  fgb                - Fuzzy git branch checkout
  gitclone <url>     - Clone and cd into repo

🐳 Docker:
  dps                - Formatted docker ps
  dimg               - Formatted docker images
  dcu, dcd           - docker-compose up/down
  dcl                - Follow docker-compose logs
  dstop              - Stop all containers
  dprune             - Clean up everything

💻 Productivity:
  killport <port>    - Kill process on port
  weather [city]     - Get weather
  myip               - Show public IP
  ports              - Show open ports
  path               - Show PATH nicely formatted

⌨️  Keybindings:
  CTRL+R             - Fuzzy history search
  CTRL+T             - Fuzzy file search
  ALT+C              - Fuzzy directory search
  CTRL+/             - Toggle FZF preview
  ESC ESC            - Add sudo to command

🎨 Aliases:
  Type 'alias' to see all available shortcuts

📚 Configuration:
  zshconfig          - Edit .zshrc
  reload             - Reload shell
  ohmyzsh            - Go to Oh-My-Zsh directory

🎯 Custom Functions:
  awsdb <env>        - Connect to AWS RDS database
  proj               - Interactive project switcher
  fgb                - Interactive git branch switcher

EOF
}

# Aliases for help
alias help='help-terminal'
alias tips='help-terminal'
alias cheatsheet='help-terminal'

# ============================================================================
# Load Powerlevel10k Config
# ============================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# Custom Aliases (from .bash_aliases if exists)
# ============================================================================
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
