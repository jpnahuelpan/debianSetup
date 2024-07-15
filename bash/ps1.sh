# add xterm-kitty to case "$TERM"
xterm-kitty | xterm-color | ...

# Git prompt config
source /usr/lib/git-core/git-sh-prompt

PS1='${debian_chroot:+($debian_chroot)}\[\e[01;30;46m\]$(__git_ps1 " git[%s] \[\e[00m\]\[\e[36;107m\]")\[\e[00m\]'
PS1+='\[\e[01;32;107m\] λ(\e[\033[01;34;107m\]\W\[\e[32;107m\])\[\e[0m\]\[\e[97m\]'
PS1+=$'\uE0B0\[\e[0m\] '
