if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

alias ls='ls -alh --color=always'
alias dir='ls -alh --color=always'
alias ll='ls -l'
alias cp='cp -iv'
alias rm='rm -i'
alias mv='mv -iv'
alias grep='grep --color=auto -in'
alias ..='cd ..'
