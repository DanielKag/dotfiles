add-alias() {
	if [ -z "$1" ] || [ -z "$2" ]; then
		echo 'Usage: add-alias <alias-name> "<alias-value>"'
	elif [[ ! -z "$3" ]]; then
    echo "Erro: Second arg must be a string"
		echo 'Usage: add-alias <alias-name> "<alias-value>"'
	else	
		command="alias $1=\"$2\""
		echo $command >> ~/.alias.sh
		source ~/.alias.sh
	fi
}

aliasg() {
	if [ -z "$1" ]; then
		echo "usage: aliasg <alias-pattern>"
	else
		alias | grep $1
	fi
}

tree2() {
  depth=20
	if [ -z "$1" ]; then
		depth=20
  else
    depth=$1
  fi  
  exa --icons -1 -a --group-directories-first --git-ignore --color=always -T -L $depth
}

export -f gcom() {
	if [ -z "$1" ]; then
		echo "usage: gcom <file-path>"
	else
		git checkout origin/master -- $1
	fi
}

# npm package versions
versions() {
	if [ -z "$1" ]; then
		echo "usage: versions <npm package>"
	else
		npm view $1 versions | tail -n 20	
	fi
}

creator() {
  if [ -z "$1" ]; then
    echo "usage: creator <file-name>"
  else
    git log --pretty=format:"%an" -- $1  | tail -n 1
  fi
}
  
openGithubCommitOnRemote() {
  read commit
    
	if [ ! -z "$commit" ]; then
    owner="wix-private"
    repo=$(basename `git rev-parse --show-toplevel`)
    open -a "Google Chrome" "https://github.com/$owner/$repo/commit/$commit"
  fi
}

openGithubFileOnRemote() {
  read filePath
    
	if [ ! -z "$filePath" ]; then
    owner="wix-private"
    repo=$(basename `git rev-parse --show-toplevel`)
    open -a "Google Chrome" "https://github.com/$owner/$repo/blob/master/$filePath"
  fi
}

openGithubPR() {
  read pr
    
	if [ ! -z "$pr" ]; then
    owner="wix-private"
    repo=$(basename `git rev-parse --show-toplevel`)
    open -a "Google Chrome" "https://github.com/$owner/$repo/pull/$pr"
  fi
}

ghistory() {
 git log origin/master --pretty='format:%C(yellow)%h %Cblue%>(12)%ar %Cgreen%<(7)%aN %Creset%s' -- $1 | fzf --ansi --no-sort --exact --bind='tab:toggle-preview' --preview 'git diff {1}^1..{1} | delta' 
}

touch2() { mkdir -p "$(dirname "$1")" && touch "$1" ; }

#bb() {
	#git checkout $(git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | grep Kagan | uniq | tail | awk -F \t '{print $3}' | awk -F / '{print $NF}' | sort | uniq | smenu -c -W $'\n' -n10 -m 'Choose branch to checkout:' -N -3 'master' 'b')
#}

current_branch() {
  echo $(git rev-parse --abbrev-ref --symbolic-full-name @{upstream})
}

rorigin() {
   confirm git reset --hard $(current_branch)
}


# temp scripts to rebase falcon timeline
random_num() {  
  echo $(awk -v min=2 -v max=100 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
}
fbuild='https://falcon.dev.wixpress.com/buildConfiguration/wix_private_falcon_ci_PRs?branch=2810%2Fhead&buildTypeTab=overview&mode=builds' 
alias rebase-falcon="cd ~/repos/falcon-ci/ && gco ci-timeline && git stash && rb && git stash pop && git push --force" 

update-falcon() {
	if [ -z "$1" ]; then
		echo "usage: update-falcon <fingerprint>" 
	else
    rand=$(random_num)
		gco -b updatefalcon$rand && \
      json -I -f .falconrc.json -e "this.runner.version='$1'"
      gaa && \
      git commit -m "Infra: Update falcon version with workers timeline" && \
      git push
	fi
}
commit() { 
   # git commit -m "$1" 
   git commit -m "$(gum input --placeholder='Commit Message...')"
}
commitv() { git commit -m "$1" --no-verify }

gcomf() {
	branch=$(git branch --show-current)
	git diff --name-only $branch $(git merge-base $branch origin/master) | cut -f 2 | fzf --bind='tab:toggle-preview' --preview 'git diff origin/master..HEAD {1} | delta' |  xargs git checkout origin/master --
}

infra-commits () {
  infra_prs=$(gh pr list --state merged  --search "label:infra" | cut -f1 | tr  '\n' '|' | sed '$s/|$/\n/')
  git log origin/master --decorate-refs-exclude=refs/tags --pretty=format:'%Cred%h%Creset %Cgreen%<(13)%cr%Creset %C(bold blue)%<(16)%an%Creset %s %C(auto)%d%Creset' --abbrev-commit | grep -E "#($infra_prs)"  | fzf --ansi --no-sort --exact --bind='tab:toggle-preview' --preview 'git show {1} | delta' | awk '{print $1}' | tr -d '\n' | openGithubCommitOnRemote
}




alias cat="bat"
alias tb="cd ~/repos/thunderbolt"
alias tbm="cd ~/repos/thunderbolt-master"
alias tbp="cd ~/repos/thunderbolt-playground"
alias tbm-reset="git fetch origin && git reset --hard origin/master"
alias tbp-reset="git fetch upstream && git reset --hard upstream/master"
alias tbp-rebase="git fetch upstream && git rebase upstream/master"
alias lg="lazygit"
alias glog="git log --pretty='format:%C(yellow)%h %Cblue%>(12)%ar %Cgreen%<(7)%aN %Creset%s' | fzf --ansi --no-sort --exact --preview 'git show {1} | delta' | awk '{print \$1}' | tr -d '\n' | openGithubCommitOnRemote"
# alias glogm="git log origin/master --decorate-refs-exclude=refs/tags --pretty=format:'%Cred%h%Creset %Cgreen%<(13)%cr%Creset %C(bold blue)%<(16)%an%Creset %s %C(auto)%d%Creset' --abbrev-commit | fzf --ansi --no-sort --exact --bind='tab:toggle-preview' --preview 'git show {1} | delta' | awk '{print \$1}' | tr -d '\n' | openGithubCommitOnRemote"
alias glogmd="git log origin/master --decorate-refs-exclude=refs/tags --pretty=format:'%Cred%h%Creset %Cgreen%<(13)%cd%Creset %C(bold blue)%<(16)%an%Creset %s %C(auto)%d%Creset' --abbrev-commit | fzf --ansi --no-sort --exact --bind='tab:toggle-preview' --preview 'git show {1} | delta' | awk '{print \$1}' | tr -d '\n' | openGithubCommitOnRemote"
alias daniel="git log origin/master --simplify-by-decoration --decorate-refs-exclude=refs/tags --pretty=format:'%Cred%h%Creset %Cgreen%<(13)%cr%Creset %C(bold blue)%<(16)%an%Creset %C(auto)%d%Creset %s ' --abbrev-commit"
alias gfiles="rg -l '' --hidden | fzf --ansi --preview 'bat --color=always {1}' | tr -d '\n' | openGithubFileOnRemote"
alias bb="git for-each-ref --sort='-creatordate' --format='%(if)%(HEAD)%(then)* %(else)  %(end)%(refname:short)' refs/heads/ | fzf --height 10 --bind='tab:toggle-preview' --preview-window right,80% --preview 'git lg2 {1}' | xargs git checkout"
alias pr='gh pr list --author "@me"  | fzf --height 10'
alias amend="git commit --amend --no-edit"
alias amendv="git commit --amend --no-edit --no-verify"
# alias rb="git fetch origin master:master && git rebase master"
alias rb="git fetch && git rebase origin/master"
alias my-branches="git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | grep Kagan | uniq | tail"
alias yarnfast="npx https://registry.yarnpkg.com/midgard-yarn/-/midgard-yarn-1.23.22.tgz"

alias npmpublic="npm config set registry https://registry.npmjs.org/ && npm config get registry"
alias npmprivate="npm config set registry https://npm.dev.wixpress.com && npm config get registry"

alias zshrc="lvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias gcmm="gco"
alias wdpl="wdp list -w -a wix-thunderbolt -g com.wixpress.html-client | less"
alias ee="cd ~/repos/editor-elements"
alias repos="cd ~/repos"
alias dummy="git commit -m 'dummy $1' --allow-empty --no-verify"
alias gcmf="git checkout master -- "
alias all-cowsay='for i in $(cowsay -l | sed -n '1!p'); do echo $i; done | fzf --preview="cowsay -f {} {}"'
alias tbmr="gco thunderbolt-master && rb && git clean -fxd && yarn fast"
alias gr1="git reset --soft head~1"
alias grh1="git reset --hard head~1"
alias sz="du -hs"
alias edit-alias="vim ~/.alias.sh"
alias clean="git restore --staged . && git restore . && git clean -fd"
# alias ls="exa --icons -1 -a --group-directories-first --git-ignore --color=always -l -h --git --no-permissions --no-user --no-time"
alias mypr="gh pr list --author "@me""
alias tt="tmux attach-session -t Daniel"
alias tc="tmux kill-server ; ~/scripts/create-tmux-session.sh"
alias ping="gping"
alias vimrc="lvim ~/.local/share/lunarvim/lvim"
alias pingg="ping google.com"
alias hist="fc -l -n 1 | sed 's/^\s*//' | fzf --height 10 |  awk '{system(-zsh)}'"
alias nvimrc="nvim ~/.config/nvim"
alias snirdaniel="cd ~"
alias yarnlock="yarn install --mode update-lockfile"
alias rbm="git pull origin master"
alias config="(cd ~/repos/dotfiles && lvim -O .zshrc .alias.sh)"
alias gpp="git pull && git push"
alias killn="killall -9 node && killall -9 node"
alias gdiff="git diff origin/master...HEAD"
