# Dotfiles V2

> [!NOTE]
> As of 2026-06-15, this config is deprecated. It will no longer be receiving any updates.

These are the dotfiles I daily drive.

![Preview](./.github/assets/preview.png)

## Setup

To use these dotfiles on a fresh installation of Arch Linux do the following steps:

> [!WARNING]
> This installation process is not guaranteed to work and may cause your system to become misconfigured. Use at your own risk.

1. Clone this repository into your home folder in a folder called `.dotfiles`. The contents of this repository should be located at `~/.dotfiles`.
2. Install [GNU Stow](https://archlinux.org/packages/extra/any/stow/).
3. Install the [Paru AUR helper](https://github.com/Morganamilo/paru). If you wish to use a different one, look inside of [~/.dotfiles/.config/metapac/config.toml](~/.dotfiles/.config/metapac/config.toml) and change the `arch_package_manager` property to your desired helper.
4. In the aforementioned config, change the `pingu` hostname to the hostname your machine uses.
5. Run `cd ~/.dotfiles; stow .`. This will move all the files into the right places.
6. Run `~/.scripts/setup/setup`. This script should install eww and metapac, install all the required packages and start the various systemd services.
7. If everything went well, you can enter the compositor by logging into your user on tty1.
