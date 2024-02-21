# dotfiles

[![forthebadge](http://forthebadge.com/images/badges/fuck-it-ship-it.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/no-ragrets.svg)](http://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/works-on-my-machine.svg)](https://forthebadge.com)


Currently managed with [GNU Stow](https://www.gnu.org/software/stow/)

### Why stow?
Stow allows for per package installation that I plan to automate at some point. And perhaps make it interactive

## How to install
Ensure GNU Stow is installed. Then run

```shell
git clone git@github.com:thegeorgeous/dotfiles.git ~/.dotfiles
cd .dotfiles
stow <package-name-here> 
```
