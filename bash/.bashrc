# Harding's bashrc

# prompt
PS1='\[\033[01;30m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$ '

case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;\a\]$PS1"
  ;;
*)
  ;;
esac

# shopt
shopt -s autocd
shopt -s direxpand

# set
set -o noclobber

# environment variables
export PROMPT_DIRTRIM=2
export PATH=$HOME/bin:$HOME/Library/Python/3.7/bin:/usr/local/sbin:$PATH
export JAVA_HOME='/Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home'
export LSCOLORS='ExFxGxDxBxafaeabagacad'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-g -i -M -R -S -w -z-4'

# aliases
alias ls='ls -GF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --colour=auto'
alias df='df -H'
alias du='du -h'
alias type='type -a'
alias d='dirs -v'
alias ..='cd ..'
alias mvim='/Applications/MacVim.app/Contents/bin/mvim'

# pip bash completion start
_pip_completion() {
  COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                 COMP_CWORD=$COMP_CWORD \
                 PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip pip2 pip3
# pip bash completion end

# bash-completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"