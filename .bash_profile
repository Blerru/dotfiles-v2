#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH="$PATH:~/.cargo/bin"

# From https://github.com/YaLTeR/niri/discussions/2241
if [[ -z "$DISPLAY" && "$(tty)" = "/dev/tty1" ]]; then
    if [ "$HOSTNAME" == "pingu" ]; then
        niri-session -l
    else
        read -p "Would you like to open the compositor (y/n): " choice
        [[ "$choice" == [Yy]* ]] && niri-session -l
    fi
fi
