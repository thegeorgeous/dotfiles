# Dotfiles

Shell and development configuration managed with [chezmoi](https://www.chezmoi.io/). The [Brewfile](Brewfile) contains the tools required by this setup, rather than a full inventory of installed software.

## Requirements

- macOS on Apple Silicon, with Homebrew installed at `/opt/homebrew`.
- `chezmoi` installed through that Homebrew installation (`/opt/homebrew/bin/brew install chezmoi`).
- Git and network access to GitHub.

The installer uses the standard Apple Silicon Homebrew path. On a machine with a different Homebrew prefix, adjust [install.sh](install.sh) before running it.

## Install

Run this command from the account that will use the dotfiles:

```sh
curl -fsSL https://raw.githubusercontent.com/thegeorgeous/dotfiles/main/install.sh | bash
```

The script initializes chezmoi, checks the Brewfile against the existing Homebrew installation, installs missing formulae, clones Prezto into the account's home directory, applies the dotfiles, and runs `mise install`. It can be rerun. Existing formulae in the Homebrew prefix are reused.

If the account cannot write to `/opt/homebrew`, install any missing formulae from an account that manages Homebrew, then rerun the script. The installer reports which formulae are missing. See the [Homebrew documentation](https://docs.brew.sh/Installation) for installation and prefix permissions.

To review the files before applying them, initialize chezmoi and preview the changes manually:

```sh
/opt/homebrew/bin/chezmoi init https://github.com/thegeorgeous/dotfiles.git
/opt/homebrew/bin/chezmoi diff
```

## Account-specific setup

Start a new zsh session after installation. Set Git name, email, and signing key in `~/.config/git/private-config`. Credentials and private keys are intentionally excluded from this repository, so authenticate GitHub and any other services separately in each account. The managed Git config enables commit signing; a usable signing key is required before committing.

Neovim configuration is maintained separately. Prezto is installed by the script; the Git aliases supplied by this repository live in `~/.config/zsh/git-ohmyzsh-prezto.zsh`.
