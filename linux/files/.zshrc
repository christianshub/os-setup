# Load Homebrew first to ensure installed binaries are available
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export KUBECONFIG=$HOME/.kube/kairos.yaml:$HOME/.kube/config

# Ensure fzf, direnv, and Homebrew shellenv are loaded correctly
eval "$(fzf --zsh)"
eval "$(direnv hook zsh)"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="simple"
export KUBE_EDITOR="code --wait"
export EDITOR="code --wait"
export VISUAL="code --wait"
export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"


plugins=(git kubectl kube-ps1 zsh-autosuggestions zsh-syntax-highlighting)

# Load kubectl completion AFTER Homebrew is available
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

source $ZSH/oh-my-zsh.sh

fetch() {
  git fetch
}

pull () {
  git pull
}

push() {
  local message=""

  if [ -z "$1" ]; then
    message="WIP"
  else
    message="$1"
  fi

    git add -A
    git commit -m "$message"
    push_output=$(git push --force 2>&1)
    push_status=$?

    if [[ $push_status -ne 0 && $push_output == *"has no upstream branch"* ]]; then
        local branch_name=$(git rev-parse --abbrev-ref HEAD)
        echo "Setting upstream branch to 'origin/$branch_name' and pushing ..."

        git push --set-upstream origin $branch_name --force
    elif [[ $push_status -ne 0 ]]; then
        echo "An error occurred while pushing: $push_output"
    else
        echo "Pushed successfully"
    fi
}

reset()
{
  git reset $(git merge-base master $(git branch --show-current))
}

alias kubectl=kubecolor
compdef kubecolor=kubectl
alias kc='kubectx'
alias k='kubectl'
alias f="fzf"
alias kn='kubens'
alias swiss-up='kubectl run -it --rm swiss-army-knife --image=rancherlabs/swiss-army-knife:latest --restart=Never -- /bin/bash'
alias swiss-down='kubectl delete pod swiss-army-knife'
alias ml='docker run -it --rm --name megalinter -v $(pwd)/:/tmp/lint docker.io/oxsecurity/megalinter-terraform:v8.5.0'
alias treeall='tree -I "__pycache__|.git|.venv|node_modules" | tee structure.txt && find . -type f ! -path "./structure.txt" ! -path "*/.git/*" ! -path "*/.venv/*" ! -path "*/node_modules/*" ! -path "*/__pycache__/*" -exec echo -e "\n--- {} ---" \; -exec cat {} \; >> structure.txt'

PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
