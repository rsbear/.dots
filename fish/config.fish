function fish_greeting
    echo The time is (set_color green; date +%I:%M; set_color normal)
end

function git_committer
  set TYPE $(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
	set SCOPE $(gum input --placeholder "scope")

	test -n "$SCOPE" && set SCOPE "($SCOPE)"

	# Pre-populate the input with the type(scope): so that the user may change it
	set SUMMARY $(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
	# set DESCRIPTION $(gum write --placeholder "Details of this change")

	# Commit these changes if user confirms
	gum confirm "Commit changes?" && git commit -m "$SUMMARY" 
end

function commit_hash
  git log --oneline | gum filter | cut -d' ' -f1 # | copy
end

function delete_a_branch
  git branch | cut -c 3- | gum choose --no-limit | xargs git branch -D
end

function favs
  set LOCATION $(gum choose "~/.config/" "~/tiny/duesplit/" "~/work/kitco-cms-next/" "~/work/helm-charts/")
  test -n $LOCATION && set LOCATION $LOCATION
  cd $LOCATION
end

function checkout_pull_request
  gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout
end

function lk
  set loc (walk $argv); and cd $loc;
end

function code
  open -a "Visual Studio Code.app" $argv
end


function ff
# fzf --preview 'bat --color=always {}' --preview-window '~3'
    set file (rg --files --glob '!node_modules/**' | fzf --preview 'bat --color=always {}' --preview-window '~3' )
    if test -n "$file"
        nvim $file
    end
end

# GIT SHORTCUTS
alias lg='lazygit'
alias gopen="gh browse"
alias glol="git log --oneline | gum filter"
alias comet='git_committer'
alias cash='commit_hash'
alias gtls="git tag -l"
alias cm="git_committer"
alias gdb="delete_a_branch"
alias prs="checkout_pull_request"

# ALIASED APPS
alias air="~/go/bin/air $argv"
alias templ="~/go/bin/templ $argv"
alias vv="nvim"
alias vr="volta run"
alias dc="docker-compose"
alias vim="nvim"
alias vi="vim"
alias hl="helm list -A"
alias kk="k9s"
alias ai="chatgpt"
alias goog="glook"
alias edb="edgedb $argv"

# ALIASED PROGRAMS
alias xx="exit"
alias close="exit"
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
alias catp="cat package.json"
alias llg="ls -l | rg ^d"
alias tko="tmux kill-server"
alias zz="zellij --layout ~/.config/zellij/layout-classic.yaml"
alias cc="clear"
alias favs="favorites"
alias yd="yarn dev"
alias reyarn="rm -rf node_modules && yarn"
# alias ff="fzf --preview 'bat --color=always {}' --preview-window '~3'"
alias fd="zi"
alias biomecfg="cat ~/Documents/biome-config.json | pbcopy"
alias precommithook="cat ~/Documents/pre-commit-hook.sh | pbcopy"

# ALIASED DIRs
alias fishy="nvim ~/.config/fish/config.fish"
alias fishysauce="source ~/.config/fish/config.fish"
alias l="ls -lah"
alias lgcfg='nvim ~/Library/Application\ Support/lazygit/config.yml'
alias dots="cd ~/.config"
alias dotsn="cd ~/.config/nvim"
alias ww="zi"
alias notes="cd ~/notes && vim"
alias stand="cd ~/notes && vim standup.md"
alias home="cd ~"
alias tf="cd ~/tiny/typefeel/"
alias kcn="cd ~/work/kitco-cms-next/"
alias cool="cd ~/cool"
alias tiny="cd ~/tiny"
alias ds="cd ~/tiny/duesplit"
alias work="cd ~/work && l"
alias side="cd ~/side && l"
alias zero="cd ~/work/zerohedge-d8/"

export EDITOR="nvim"
export KUBE_EDITOR="nvim"

export PATH="$(brew --prefix)/bin/:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"

export FLYCTL_INSTALL="/Users/rsbear/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export PATH="/Users/rsbear/.deno/bin:$PATH"
export ZK_NOTEBOOK_DIR="$HOME/.config/zk"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/Users/rsbear/Library/Application Support/edgedb/bin:$PATH"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS""
 --color=fg:#908caa,bg:#191724,hl:#6e6a86
 --color=fg+:#eb6f92,bg+:#191724,hl+:#908caa
 --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7
 --color=marker:#ebbcba,spinner:#eb6f92,header:#ebbcba"


starship init fish | source
zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/Users/rsbear/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# golang
set -x GOPATH ~/go
set -gx PATH $PATH $GOPATH/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export GO111MODULE=on

set -x PATH (pwd)"/git-fuzzy/bin:$PATH"

