#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# From https://github.com/nvm-sh/nvm/issues/2724#issuecomment-1336497491 and https://github.com/nvm-sh/nvm/issues/2724#issuecomment-1336537635
if test -f /usr/share/nvm/init-nvm.sh; then
    lazy_load_nvm() {
        unset -f node nvm npm
        export NVM_DIR=~/.nvm
        [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
    }

    npm() {
        lazy_load_nvm
        npm $@
    }

    node() {
        lazy_load_nvm
        node $@
    }

    nvm() {
        lazy_load_nvm
        nvm $@
    }
fi

# alias peaclock="peaclock --config-dir ~/.config/peaclock"
alias cd-config='cd ~/.dotfiles/.config'
alias cd-studio-user='cd ~/.var/app/org.vinegarhq.Vinegar/data/vinegar/prefixes/studio/drive_c/users/blru'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias restow-dotfiles='cd ~/.dotfiles; stow -R .; cd -'
alias v='nvim'

HISTCONTROL=ignorespace
PS1='\[\e[92m\][\[\e[92m\]\u\[\e[92m\]@\[\e[92m\]\h\[\e[92m\]]\[\e[94m\][\[\e[94m\]\w\[\e[94m\]]\[\e[0m\] \[\e[37;2m\]\[\e[0m\] '

eval "$(zoxide init bash)"
