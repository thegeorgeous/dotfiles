#!/usr/bin/env bash
set -euo pipefail

repo_url=https://github.com/thegeorgeous/dotfiles.git
brew=/opt/homebrew/bin/brew
chezmoi=/opt/homebrew/bin/chezmoi
mise=/opt/homebrew/bin/mise
source_dir="$HOME/.local/share/chezmoi"
prezto_dir="$HOME/.config/zsh/.zprezto"

if [[ ! -x "$brew" || ! -x "$chezmoi" ]]; then
  printf 'This Mac needs shared Homebrew and chezmoi in /opt/homebrew/bin.\n' >&2
  exit 1
fi

if [[ ! -d "$source_dir/.git" ]]; then
  "$chezmoi" init "$repo_url"
fi

if [[ ! -f "$source_dir/Brewfile" ]]; then
  printf 'Brewfile is missing from %s.\n' "$source_dir" >&2
  exit 1
fi

if ! "$brew" bundle check --file "$source_dir/Brewfile"; then
  printf 'Installing only missing Brewfile formulae into the shared Homebrew prefix...\n'
  if ! "$brew" bundle install --file "$source_dir/Brewfile"; then
    printf 'Homebrew could not install missing formulae. Run brew bundle install as the account that owns /opt/homebrew, then rerun this script.\n' >&2
    exit 1
  fi
fi

if [[ ! -f "$prezto_dir/init.zsh" ]]; then
  if [[ -e "$prezto_dir" ]]; then
    printf 'Prezto directory exists without init.zsh: %s\n' "$prezto_dir" >&2
    exit 1
  fi
  mkdir -p "$(dirname "$prezto_dir")"
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$prezto_dir"
fi

"$chezmoi" apply
"$mise" install
printf 'Done. Start a new zsh session, then set your Git identity in ~/.config/git/private-config.\n'
