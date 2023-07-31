#
# ~/.bashrc
#

# If not running interactively, don't do anything
parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

exitstatus()
{
    if [[ $? == 0 ]]; then
        echo ':)'
    else
        echo ':('
    fi
}

[[ $- != *i* ]] && return



alias ls='ls --color=auto'
alias pacman='sudo pacman'
alias vim='nvim'
alias nv='env -u WAYLAND_DISPLAY neovide'
alias sleep='hyprctl dispatch dpms off DP-1 && hyprctl dispatch dpms off DP-2'

export NVIM=/home/rongfei/.config/nvim
export ALAC=/home/rongfei/.config/alacritty


export PS1='\
`if [[ $? -gt 0 ]]; then printf "\[\033[01;31m\]:("; else printf "\[\033[01;32m\]:)"; fi` \
\[\e[0;38;5;42m\]\u \
\[\e[0;38;5;75m\]\w \
\[\e[0;38;5;214m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \
\[\e[0m\]\$\[\e[0m\] '

source /usr/share/nvm/init-nvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export WLR_NO_HARDWARE_CURSORS=1
