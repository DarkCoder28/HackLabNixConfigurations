#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias cal='cal -n 12'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

if [[ -n $SSH_CONNECTION ]] ; then
    export TERM=xterm
    export PS1="\e[1;31m(REMOTE)\e[0m[\u@\h \W]\$ "
elif [ "$TERM_PROGRAM" == "vscode" ] ; then
    export PS1="\e[1;31m(VSCODE)\e[0m[\u@\h \W]\$ "
elif [ -n "$LAPCE_LOG" ] ; then
    export PS1="\e[1;31m(LAPCE)\e[0m[\u@\h \W]\$ "
else
    neofetch
    eval "$(oh-my-posh init --config $HOME/.config/oh-my-posh/theme.omp.json bash);"
    # --config /usr/share/oh-my-posh/themes/atomic.omp.json bash)"
fi

# Flatpak
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share

# Path Mods
export PATH=/home/agsheeran/.local/bin:$PATH

# Aliases
alias pipes='/usr/bin/bash-pipes -p 8 -t 1 -R'
alias bash-pipes='/usr/bin/bash-pipes -p 8 -t 1 -R'
alias minicom='minicom -b 115200 -D'
alias picocom='picocom -b 115200'
alias esptool='esptool.py'
alias mime='file --mime-type'
alias tenki='tenki --show-fps --timer-mode dvd --mode disable -t 240'
alias clock='tenki'