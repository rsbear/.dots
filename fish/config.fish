set -U fish_greeting ""

function git_committer
  set TYPE $(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
	set SCOPE $(gum input --placeholder "scope")

	test -n "$SCOPE" && set SCOPE "($SCOPE)"

	# Pre-populate the input with the type(scope): so that the user may change it
	set SUMMARY $(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
	set DESCRIPTION $(gum write --placeholder "Details of this change")

	# Commit these changes if user confirms
	gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
end


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
alias ff="fzf"
alias tko="tmux kill-server"
alias gopen="gh browse"
alias glol="git log --oneline | gum filter"
alias cmt='git_committer'
alias zz="zellij --layout ~/.config/zellij/layout-classic.yaml"
alias cc="clear"

# shortcuts to be deleted someday
alias tf="cd ~/side/typefeel/"
alias kcn="cd ~/work/kitco-cms-next/"

alias edb="edgedb $argv"


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

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/Users/rsbear/Library/Application Support/edgedb/bin:$PATH"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS""
 --color=fg:#908caa,bg:#191724,hl:#6e6a86
 --color=fg+:#eb6f92,bg+:#191724,hl+:#908caa
 --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7
 --color=marker:#ebbcba,spinner:#eb6f92,header:#ebbcba"


starship init fish | source
