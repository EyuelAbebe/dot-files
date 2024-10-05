# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#alias
alias vim='nvim'

alias cat='bat'

alias ls='exa'
alias ll='ls -al'
alias todoc='cd ~/Documents'
alias todesk='cd ~/Desktop'
alias todown='cd ~/Downloads'
alias toproj='cd ~/Documents/projects'
alias tf='terraform '

alias d="docker"
alias dc="docker-compose"
alias dp="docker system prune -f --volumes"
alias dl="aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 730502903637.dkr.ecr.us-east-1.amazonaws.com"


#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

eval "$(direnv hook zsh)"

nsethp() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
}

# source ~/.zshrc
alias szsh="source $HOME/.zshrc"

# translates to | grep data
alias -g G="| grep"
alias -g L="| less"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/bin:/Users/eyuelabebe/Library/Python/3.9/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:$PATH"
export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"
  
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# python3 Alias
alias python="python3"

# pipx
export PATH="~/.local/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/eyuelabebe/.sdkman"
[[ -s "/Users/eyuelabebe/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/eyuelabebe/.sdkman/bin/sdkman-init.sh"

export PATH="/Users/eyuelabebe/.local/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/eyuelabebe/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# use fd instead of fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"


_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate list of directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden -- exclude .git . "$1"
}


# setup zoxide
eval "$(zoxide init bash)"
alias z=zoxide

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

