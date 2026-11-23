# oh-my-zsh git aliases on top of Prezto's git module.
# Source this after Prezto so overlapping names keep oh-my-zsh meanings.

git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref remote branch
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,stable,master}; do
    if command git show-ref -q --verify "$ref"; then
      print -r -- "${ref:t}"
      return
    fi
  done
  for remote in origin upstream; do
    branch=$(command git symbolic-ref --quiet --short "refs/remotes/$remote/HEAD" 2>/dev/null)
    if [[ $branch == $remote/* ]]; then
      print -r -- "${branch#"$remote/"}"
      return
    fi
  done
  print -r -- master
  return 1
}

git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel develop development; do
    if command git show-ref -q --verify "refs/heads/$branch"; then
      print -r -- "$branch"
      return
    fi
  done
  print -r -- develop
  return 1
}

git_current_branch() {
  command git symbolic-ref --quiet --short HEAD 2>/dev/null || command git rev-parse --short HEAD 2>/dev/null
}

# Add, branch, checkout.
alias gav='git add --verbose'
alias gbl='git blame -w'
alias gba='git branch --all'
alias gbs='git bisect'
alias gbnm='git branch --no-merged'
alias gcB='git checkout -B'
alias gcd='git checkout $(git_develop_branch)'
alias gcm='git checkout $(git_main_branch)'
alias gcor='git checkout --recurse-submodules'
alias gcl='git clone --recurse-submodules'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

# Commit and config. In Prezto, gcm was commit-message and gcf was commit-fixup.
alias gcmsg='git commit --message'
alias gcsm='git commit --signoff --message'
alias gcas='git commit --all --signoff'
alias gcasm='git commit --all --signoff --message'
alias gcs='git commit --gpg-sign'
alias gcss='git commit --gpg-sign --signoff'
alias gcssm='git commit --gpg-sign --signoff --message'
alias 'gc!'='git commit --verbose --amend'
alias 'gca!'='git commit --verbose --all --amend'
alias 'gcan!'='git commit --verbose --all --no-edit --amend'
alias gcn='git commit --verbose --no-edit'
alias 'gcn!'='git commit --verbose --no-edit --amend'
alias gcf='git config --list'
alias gcfu='git commit --fixup'

# Diff, fetch, log and pull.
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'
alias gdup='git diff @{upstream}'
alias gfo='git fetch origin'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glg='git log --stat'
alias glgp='git log --stat --patch'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gpra='git pull --rebase --autostash'
alias gprom='git pull --rebase origin $(git_main_branch)'

# Merge, push, rebase and remote.
alias gmc='git merge --continue'
alias gms='git merge --squash'
alias gmff='git merge --ff-only'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease --force-if-includes'
alias 'gpf!'='git push --force'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpv='git push --verbose'
alias gpoat='git push origin --all && git push origin --tags'
alias gpod='git push origin --delete'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grbm='git rebase $(git_main_branch)'
alias grf='git reflog'
alias gr='git remote'
alias grv='git remote --verbose'
alias gra='git remote add'
alias grrm='git remote remove'
alias grmv='git remote rename'
alias grset='git remote set-url'
alias grup='git remote update'

# Reset, restore, status, stash and switch.
alias grh='git reset'
alias gru='git reset --'
alias grhh='git reset --hard'
alias grhk='git reset --keep'
alias grhs='git reset --soft'
alias grs='git restore'
alias grss='git restore --source'
alias grst='git restore --staged'
alias grev='git revert'
alias grm='git rm'
alias grmc='git rm --cached'
alias gst='git status'
alias gsb='git status --short --branch'
alias gsnut='git status --untracked-files=no'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gsts='git stash show --patch'
alias gstall='git stash --all'
alias gsw='git switch'
alias gswc='git switch --create'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'

# Worktrees.
alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtls='git worktree list'
alias gwtmv='git worktree move'
alias gwtrm='git worktree remove'
