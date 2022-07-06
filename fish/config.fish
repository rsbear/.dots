set -U fish_greeting "🐟🐟🐟🐟"

# ALIASES
alias fishy="nvim ~/.config/fish/config.fish"
alias fishysauce="source ~/.config/fish/config.fish"
alias l="ll"
alias zshrc="nvim ~/.zshrc"
alias lg='lazygit'
alias vim="nvim"
alias vi="vim"
alias work="cd ~/work && l"
alias side="cd ~/side && l"
alias home="cd ~"
alias dc="docker-compose"
alias dots="cd ~/.config"
alias dotsn="cd ~/.config/nvim"
alias hl="helm list -A"
alias kk="k9s"
alias gtls="git tag -l"
alias ww="~/side/tmux-spaces/./tmux-spaces"
alias llg="ls -l | rg ^d"
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
alias catp="cat package.json"
alias ff="fz"


export EDITOR="nvim"
export KUBE_EDITOR="nvim"

export PATH="$(brew --prefix)/bin/:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export FLYCTL_INSTALL="/Users/rsbear/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export PATH="/Users/rsbear/.deno/bin:$PATH"
export ZK_NOTEBOOK_DIR="$HOME/.config/zk"


starship init fish | source
