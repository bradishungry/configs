export TERM=xterm-256color
export SHELL=/bin/zsh
if [ -t 1 ]; then exec $SHELL; fi

alias ls='ls -G'

alias tmux="tmux -2"

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source
/usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
