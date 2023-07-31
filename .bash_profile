#
# ~/.bash_profile
#

export EDITOR=nvim

export PATH="${PATH}:/home/rongfei/.local/bin"
export PATH="${PATH}:/opt/anaconda/bin"
export PATH="${PATH}:/home/rongfei/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    Hyprland
fi
