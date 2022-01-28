# .bashrc

alias cls='clear && ls'
alias vime='vim +Explore'
alias fls='nautilus --new-window --browser ./ >/dev/null 2>/dev/null &'
alias tat='tmux attach -t'

# git editor settings
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR=vim
export USERNAME=keving98g


# Source global definitions
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}

PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\$(parse_git_branch)\[$(tput setaf 2)\]${debian_chroot:+($debian_chroot)}\u@\[$(tput setaf 6)\]\h\[$(tput setaf 7)\] \w \\$ \[$(tput sgr0)\]"

alias ls='ls --color=auto'
alias ll='ls -alh'

# example of sly find exec usage
#
# find -type f -exec bash -c "file {} | grep 'POSIX shell script, ASCII text executable'" \;
#
# find . -name "*.cdf" -exec grep -H string_to_look_for {} \;

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1
