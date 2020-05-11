# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# settings history
export HISTSIZE=10000000
export HISTFILESIZE=10000000
export HISTTIMEFORMAT="%F %H:%M:%S "

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,bash_aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

## Export ssh pub key to ForwardAgent
#eval $(ssh-agent -s) && ssh-add ~/.ssh/id_ed25519

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND='echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; history -a'

export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="vim"

# Go lang
export GOPATH=$HOME/development/go-workspace # don't forget to change your path correctly!
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE=on

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# vim to nvim
#alias vim='nvim'
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# go
export GOPATH=$HOME/development/go-workspace # don't forget to change your path correctly!
export GOBIN=$GOPATH/bin
export GOROOT="/snap/go/current/"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO111MODULE=on

# nodejs
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

