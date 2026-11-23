# Dotfiles

These files are managed with [chezmoi](https://www.chezmoi.io/). The Brewfile lists only the development tools needed by this shell setup. On this Mac, Homebrew lives in the shared `/opt/homebrew` prefix, so an installed formula is available to both accounts.

## Set up another account on this Mac

Sign in to the other account and run this one command:

```sh
curl -fsSL https://raw.githubusercontent.com/thegeorgeous/dotfiles/main/install.sh | bash
```

The [install script](install.sh) initializes chezmoi, checks the shared Homebrew prefix, installs only missing Brewfile formulae, installs Prezto in the new account, applies the dotfiles, and runs `mise install`. It can be rerun. If the new account cannot write to `/opt/homebrew`, install any missing formulae from the account that owns Homebrew, then rerun it:

```sh
/opt/homebrew/bin/brew bundle install --file "/Users/OTHER_ACCOUNT/.local/share/chezmoi/Brewfile"
```

The script requires shared Homebrew and chezmoi to be available in `/opt/homebrew/bin`. These are already installed on this Mac.

After setup, start a new zsh session. Configure account-specific Git identity and signing in `~/.config/git/private-config`, which the managed Git config includes but this repository deliberately does not contain.

The Neovim configuration is maintained separately and is currently outside this repository. Local changes to Prezto's Git aliases are also outside this repository; the standalone Git alias file in `~/.config/zsh` supplies the common aliases.
